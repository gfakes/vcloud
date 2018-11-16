#!/usr/bin/env python

import sys,traceback,logging,pprint,imp
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def update_row(row,cursor,table,PET,pets):
    update_sql = 'update %s'%table + ' set external_system_status_id=%s where id=%s'
    es_id = get_mrn_es_id(cursor,row['patient_mrn_id'])
    pet_id = row['patient_event_type_id']
    ess_id = find_or_insert_pet_ess(cursor,PET,pets,pet_id,es_id)
    cursor.execute(update_sql,(ess_id,row['id']))

def find_or_insert_pet_ess(cursor,PET,pets,pet_id,es_id):
    if (pet_id,es_id) not in pets:
        temp = { 'status'             : PET[pet_id]['ess'],
                 'external_system_id' : es_id,
                 'trip_status_id'     : PET[pet_id]['uet_id'] }
        pets[(pet_id,es_id)] = utils.insert_dict(cursor,'exam_statuses',temp)
    return pets[(pet_id,es_id)]

def get_mrn_es_id(cursor,pmrn_id):
    es_id = None
    sql = 'select external_system_id from patient_mrns where id=%s'
    cursor.execute(sql,(pmrn_id,))
    temp = cursor.fetchone()
    if temp!=None:
        es_id=temp['external_system_id']
    return es_id

def main():
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
    logging.info('fixing patient_event_types for DM3 upgrade')
    # build universal_event_types dictionary
    uet_sql = 'select id, status from trip_statuses'
    UET = {}
    h.hcurs.execute(uet_sql)
    temp = h.hcurs.fetchall()
    for t in temp:
        UET[t['status']] = t['id']
    # build patient_event_types dictionary
    PET = {}
    pet_sql = 'select id, patient_event_type, hl7_type from patient_event_types'
    h.hcurs.execute(pet_sql)
    temp = h.hcurs.fetchall()
    for t in temp:
        PET[t['id']] = { 'uet_id' : UET[t['patient_event_type']],
                         'ess'    : t['hl7_type'] }
    # walk patient_events and patient_events_history
    pets = {} # cache of external_system_status_ids based on (patient_event_type_id,external_system_id) key
    walk_prefix_sql = 'select id, patient_mrn_id, patient_event_type_id from %s'
    walk_suffix_sql = ' where id between %s and %s'
    tables = ('patient_events','patient_events_history')
    for table in tables:
        h.hcurs.execute('select count(id) vol from %s'%table)
        if h.hcurs.fetchone()['vol']==0:
            logging.warning('zero rows in table %s, not updating table',table)
        else:
            walk_sql = walk_prefix_sql%table + walk_suffix_sql
            utils.walk_table(h.hcurs,table,walk_sql,update_row,per_row_args=(h.hcurs,table,PET,pets))
            h.hdb.commit()
    h.close()

if __name__ == '__main__':
    try:
        main()
    except:
        logging.critical(traceback.format_exc())
        print traceback.format_exc()
        sys.exit(1)
    sys.exit(0)
