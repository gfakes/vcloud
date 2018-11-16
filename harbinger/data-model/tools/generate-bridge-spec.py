#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,os,argparse
import tabulate
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')
xl = imp.load_source('excel', '/servers/harbinger/harbinger/general-et/excel.py')

def build_data_types_sheet(cursor):
    sql = 'select data_type, json_type, sql_type, comments from documentation.data_types'
    header = ['Data Type','JSON Type','SQL Type','Comments']
    printable = []
    cursor.execute(sql)
    dts = cursor.fetchall()
    for row in dts:
        comments = ' and '.join(['[%s](%s)'%(x,x) for x in row['comments'].split(' and ')])
        printable.append([row['data_type'],row['json_type'],row['sql_type'],comments])
    title = 'Data Types'
    sheet = xl.make_sheet(printable,title,header)
    return sheet

def build_message_sheet(cursor,department,message_type):
    sql = ''' select de.json_key, de.industry_aliases, de.description, mem.mandatory, dt.data_type
              from documentation.message_types mt left outer join documentation.department_models dm on mt.department_model_id=dm.id
                   left outer join documentation.message_element_mappings mem on mem.message_type_id=mt.id
                   left outer join documentation.data_elements de on de.id=mem.data_element_id
                   left outer join documentation.data_types dt on dt.id=de.data_type_id
              where dm.department=%s and mt.message_type=%s order by de.json_key '''
    header = ['Key','Type','Mandatory?','Description','Aliases']
    printable = []
    cursor.execute(sql,(department,message_type))
    elements = cursor.fetchall()
    for element in elements:
        mandatory = 'No'
        if element['mandatory']:
            mandatory = 'Yes'
        restored = element['description'].replace('&gt;','>').replace('&lt;','<')
        row = [element['json_key'], element['data_type'], mandatory, element['description'], element['industry_aliases']]
        #if '&' in element['description']:
        #    print element['json_key'], element['description']
        printable.append(row)
    title = '.'.join([department,message_type])
    sheet = xl.make_sheet(printable,title,header)
    return sheet

def sheet2md(sheet,comments=None):
    md = '## %s\n\n' % sheet[0]
    if comments!=None:
        md = '## %s\n\n%s\n\n' % (sheet[0],comments)
    md += tabulate.tabulate(sheet[2],sheet[1],tablefmt="pipe")
    md += '\n\n'
    return md

def main(h,opts):
    version = utils.get_config_var(h.hcurs,'data-model-version')
    if version==None:
        logging.critical('unable to determine data-model-version, aborting documentation generation')
        raise Exception('Missing data-model-version in database configuration_variables')
    xl_filename = os.path.join(h.conf('local-paths','reports-dir'),'bridge-message-spec-%s.xls'%(version,))
    md_filename = os.path.join(h.conf('local-paths','reports-dir'),'bridge-message-spec-%s.md'%(version,))
    f = open(md_filename,'wb')
    sheets = []
    dept_sql = 'select id,department from documentation.department_models'
    mt_sql = 'select message_type,comments,hl7_type,hl7_trigger_events from documentation.message_types where department_model_id=%s'
    h.hcurs.execute(dept_sql)
    depts = h.hcurs.fetchall()
    markdown = 'version %s - [Download Excel Version](%s)\n\n' % (version,'bridge-message-spec-%s.xls'%(version,))
    markdown += sheet2md(build_data_types_sheet(h.hcurs))
    for dept in depts:
        markdown += '# %s \n\n'%dept['department']
        #import code; code.interact(local=locals())
        h.hcurs.execute(mt_sql,(dept['id'],))
        message_types = h.hcurs.fetchall()
        for mt in message_types:
            sheet = build_message_sheet(h.hcurs,dept['department'],mt['message_type'])
            sheets.append(sheet)
            comments = mt['comments']
            if mt['hl7_type']!=None:
                comments = '**HL7 %s.%s**\n\n%s' % (mt['hl7_type'],mt['hl7_trigger_events'],mt['comments'])
            markdown += sheet2md(sheet,comments)
    xl.write_big_xls(xl_filename,sheets)
    f.write(markdown)
    f.close()
    logging.info('wrote Bridge spec to %s',xl_filename)
    logging.info('wrote Bridge spec to %s',md_filename)
    print 'wrote Bridge spec to %s' % xl_filename
    print 'wrote Bridge spec to %s' % md_filename

if __name__ == '__main__':
    DESC = 'generate Bridge message spec for current data model based on documentation schema'
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
