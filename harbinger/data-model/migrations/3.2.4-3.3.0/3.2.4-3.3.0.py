#!/usr/bin/env python

import sys,traceback,logging,pprint,imp
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def update_row(row,cursor):
    update_sql = ''' update rad_exams set first_prelim_report_id=%s, last_prelim_report_id=%s,
                                          first_final_report_id=%s, last_final_report_id=%s,
                                          current_report_id=%s, first_report_id=%s
                     where id=%s '''
    report_ids = get_report_ids(row['id'],cursor)
    cursor.execute(update_sql,(report_ids['first_prelim_report_id'],report_ids['last_prelim_report_id'],
                               report_ids['first_final_report_id'],report_ids['last_final_report_id'],
                               report_ids['current_report_id'],report_ids['first_report_id'],row['id']))

def get_report_ids(reid,cursor):
    report_ids = { 'first_prelim_report_id' : None,
                   'last_prelim_report_id'  : None,
                   'first_final_report_id'  : None,
                   'last_final_report_id'   : None,
                   'current_report_id'      : None,
                   'first_report_id'        : None }
    sql = ''' select rr.id report_id, rr.report_event, uet.event_type
              from rad_reports rr left outer join external_system_statuses ess on ess.id=rr.report_status_id
              left outer join universal_event_types uet on uet.id=ess.universal_event_type_id
              where rr.rad_exam_id=%s
              order by report_event asc '''
    cursor.execute(sql,(reid,))
    reports = cursor.fetchall()
    if reports!=None and reports!=[]:
        for r in reports:
            if r['event_type'] == 'prelim':
                if report_ids['first_prelim_report_id']==None:
                    report_ids['first_prelim_report_id'] = r['report_id']
                report_ids['last_prelim_report_id'] = r['report_id']
            elif r['event_type'] in ('final','addendum'):
                if report_ids['first_final_report_id']==None:
                    report_ids['first_final_report_id'] = r['report_id']
                report_ids['last_final_report_id'] = r['report_id']
            report_ids['current_report_id'] = r['report_id']
    report_ids['first_report_id'] = utils.earliest_event_time(report_ids['first_prelim_report_id'],
                                                              [report_ids['first_prelim_report_id'],report_ids['first_final_report_id']])
    #import code; code.interact(local=locals())
    return report_ids

def main():
    #h = utils.HarbingerETEnv(sys.argv[1],'dm3-upgrade.log',amqp=False,db=True,schema='harbinger-rw') # DEBUG
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
    logging.info('fixing rad_exams => rad_reports FK columns for data model v3.3.0 update')
    h.hcurs.execute('select count(id) vol from rad_exams')
    if h.hcurs.fetchone()['vol']==0:
        logging.warning('zero exams in rad_exams, not updating table')
    else:
        walk_sql = 'select id from rad_exams where id between %s and %s'
        utils.walk_table(h.hcurs,'rad_exams',walk_sql,update_row,per_row_args=(h.hcurs,))
        h.hdb.commit()
    # update_row({'id':86500},h.hcurs) # DEBUG
    h.close()

if __name__ == '__main__':
    try:
        main()
    except:
        logging.critical(traceback.format_exc())
        print traceback.format_exc()
        sys.exit(1)
    sys.exit(0)
