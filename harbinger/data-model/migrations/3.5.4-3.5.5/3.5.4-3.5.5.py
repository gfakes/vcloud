#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def calc_metric(t2,t1):
    duration = None
    if None not in (t2,t1):
        temp = (t2-t1).total_seconds()
        if temp >= 0:
            duration = temp
    return duration

def update_rows(row,cursor):
    #if None not in row.values():
    #    import code; code.interact(local=locals())
    rem_sql = ''' update rad_exam_metrics set transport=%s, schedule_first_report=%s,
                         schedule_first_prelim=%s, schedule_first_final=%s, order_first_report=%s,
                         order_first_prelim=%s, order_first_final=%s
                  where rad_exam_id=%s '''
    ref_sql = ''' update rad_exam_facts set transport=%s, schedule_first_report=%s,
                         schedule_first_prelim=%s, schedule_first_final=%s, order_first_report=%s,
                         order_first_prelim=%s, order_first_final=%s, exam_priority_id=%s
                  where rad_exam_id=%s '''
    transport             = calc_metric(row['begin_exam'],row['schedule_event'])
    schedule_first_report = calc_metric(row['first_report'],row['schedule_event'])
    schedule_first_prelim = calc_metric(row['first_prelim'],row['schedule_event'])
    schedule_first_final  = calc_metric(row['first_final'],row['schedule_event'])
    order_first_report    = calc_metric(row['first_report'],row['order_arrival'])
    order_first_prelim    = calc_metric(row['first_prelim'],row['order_arrival'])
    order_first_final     = calc_metric(row['first_final'],row['order_arrival'])
    cursor.execute(rem_sql,(transport, schedule_first_report, schedule_first_prelim, schedule_first_final,
                            order_first_report, order_first_prelim, order_first_final,row['rad_exam_id']))
    cursor.execute(ref_sql,(transport, schedule_first_report, schedule_first_prelim, schedule_first_final,
                            order_first_report, order_first_prelim, order_first_final,row['exam_priority_id'],row['rad_exam_id']))

def main(h,opts):
    sql = ''' select re.id rad_exam_id, re.exam_priority_id, ret.order_arrival, ret.schedule_event, ret.begin_exam,
                     rrfr.report_event first_report, rrfp.report_event first_prelim, rrff.report_event first_final
              from rad_exams re left outer join rad_exam_times ret on ret.rad_exam_id=re.id
                   left outer join rad_reports rrfr on rrfr.id=re.first_report_id
                   left outer join rad_reports rrfp on rrfp.id=re.first_prelim_report_id
                   left outer join rad_reports rrff on rrff.id=re.first_final_report_id
              where ret.end_exam is not null and re.id between %s and %s '''
    if utils.get_maxid(h.cursor,'rad_exams')==None or utils.get_maxid(h.cursor,'rad_exam_facts')==None:
        logging.warning('no rows in rad_exams or rad_exam_facts, skipping data migration')
        return
    utils.walk_table(h.cursor,'rad_exams',sql,update_rows,per_row_args=(h.cursor,))
    h.db.commit()

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'add new metrics and exam_priority for data model v3.5.5 update'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
