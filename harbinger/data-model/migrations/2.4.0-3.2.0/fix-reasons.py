#!/usr/bin/env python

import sys,traceback,logging,pprint,imp
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def update_row(row,cursor):
    update_sql = 'update reasons set external_system_id=%s where id=%s'
    delete_sql = 'delete from reasons where id=%s'
    esid = find_reason_es(cursor,row['id'])
    if esid==None:
        logging.critical('DELETING orphan, unable to find external_system_id for reason.id=%s reason.reason=%s',row['id'],row['reason'])
        cursor.execute(delete_sql,(row['id'],))
    else:
        cursor.execute(update_sql,(esid,row['id']))

def find_reason_es(cursor,reason_id):
    esid = None
    red_delay_sql = ''' select re.external_system_id
                        from rad_exams re left outer join rad_exam_details red on red.rad_exam_id=re.id
                        where red.delay_reason_id = %s limit 1'''
    red_procchange_sql = ''' select re.external_system_id
                             from rad_exams re left outer join rad_exam_details red on red.rad_exam_id=re.id
                             where red.procedure_change_reason_id = %s limit 1'''
    peh_sql = ''' select pm.external_system_id
                  from patient_events_history peh left outer join patient_mrns pm on pm.id=peh.patient_mrn_id
                  where peh.event_reason_id = %s limit 1 '''
    sqls = [red_delay_sql, red_procchange_sql, peh_sql]
    for sql in sqls:
        cursor.execute(sql,(reason_id,))
        temp = cursor.fetchone()
        if temp!=None:
            esid = temp['external_system_id']
            break
    return esid

def main():
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
    logging.info('fixing reasons table for DM3 upgrade')
    h.hcurs.execute('select count(id) vol from reasons')
    if h.hcurs.fetchone()['vol']==0:
        logging.warning('zero reasons in table, not updating table')
    else:
        walk_sql = 'select id, reason from reasons where id between %s and %s'
        utils.walk_table(h.hcurs,'reasons',walk_sql,update_row,per_row_args=(h.hcurs,))
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
