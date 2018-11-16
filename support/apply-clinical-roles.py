#!/usr/bin/env python

import sys,traceback,os,datetime,logging,pprint,imp
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def add_roles(employee_id, roles, ROLES_CACHE, curs):
    sql = ''' select cr.clinical_role, cr.id
              from employee_clinical_role_mappings ecrm left outer join clinical_roles cr on cr.id=ecrm.clinical_role_id
              where ecrm.employee_id=%s '''
    curs.execute(sql,(employee_id,))
    existing_roles = curs.fetchall()
    for role in roles:
        if role in [x['clinical_role'] for x in existing_roles]:
            logging.warning('employee.id=%s already has clinical_role=%s mapped',employee_id,role)
        else:
            #import code; code.interact(local=locals())
            crm_id = utils.insert_dict(curs,'employee_clinical_role_mappings',
                                       { 'employee_id'      : employee_id,
                                         'clinical_role_id' : ROLES_CACHE[role] })
            logging.debug('inserted employee_clinical_role_mappings.id=%s',crm_id)

def process_group(identifiers, roles, ID_ES, LOGIN_IDT, ROLES_CACHE, curs):
    for ident in identifiers:
        employee_id = utils.empid_from_ident(curs,ident,LOGIN_IDT,ID_ES)
        if employee_id == None:
            person_id = utils.insert_dict(curs,'people',{'name':ident})
            employee_id = utils.insert_dict(curs,'employees',
                                            { 'name'      : ident,
                                              'active'    : True,
                                              'person_id' : person_id })
            logging.info('creating new employee for identifier=%s, new employee.id=%s',ident,employee_id)
            utils.update_dict(curs,'people',
                              { 'id'                  : person_id,
                                'current_employee_id' : employee_id })
            l_id = utils.insert_dict(curs,'identifiers',
                                     { 'identifier'         : ident,
                                       'employee_id'        : employee_id,
                                       'identifier_type_id' : LOGIN_IDT,
                                       'external_system_id' : ID_ES })
        add_roles(employee_id, roles, ROLES_CACHE, curs)

def main():
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','ai-install.log',amqp=False,db=True,schema='harbinger-rw')
    MS = utils.find_or_insertOne(h.hcurs,'metasites','metasite','AI')
    ES = utils.find_or_insertSimple(h.hcurs,'external_systems',{'external_system':'Virtual Hospital','metasite_id':MS})
    LOGIN_IDT = utils.find_or_insertOne(h.hcurs,'identifier_types','identifier_type','UID')
    role_sql = ''' select id,clinical_role from clinical_roles '''
    h.hcurs.execute(role_sql)
    temp = h.hcurs.fetchall()
    ROLES_CACHE = {}
    for row in temp:
        ROLES_CACHE[row['clinical_role']] = row['id']
    # DO IT
    HARBINGER = ['mdaly','ctoland','mwarnock','cmeenan','rsna','demo','madams']
    process_group(HARBINGER, ['ai-staff',], ES, LOGIN_IDT, ROLES_CACHE, h.hcurs)
    h.hdb.commit()
    h.close()
    logging.info('finished')

if __name__ == '__main__':
    try:
        main()
    except:
        logging.critical(traceback.format_exc())
        print traceback.format_exc()
        sys.exit(1)
    sys.exit(0)
