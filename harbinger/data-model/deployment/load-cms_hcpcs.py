#!/usr/bin/env python

import sys,traceback,os,logging,pprint,csv,zipfile,re,imp,argparse
import tqdm
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def get_current_revision(h):
    current_revision = None
    sql = ''' select revision from cms_hcpcs_code_revisions where active=%s '''
    h.hcurs.execute(sql,(True,))
    temp = h.hcurs.fetchone()
    if temp!=None:
        current_revision = temp['revision']
    return current_revision

def supply_filter(code,regex):
    supply = False
    if code!=None and regex.search(code)!=None and code not in ['G0202','G0204','G0206','0159T']:
        supply = True
    return supply

def surg_filter(code,surgset):
    surg = False
    if code in surgset:
        surg = True
    return surg

def process_revision(h,rev_id,codes_file):
    supregex = re.compile('[a-zA-Z]')
    surgset = set(map(str,range(10021,65000,1)))
    reader = utils.open_csv(codes_file,skip=5,headcount=5)
    loaded_count = 0
    for row in tqdm.tqdm(reader,desc='HCPCS Codes',leave=True):
        row = utils.emptys_to_none(row)
        if row['hcpcs'] in (None,'\x1a'):
            logging.warning('skipping odd-looking row:\n%s',pprint.pformat(row,width=1))
            continue
        logging.debug(pprint.pformat(row))
        temp = { 'hcpcs'                      : row['hcpcs'],
                 'description'                : utils.unicode_or_empty(row['description']),
                 'surgical'                   : surg_filter(row['hcpcs'],surgset),
                 'supply'                     : supply_filter(row['hcpcs'],supregex),
                 'work_rvu'                   : row['work rvu'],
                 'nonfacility_pe_rvu'         : row['non-fac pe rvu'],
                 'facility_pe_rvu'            : row['facility pe rvu'],
                 'mp_rvu'                     : row['mp rvu'],
                 'conversion_factor'          : row['conv factor'],
                 'cms_modifier_id'            : utils.find_or_insertOne(h.hcurs,'cms_modifiers','modifier',row['mod']),
                 'cms_hcpcs_code_revision_id' : rev_id }
        utils.insert_dict(h.hcurs,'cms_hcpcs_codes',temp)
        loaded_count += 1
    print # tqdm
    logging.info('loaded %s codes',loaded_count)

# this does not appear to be necessary :/
def process_locality(loc_file):
    localities = {}
    raw = utils.open_csv(loc_file,skip=2)
    state = None
    for row in raw:
        if row['locality number']=='' or set(row.values())==set(['']):
            continue
        if row['state']!='':
            last_state = row['state'].strip()
        if row['carrier number'] not in localities:
            localities[row['carrier number']] = {}
        locality_name = ' '.join([last_state,row['fee schedule area'].strip(),row['counties'].strip()])
        localities[row['carrier number']][row['locality number']] = locality_name
    return localities

def process_gpci(h,rev_id,loc_file,gpci_file):
    #localities = process_locality(loc_file)
    CARRIER_IDX = 0
    LOC_IDX = 1
    LOC_NAME_IDX = 2
    WORK = 3
    PE = 4
    MP = 5
    reader = csv.reader(gpci_file)
    reader.next() # file title/info
    reader.next() # empty or blank w/ ,s
    row = reader.next() # always header
    if len(row)==6: # default header logic
        logging.info('GPCI file appears to have 3 info columns (normal)')
    elif len(row)==9: # idk, the 2k11 use case?
        logging.info('GPCI file appears to have >3 info columns (abnormal)')
        WORK = 6
        PE = 7
        MP = 8
    else: # fail
        logging.critical('unable to determine which columns to extract GPCI values from, please inspect')
        raise Exception('GPCI Loading Exception')
    for row in reader:
        if len(row)<max([CARRIER_IDX,LOC_IDX,WORK,PE,MP]) or set(row)==set(['']):
            logging.info('done reading GPCI rows')
            break
        gpci = { 'work_gpci'                  : row[WORK],
                 'pe_gpci'                    : row[PE],
                 'mp_gpci'                    : row[MP],
                 'carrier'                    : row[CARRIER_IDX],
                 'locality'                   : row[LOC_IDX],
                 'locality_name'              : row[LOC_NAME_IDX],
                 'cms_hcpcs_code_revision_id' : rev_id }
        utils.insert_dict(h.hcurs,'cms_gpci',gpci)

def filename_doublecheck(re1,re2,fname):
    if re1.search(fname) and re2.search(fname):
        return True
    return False

def load_codes(zfile,h):
    loc_re = re.compile('LOCCO',re.IGNORECASE)
    rvu_re = re.compile('PPRRVU',re.IGNORECASE)
    gpci_re = re.compile('GPCI',re.IGNORECASE)
    csv_re = re.compile('\.csv',re.IGNORECASE)
    codes_filename = gpci_filename = loc_filename = None
    # walk the zip file
    z = zipfile.ZipFile(zfile,'r')
    manifest = z.infolist()
    for item in manifest:
        if filename_doublecheck(rvu_re,csv_re,item.filename):
            revision = os.path.split(zfile)[1][:-4]
            logging.info('  determined revision: %s',revision)
            codes_filename = item.filename
            codes_file = z.open(codes_filename)
            logging.info('  codes file: %s',codes_filename)
        elif filename_doublecheck(gpci_re,csv_re,item.filename):
            gpci_filename = item.filename
            gpci_file = z.open(gpci_filename)
            logging.info('  GPCI file: %s',gpci_filename)
        elif filename_doublecheck(loc_re,csv_re,item.filename):
            loc_filename = item.filename
            loc_file = z.open(loc_filename)
            logging.info('  Locality file: %s',loc_filename)
        else:
            logging.info('skipping file: %s',item.filename)
    # make sure everything is in place before processing
    if gpci_filename==None or loc_filename==None:
        logging.critical('unable to find GPCI/locality file(s), unable to continue')
        raise Exception('GPCI/Locality Failure')
    if codes_filename==None:
        logging.critical('unable to find RVU file, unable to continue')
        raise Exception('RVU Exception')
    # prevent dupe load
    current_revision = get_current_revision(h)
    logging.info('currently loaded revision is %s',current_revision)
    if revision==current_revision:
        logging.warning('skipping load of revision %s, already loaded!',revision)
        return
    logging.info('starting to load revision %s',revision)
    # set old revisions to inactive
    h.hcurs.execute('update cms_hcpcs_code_revisions set active=%s',(False,))
    # insert the revision
    cms_hcpcs_revision_id = utils.insert_dict(h.hcurs,'cms_hcpcs_code_revisions',{'revision':revision,'active':True})
    # insert the GPCI table
    process_gpci(h,cms_hcpcs_revision_id,loc_file,gpci_file)
    # insert the codes
    process_revision(h,cms_hcpcs_revision_id,codes_file)
    h.hdb.commit()

def main(h,opts):
    CMS_FILE = h.conf('hcpcs','filepath')
    if CMS_FILE==None:
        # try old conf value
        CMS_FILE = h.conf('cpt','filepath')
    logging.info('loading file %s',CMS_FILE)
    load_codes(CMS_FILE,h)

if __name__ == '__main__':
    DESC = 'load CMS HCPCS codes'
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=DSC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
