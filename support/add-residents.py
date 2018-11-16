#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,os,argparse
from faker import Faker # sudo apt-get install python-pip; sudo pip install fake-factory
from faker.providers import BaseProvider
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def generate_residents(cursor,fake,count):
    resident_eids = []
    # stupid constants
    UID_IDT = utils.find_or_insertOne(cursor,'identifier_types','identifier_type','UID')
    MS = utils.find_or_insertOne(cursor,'metasites','metasite','AI')
    ES = utils.find_or_insertSimple(cursor,'external_systems',{'external_system':'Virtual Hospital','metasite_id':MS})
    RAD_DEPARTMENT = utils.find_or_insertOne(cursor,'departments','department','Radiology')
    RES_ROLE = utils.find_or_insertOne(cursor,'clinical_roles','clinical_role','resident')
    RAD_ROLE = utils.find_or_insertOne(cursor,'clinical_roles','clinical_role','radiologist')
    RES_SPEC = utils.find_or_insertSimple(cursor,'specialties',{ 'department_id' : RAD_DEPARTMENT, 'specialty' : 'Resident' } )
    while count!=0:
        name = fake.first_name()+' '+fake.last_name()
        identifier = { 'identifier'         : name,
                       'identifier_type_id' : UID_IDT,
                       'external_system_id' : ES }
        resident = { 'employee_name' : name,
                     'active'        : True,
                     'roles'         : [RES_ROLE,RAD_ROLE],
                     'identifiers'   : [identifier,],
                     'specialties'   : [RES_SPEC,] }
        eid = utils.rad_insert_or_update(cursor,resident)
        resident_eids.append(eid)
        count -= 1
    return resident_eids

def update_existing(cursor,fake):
    # constants
    RAD_DEPARTMENT = utils.find_or_insertOne(cursor,'departments','department','Radiology')
    RAD_ROLE = utils.find_or_insertOne(cursor,'clinical_roles','clinical_role','radiologist')
    ATTENDING_ROLE = utils.find_or_insertOne(cursor,'clinical_roles','clinical_role','attending')
    ROLES = [RAD_ROLE, ATTENDING_ROLE]
    # truncate employee_specialty_mappings
    cursor.execute('truncate employee_specialty_mappings')
    # update each employee
    cursor.execute('select distinct rad1_id eid from rad_reports')
    temp = cursor.fetchall()
    rads = [x['eid'] for x in temp]
    cursor.execute('select * from employees where name in %s',
                   (('mdaly','ctoland','mwarnock','cmeenan','rsna','demo','madams','Vital Demo User'),))
    temp = cursor.fetchall()
    blacklist = [x['id'] for x in temp]
    cursor.execute('select * from employees')
    employees = cursor.fetchall()
    for employee in employees:
        eid = employee['id']
        # fix names
        if eid not in blacklist:
            name = fake.first_name()+' '+fake.last_name()
            cursor.execute('update employees set name=%s where id=%s',(name,eid))
        # only map specialties and clinical_roles for rads
        if eid in rads:
            # add specialty
            spec_id = utils.find_or_insertSimple(cursor,'specialties',{ 'department_id' : RAD_DEPARTMENT, 'specialty' : fake.specialty() } )
            esm_id = utils.insert_dict(cursor,'employee_specialty_mappings',
                                       { 'specialty_id'      : spec_id,
                                         'employee_id'       : eid,
                                         'primary_specialty' : True })
            # add clinical roles
            for role in ROLES:
                ecrm_id = utils.insert_dict(cursor,'employee_clinical_role_mappings',
                                            { 'clinical_role_id' : role,
                                              'employee_id'      : eid })

def assign_residents(row,cursor,fake,frequency,resident_eids):
    resident_id = fake.random_element(resident_eids)
    chosen = fake.boolean(chance_of_getting_true=frequency)
    #import code; code.interact(local=locals())
    if chosen:
        cursor.execute('update rad_reports set rad2_id=%s where id=%s',(resident_id,row['id']))

def main(h,opts):
    # setup faker
    fake = Faker()
    class MyProvider(BaseProvider):
        def specialty(self):
            specialties = ['Nuclear Medicine','Neuroradiology',
                           'Interventional','Abdominal','Musculoskeletal',
                           'Pediatric','Thoracic','Breast']
            return self.random_element(specialties)
    fake.add_provider(MyProvider)
    fake.seed(420)
    # rename employees, add employee_specialty_mappings, employeee_clinical_role_mappings
    logging.info('starting to update names')
    update_existing(h.hcurs,fake)
    # generate and assign fake residents
    logging.info('names update, generating %s fake residents',opts.count)
    resident_eids = generate_residents(h.hcurs,fake,int(opts.count))
    logging.info('fake residents generated, assigning them randomly to %s%% of reports',opts.frequency)
    h.hcurs.execute('update rad_reports set rad2_id = null')
    walk_sql = 'select id, rad_exam_id, rad1_id from rad_reports where id between %s and %s'
    utils.walk_table(h.hcurs,'rad_reports',walk_sql,assign_residents,per_row_args=(h.hcurs,fake,int(opts.frequency),resident_eids))
    # save
    logging.info('committing db changes')
    h.hdb.commit()

if __name__ == '__main__':
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description='update ai cloud dataset for rsna 2014')
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
        parser.add_argument('--count', help='how many new residents should be added', default=12, metavar='new-resident-count')
        parser.add_argument('--frequency', help='how frequently (0-100%%) residents appear on reports', default=75, metavar='resident-report-frequency')
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
        main(h,opts)
        h.close()
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    sys.exit(0)
