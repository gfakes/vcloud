#!/usr/bin/env python

import sys,traceback,os,datetime,logging,pprint,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# why this approach when there is a trivial way to force the solution?
#
# # trivial implementation w/o feedback:
# ecrm = [ { 'roles' : ['ai-staff',],
#            'emps'  : [validated_login] } ]
# utils.set_ecrm(h.cursor,ecrm)
#
# the above code gives no feedback or useful logging on the console.
# exploding it out like this makes it easy for an admin to know what happened
# without having to dig into logs or SQL...if they wanted to do SQL, this script is a one-liner
def main(h,opts):
    if opts.elogin.strip()=='':
        err = 'missing employee name'
        logging.critical(err)
        raise Exception(err)
    # constants
    DEPT_ID = utils.find_or_insertOne(h.cursor,'departments','department','Radiology')
    AISTAFF_ID = utils.get_id_of(h.cursor,'clinical_roles',['clinical_role','department_id'],['ai-staff',DEPT_ID])
    # probe
    logging.info('mapping employee login %s',opts.elogin)
    employee_id = utils.get_operator(h.cursor,opts.elogin)
    # make new if not existing
    if employee_id==None:
        logging.info('employee login %s does not exist, creating new employee')
        # more constants
        extsys_id = utils.esmeta_find_or_create(h.cursor,(utils.get_config_var(h.cursor,'login-external-system'),
                                                          utils.get_config_var(h.cursor,'login-metasite')))
        idt_id = utils.find_or_insertOne(h.cursor,'identifier_types','identifier_type',utils.get_config_var(h.cursor,'login-identifier-type'))
        # build employee
        emp = { 'identifiers'   : [ { 'identifier'         : opts.elogin.strip(),
                                      'identifier_type_id' : idt_id,
                                      'external_system_id' : extsys_id }, ],
                'employee_name' : opts.elogin.strip(),
                'roles'         : [ AISTAFF_ID, ] }
        # insert
        employee_id = utils.rad_insert_or_update(h.cursor,emp)
        logging.info('employee_id = %s',employee_id)
        print 'created new employee.id=%s and mapped to ai-staff' % employee_id
    # map if required
    else:
        logging.info('employee login %s already exists for employee.id=%s, checking roles',opts.elogin,employee_id)
        # probe current mappings
        current_roles = utils.clinicalroleids_from_empid(h.cursor,employee_id)
        # bail if already mapped
        if AISTAFF_ID in current_roles:
            logging.warning('employee.id=%s already mapped to ai-staff!',employee_id)
            print 'employee.id=%s already mapped to ai-staff!' % employee_id
            return
        # map if not mapped
        else:
            logging.info('employee.id=%s mapped to ai-staff',employee_id)
            crm_id = utils.insert_dict(h.cursor,'employee_clinical_role_mappings',
                                       { 'employee_id'      : employee_id,
                                         'clinical_role_id' : AISTAFF_ID })
            print 'employee.id=%s mapped to ai-staff' % employee_id
    # save changes
    h.db.commit()
    
if __name__ == '__main__':
    DESC = 'map an employee (by SSO login identifier) to ai-staff clinical_role (create if new)'
    SC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC)
        parser.add_argument('elogin',help='SSO login identifier of employee to map')
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-build.log',amqp=False,db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        print 'ERROR: %s' % e
        logging.critical(traceback.format_exc())
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
