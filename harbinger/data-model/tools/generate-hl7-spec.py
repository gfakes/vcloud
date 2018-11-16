#!/usr/bin/env python

import sys,traceback,logging,imp,os,argparse,collections
import tabulate
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')
xl = imp.load_source('excel', '/servers/harbinger/harbinger/general-et/excel.py')

def build_message_sheet(cursor,message_type,header):
    sql = ''' select de.hl7_default_location, de.hl7_repeating, de.hl7_mandatory, de.json_key,
                     de.industry_aliases, de.description, mem.mandatory, dt.data_type
              from documentation.message_element_mappings mem left outer join documentation.data_elements de on de.id=mem.data_element_id
                   left outer join documentation.data_types dt on dt.id=de.data_type_id
              where mem.message_type_id=%s and de.hl7_default_location is not null order by de.json_key '''
    printable = []
    cursor.execute(sql,(message_type['mtid'],))
    elements = cursor.fetchall()
    for element in elements:
        repeating = required = mandatory = 'No'
        if element['mandatory']:
            required = 'Yes'
        if element['hl7_mandatory']:
            mandatory = 'Yes'
        if element['hl7_repeating']:
            repeating = 'Yes'
        restored = element['description'].replace('&gt;','>').replace('&lt;','<') # ARGH!
        row = [element['json_key'], element['hl7_default_location'],repeating,mandatory,required,restored,
               element['industry_aliases']]
        printable.append(row)
    sheet = xl.make_sheet(printable,message_type['bridge_type'],header)
    return sheet

def get_supported_message_types(cursor):
    message_types = []
    sql = ''' select dm.department, mt.message_type, mt.comments, mt.hl7_type, mt.hl7_trigger_events, mt.id mtid
              from documentation.message_types mt left outer join documentation.department_models dm on dm.id=mt.department_model_id
              where mt.hl7_type is not null order by mt.hl7_type asc'''
    cursor.execute(sql)
    raw = cursor.fetchall()
    for row in raw:
        bridge_type = '%s.%s' % (row['department'],row['message_type'])
        message_type = { 'bridge_type'        : bridge_type,
                         'hl7_type'           : row['hl7_type'],
                         'hl7_trigger_events' : row['hl7_trigger_events'],
                         'comments'           : row['comments'],
                         'mtid'               : row['mtid'] }
        message_types.append(message_type)
    return message_types

def build_summary_sheet(message_types):
    printable = []
    header = ['Bridge Message Type','Description','HL7 Message Type','Supported HL7 Trigger Events']
    for message_type in message_types:
        printable.append([message_type['bridge_type'],message_type['comments'],message_type['hl7_type'],message_type['hl7_trigger_events']])
    sheet = xl.make_sheet(printable,'Summary',header)
    return sheet

def build_definitions_sheet(defs):
    header = ['Specification Field','Definition']
    printable = [[k,v] for k,v in defs.iteritems()]
    sheet = xl.make_sheet(printable,'Definitions',header)
    return sheet

def main(h,opts):
    version = utils.get_config_var(h.hcurs,'data-model-version')
    if version==None:
        logging.critical('unable to determine data-model-version, aborting documentation generation')
        raise Exception('Missing data-model-version')
    xl_filename = os.path.join(h.conf('local-paths','reports-dir'),'bridge-hl7-spec-%s.xls'%version)
    md_filename = os.path.join(h.conf('local-paths','reports-dir'),'bridge-hl7-spec-%s.md'%version)
    f = open(md_filename,'wb')
    sheets = []
    defs = collections.OrderedDict()
    raw = [('Bridge Element'    , 'Bridge message key'),
           ('Typical HL7 Field' , 'Most common location in HL7'),
           ('HL7 Repeating?'    , 'Does this field typically contain repeating values?'),
           ('Mandatory?'        , 'Is this field mandatory for application functionality?'),
           ('Required?'         , 'Is this field required for a message to be accepted?'),
           ('Description'       , 'Detailed description of semantic meaning'),
           ('Aliases'           , 'Common industry synonyms')]
    for k,v in raw:
        defs[k]=v
    message_types = get_supported_message_types(h.hcurs)
    markdown = 'version %s - [Download Excel Version](%s)\n\n' % (version,'bridge-hl7-spec-%s.xls'%(version,))
    summary = build_summary_sheet(message_types)
    markdown += sheet2md(summary)
    sheets.append(summary)
    definitions = build_definitions_sheet(defs)
    markdown += sheet2md(definitions)
    sheets.append(definitions)
    markdown += '# Supported Messages\n\n'
    for message_type in message_types:
        #import code; code.interact(local=locals()) # DEBUG
        sheet = build_message_sheet(h.hcurs,message_type,defs.keys())
        sheets.append(sheet)
        markdown += sheet2md(sheet)
    xl.write_big_xls(xl_filename,sheets)
    f.write(markdown)
    f.close()
    logging.info('wrote HL7 spec to %s',xl_filename)
    logging.info('wrote HL7 spec to %s',md_filename)
    print 'wrote HL7 spec to %s' % xl_filename
    print 'wrote HL7 spec to %s' % md_filename

def sheet2md(sheet):
    md = '## %s\n\n' % sheet[0]
    md += tabulate.tabulate(sheet[2],sheet[1],tablefmt="pipe")
    md += '\n\n'
    return md

if __name__ == '__main__':
    DESC = 'generate HL7 message spec for current data model based on documentation schema'
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',db=True,amqp=False)
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
