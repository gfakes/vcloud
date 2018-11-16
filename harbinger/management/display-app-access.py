#!/usr/bin/env python

import sys,traceback,datetime,json,logging,imp,argparse,os
import tabulate
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')
xl = imp.load_source('excel', '/servers/harbinger/harbinger/general-et/excel.py')

def get_employees_from_role(cursor,role):
    employees = []
    sql = ''' select e.id, e.name
              from employees e left outer join employee_clinical_role_mappings ecrm on ecrm.employee_id=e.id
                   left outer join clinical_roles cr on cr.id=ecrm.clinical_role_id
                   left outer join departments d on d.id=cr.department_id
              where cr.clinical_role=%s and d.department=%s '''
    cursor.execute(sql,(role,'Radiology'))
    temp = cursor.fetchall()
    for row in temp:
        login = get_login(cursor,row['id'])
        e = { 'name'  : row['name'],
              'id'    : row['id'],
              'login' : login }
        employees.append(e)
    return employees

def get_login(cursor,employee_id):
    login = None
    sql = ''' select i.identifier
              from identifiers i left outer join external_systems es on es.id=i.external_system_id
                   left outer join metasites m on m.id=es.metasite_id
                   left outer join identifier_types it on it.id=i.identifier_type_id
              where it.identifier_type=(select configuration_value from configuration_variables where configuration_key=%s) and
                    es.external_system=(select configuration_value from configuration_variables where configuration_key=%s) and
                    m.metasite=(select configuration_value from configuration_variables where configuration_key=%s) and i.employee_id=%s '''
    cursor.execute(sql,('login-identifier-type','login-external-system','login-metasite',employee_id))
    temp = cursor.fetchall()
    for row in temp:
        if login==None:
            login = row['identifier']
        else:
            login += ', %s'%row['identifier']
    return login

def main(h,opts):
    # each app siteconfig is a snowflake :(
    # TODO: add peer-review, progress, exam-status, followup, etc.
    apps = { 'quality' : { 'schema'      : 'analyticscore',
                           'cfg_sql'     : 'select configuration_json from analyticscore.analytics_core_site_config order by id desc limit 1',
                           'acl'         : { 'view'    : 'quality_clinical_roles_auth_list',
                                            'builder' : 'quality_builder_clinical_roles_auth_list' },
                           'default_acl' : { 'view'    : ["finance", "director", "ai-staff", "it-staff", "supervisor", "executive"],
                                             'builder' : ["finance", "director", "ai-staff", "it-staff", "supervisor", "executive"] },
                           'connection'  : None },
             'productivity' : { 'schema'      : 'analyticscore',
                                'cfg_sql'     : 'select configuration_json from analyticscore.analytics_core_site_config order by id desc limit 1',
                                'acl'         : { 'access' : 'productivity_clinical_roles_auth_list' },
                                'default_acl' : { 'access' : ["finance", "director", "ai-staff", "it-staff", "supervisor", "executive"] },
                                'connection'  : None },
             'scanner-utilization' : { 'schema'      : 'scanner-utilization',
                                       'cfg_sql'     : "select configuration_value from scannerutilization.scannerutilization_site_configurations where configuration_key='general_authorization_roles'",
                                       'acl'         : { 'access' : None },
                                       'default_acl' : { 'access' : ["finance", "director", "supervisor", "executive", "attending", "technologist", "scheduler-registrar","ai-staff","it-staff", "resident", "fellow-acgme", "fellow-non-acgme", "radiologist"] },
                                       'connection' : None },
             'report-search' : { 'schema'      : 'report-search',
                                 'cfg_sql'     : 'select configuration_json from aisearch.aisearch_site_configurations order by id desc limit 1',
                                 'acl'         : { 'access' : 'clinical_roles_auth_list' },
                                 'default_acl' : { 'access' : ["it-staff","ai-staff"] },
                                 'connection'  : None } }
    # setup output
    warning = False
    output_table = []
    output_xl = []
    HEADER = ['Application','ACL','Unique Employees','clinical_roles']
    if not opts.roles:
        HEADER = HEADER[:-1]
    XL_HEADER = ['Application','ACL','Employee Name','Employee Login(s)']
    # iterate each app
    for app in apps.keys():
        a = apps[app]
        if h.conf(a['schema'],'login')!=None:
            a['connection'] = utils.schemaConnect(a['schema'],opts.config)
        else:
            output_table.append(['%s (cannot connect to db)'%app,'N/A','N/A','N/A'])
            warning = True
            continue
        cursor = a['connection'].cursor
        cursor.execute(a['cfg_sql'])
        temp = cursor.fetchone()
        # iterate each ACL for an app
        for level in a['acl']:
            roles = []
            employees = []
            # determine roles that can access each ACL
            if temp==None: # handle no db results (new install/default options)
                roles = a['default_acl'][level]
            else: # load from db
                raw = json.loads(temp.values()[0]) # this is pretty bad form
                # special-case for SU
                if a['acl'][level]==None:
                    roles = raw
                # normal case is JSON
                else:
                    roles = raw.get(a['acl'][level],[])
            # process roles for an ACL
            for role in roles:
                employees += get_employees_from_role(h.cursor,role)
            if opts.excel:
                for employee in employees:
                    output_xl.append([app,level,employee['name'],employee['login']])
            count = len(set([x['id'] for x in employees]))
            printable_roles = ', '.join(roles)
            #import code; code.interact(local=locals()) # DEBUG
            if set(roles) == set(a['default_acl'][level]):
                printable_roles = 'application-default'
            row = [app,level,len(employees),printable_roles]
            if not opts.roles:
                row = row[:-1]
            output_table.append(row)
    logging.info(tabulate.tabulate(output_table,HEADER,tablefmt="psql"))
    print
    print tabulate.tabulate(output_table,HEADER,tablefmt="psql")
    if warning:
        print
        logging.warning('one or more apps are either not installed or %s is not configured with the db connection info',opts.config)
        print 'one or more apps are either not installed\n or\n%s is not configured with the db connection info'%opts.config
    print
    if opts.excel:
        timestamp = datetime.datetime.now().strftime('%Y%m%d')
        filename = 'app-access-details-%s.xls' % timestamp
        sheetname = 'App Access %s' % timestamp
        reportfile = os.path.join(h.conf('local-paths','reports-dir'),filename)
        sheets = [xl.make_sheet(output_xl,sheetname,XL_HEADER)]
        logging.info('writing excel file %s',reportfile)
        xl.write_big_xls(reportfile,sheets)
        print 'wrote full details with employee logins to %s'%reportfile
        print

if __name__ == '__main__':
    DESC = 'display users who can access installed apps'
    SC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC)
        parser.add_argument('--excel', help='export spreadsheet of employees per ACL per app (default=off)', action='store_true')
        parser.add_argument('--roles', help='display column of roles for each ACL (default=off)', action='store_true')
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True)
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
