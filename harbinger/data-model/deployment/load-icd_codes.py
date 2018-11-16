#!/usr/bin/env python

import sys,traceback,os,logging,pprint,csv,zipfile,re,imp,argparse
import tqdm
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def get_current_revision(h,version):
    current_revision = None
    sql = ''' select icd_code_revision
              from icd_code_revisions
              where active=%s and icd_code_version=%s '''
    h.hcurs.execute(sql,(True,version))
    temp = h.hcurs.fetchone()
    if temp!=None:
        current_revision = temp['icd_code_revision']
    return current_revision

def process_revision(h,rev_id,codes_file,offsets):
    count = 0
    for row in tqdm.tqdm(codes_file,desc='ICD Codes',leave=True):
        name = utils.unicode_or_empty(row[offsets['name_start']:offsets['name_stop']])
        desc = utils.unicode_or_empty(row[offsets['desc_start']:offsets['desc_stop']])
        logging.debug(pprint.pformat(row))
        temp = { 'code'                 : name.strip(),
                 'description'          : desc.strip(),
                 'icd_code_revision_id' : rev_id }
        utils.insert_dict(h.hcurs,'icd_codes',temp)
        count += 1
    print #tqdm
    logging.debug('inserted %s codes',count)
    return count

def insert_revision(h,revision,version):
    icd_code_revision_id = None
    # disable old revision(s) first
    disable_sql = '''update icd_code_revisions set active=%s where icd_code_version=%s'''
    h.hcurs.execute(disable_sql,(False,version))
    rev = { 'icd_code_revision' : revision,
            'icd_code_version'  : version,
            'active'            : True }
    icd_code_revision_id = utils.insert_dict(h.hcurs,'icd_code_revisions',rev)
    logging.debug('inserted %s revision %s at icd_code_revisions.id=%s',version,revision,icd_code_revision_id)
    return icd_code_revision_id

def get_revision(codefile,version):
    revision = None
    if version=='ICD-10-CM':
        revision = codefile.split('.')[0].split('_')[-1]
    elif version=='ICD-9-CM':
        revision = codefile.split('_')[0]
    return revision

def filename_doublecheck(re1,re2,fname):
    if re1.search(fname) and re2.search(fname):
        return True
    return False

def load_code_file(h,version,zfile):
    if version=='ICD-9-CM':
        # only supports >= v28
        # pre-v28 filenames are inconsistent
        # pre-v28 not always long desc or text files
        offsets = { 'name_start' : 0,
                    'name_stop'  : 5,
                    'desc_start' : 6,
                    'desc_stop'  : -1 }
        codefile_regex = re.compile('DESC_LONG_DX',re.IGNORECASE)
    elif version=='ICD-10-CM':
        # only supports >= 2012
        # pre-2012 don't have order files
        offsets = { 'name_start' : 6,
                    'name_stop'  : 13,
                    'desc_start' : 77,
                    'desc_stop'  : -1 }
        codefile_regex = re.compile('order',re.IGNORECASE)
    else:
        logging.warning('skipping unknown ICD version %s',version)
        raise Exception('Unknown ICD Version Exception')
    load_codes(h,version,zfile,codefile_regex,offsets)

def load_codes(h,version,zfile,codefile_regex,offsets):
    txt_re = re.compile('\.txt',re.IGNORECASE)
    codes_filename = None
    # walk the zip file
    z = zipfile.ZipFile(zfile,'r')
    manifest = z.infolist()
    for item in manifest:
        if filename_doublecheck(codefile_regex,txt_re,item.filename):
            codes_filename = item.filename
            codes_file = z.open(codes_filename)
            logging.info('  codes file: %s',codes_filename)
        else:
            logging.info('skipping file: %s',item.filename)
    # make sure everything is in place before processing
    if codes_filename==None:
        logging.critical('unable to find code file, unable to continue')
        raise Exception('ICD File Exception')
    # insert the revision
    revision = get_revision(codes_filename,version)
    current_revision = get_current_revision(h,version)
    logging.info('currently loaded revision is %s',current_revision)
    if revision==current_revision:
        logging.warning('skipping load of revision %s, already loaded!',revision)
        return
    logging.info('starting to load file %s',codes_filename)
    icd_code_revision_id = insert_revision(h,revision,version)
    # insert the codes
    count = process_revision(h,icd_code_revision_id,codes_file,offsets)
    h.hdb.commit()
    logging.info('finished inserting %s codes of %s revision %s',count,version,revision)

def main(h,opts):
    versions = h.conf('icd_codes','active')
    for key in versions:
        icd_file = h.conf(key,'filepath')
        icd_version = h.conf(key,'version')
        if icd_file==None:
            logging.info('skipping %s, "filepath" not defined in site.config.json',t)
        else:
            logging.info('loading %s file %s',icd_version,icd_file)
            load_code_file(h,icd_version,icd_file)

if __name__ == '__main__':
    DESC = 'load ICD codes'
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
