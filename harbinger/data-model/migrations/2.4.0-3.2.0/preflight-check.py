#!/usr/bin/env python

import sys,traceback,logging,pprint,imp
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def validate(cursor):
    valid = True
    # 2.4.00
    reference = { 'departments'    : { 'data' : [ {'department': 'Radiology', 'id': 1}, ],
                                       'sql'  : 'select id, department from departments order by id' },
                  'clinical_roles' : { 'data' : [ {'clinical_role': 'radiologist', 'id': 1, 'department_id': 1},
                                                  {'clinical_role': 'resident', 'id': 2, 'department_id': 1},
                                                  {'clinical_role': 'attending', 'id': 3, 'department_id': 1},
                                                  {'clinical_role': 'fellow-acgme', 'id': 4, 'department_id': 1},
                                                  {'clinical_role': 'fellow-non-acgme', 'id': 5, 'department_id': 1},
                                                  {'clinical_role': 'technologist', 'id': 6, 'department_id': 1},
                                                  {'clinical_role': 'transcriptionist', 'id': 7, 'department_id': 1},
                                                  {'clinical_role': 'scheduler-registrar', 'id': 8, 'department_id': 1},
                                                  {'clinical_role': 'finance', 'id': 9, 'department_id': 1},
                                                  {'clinical_role': 'admin-assistant', 'id': 10, 'department_id': 1},
                                                  {'clinical_role': 'it-staff', 'id': 11, 'department_id': 1},
                                                  {'clinical_role': 'support-staff', 'id': 12, 'department_id': 1},
                                                  {'clinical_role': 'supervisor', 'id': 13, 'department_id': 1},
                                                  {'clinical_role': 'director', 'id': 14, 'department_id': 1},
                                                  {'clinical_role': 'executive', 'id': 15, 'department_id': 1},
                                                  {'clinical_role': 'power', 'id': 16, 'department_id': 1},
                                                  {'clinical_role': 'billing-coding', 'id': 17, 'department_id': 1},
                                                  {'clinical_role': 'nurse', 'id': 18, 'department_id': 1},
                                                  {'clinical_role': 'patient-transport', 'id': 19, 'department_id': 1},
                                                  {'clinical_role': 'ai-staff', 'id': 20, 'department_id': 1},
                                                  {'clinical_role': 'researcher', 'id': 21, 'department_id': 1} ],
                                       'sql'  : 'select id, clinical_role, department_id from clinical_roles order by id' },
                  'trip_statuses'  : { 'data' : [ {'status': 'order', 'id': 1, 'description': 'an electronic order is entered into the order placer system requesting an exam'},
                                                  {'status': 'arrived', 'id': 2, 'description': 'patient check-in at the imaging facility'},
                                                  {'status': 'first image', 'id': 3, 'description': 'the time when the imaging device begins to collect data that will be used to create the first image'},
                                                  {'status': 'complete', 'id': 4, 'description': 'all images are acquired and reconstructed'},
                                                  {'status': 'prelim', 'id': 5, 'description': 'a preliminary report was created'},
                                                  {'status': 'final', 'id': 6, 'description': 'a final report was created'},
                                                  {'status': 'addendum', 'id': 7, 'description': 'the final report is addended'},
                                                  {'status': 'cancelled', 'id': 8, 'description': 'the exam is cancelled'},
                                                  {'status': 'begin', 'id': 9, 'description': 'the exam process has been started'},
                                                  {'status': 'scheduled', 'id': 10, 'description': 'the exam has been scheduled with an appointment time'},
                                                  {'status': 'dictated', 'id': 11, 'description': 'the exam has been read and a report has been dictated, but not necessarily generally or elctronically available'},
                                                  {'status': 'charged', 'id': 12, 'description': 'the charge has been sent to the billing company (but not necessarily coded or verified)'},
                                                  {'status': 'claimed', 'id': 13, 'description': 'the claim has been sent to a carrier or individual'},
                                                  {'status': 'denied', 'id': 14, 'description': 'the claim has been denied'},
                                                  {'status': 'appealed', 'id': 15, 'description': 'the claim denial has been appealed'},
                                                  {'status': 'payment', 'id': 16, 'description': 'a payment has been made on the claim'},
                                                  {'status': 'zero balance', 'id': 17, 'description': 'the claim has been fully collected'},
                                                  {'status': 'admit', 'id': 18, 'description': 'patient admitted to hospital'},
                                                  {'status': 'transfer', 'id': 19, 'description': 'patient has been moved/transferred to another location'},
                                                  {'status': 'discharge', 'id': 20, 'description': 'patient has been discharged'},
                                                  {'status': 'register', 'id': 21, 'description': 'patient has been registered'},
                                                  {'status': 'pre-admit', 'id': 22, 'description': 'patient is not yet admitted'},
                                                  {'status': 'cancel admit', 'id': 23, 'description': 'patient admission has been cancelled'},
                                                  {'status': 'cancel discharge', 'id': 24, 'description': 'patient discharge has been cancelled'},
                                                  {'status': 'corrections', 'id': 26, 'description': 'report is being revised for corrections'},
                                                  {'status': 'adjustment', 'id': 27, 'description': 'the claim has been adjusted'} ],
                                       'sql'  : 'select id, status, description from trip_statuses order by id' } }
    logging.info('checking database version...')
    valid = check_version(cursor)
    logging.info('finished checking database version, pass=%s',valid)
    logging.info('checking reference table content...')
    for table in reference.keys():
        logging.info('...checking table %s',table)
        tvalid = validate_table(cursor,reference[table]['sql'],reference[table]['data'])
        if not tvalid:
            valid = False
            logging.critical('   table %s pass=%s',table,tvalid)
        else:
            logging.info('   table %s pass=%s...',table,tvalid)
    logging.info('...completed checking reference tables.  Safe to upgrade? %s',valid)
    return valid

def check_version(cursor):
    TARGET_VERSION = 'cc6abd2b4056a9c1b0202498caa2a050898a83d8' #2.4.00
    valid = False
    sql = 'select configuration_value from configuration_variables where configuration_key = %s'
    cursor.execute(sql,('data-model-commit-id',))
    current_version = cursor.fetchone()
    logging.info('target db version  = %s',TARGET_VERSION)
    if current_version!=None:
        current_version = current_version['configuration_value']
        logging.info('current db version = %s',current_version)
        if current_version==TARGET_VERSION:
            valid = True
            logging.info('current db version matches target!')
        else:
            logging.critical('current db version does not match target!')
    else:
        logging.critical('no current db version loaded in configuration_variables!')
    return valid

def validate_table(cursor,sql,REFERENCE):
    valid = False
    cursor.execute(sql)
    results = cursor.fetchall()
    if results!=None:
        formatted = []
        for row in results:
            formatted.append(dict(zip(row.keys(),[row[k] for k in row.keys()])))
        if formatted == REFERENCE:
            valid = True
    return valid

def main():
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
    logging.info('pre-flight check for DM3 upgrade')
    safe = validate(h.hcurs)
    h.close()
    if not safe:
        logging.critical('Unable to safely upgrade to data model 3.0!')
        raise Exception('Unable to safely upgrade to data model 3.0!')
    else:
        logging.info('Able to safely upgrade to data model 3.0!')

if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    sys.exit(0)
