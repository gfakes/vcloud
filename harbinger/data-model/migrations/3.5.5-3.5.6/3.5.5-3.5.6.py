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
    rem_sql = ''' update rad_exam_metrics set access_wait=%s, reg_wait=%s, reg_duration=%s, exam_wait=%s,
                         exam_duration=%s, total_wait=%s, order_complete=%s, prelim_turn_around=%s, turn_around=%s,
                         order_first_image=%s, order_last_image=%s, first_image_prelim=%s, last_image_prelim=%s,
                         first_image_final=%s, last_image_final=%s, end_exam_first_image=%s, end_exam_last_image=%s,
                         send_duration=%s, first_report_turn_around=%s, transport=%s, schedule_first_report=%s,
                         schedule_first_prelim=%s, schedule_first_final=%s, order_first_report=%s,
                         order_first_prelim=%s, order_first_final=%s
                  where rad_exam_id=%s '''
    ref_sql = ''' update rad_exam_facts set access_wait=%s, reg_wait=%s, reg_duration=%s, exam_wait=%s,
                         exam_duration=%s, total_wait=%s, order_complete=%s, prelim_turn_around=%s, turn_around=%s,
                         order_first_image=%s, order_last_image=%s, first_image_prelim=%s, last_image_prelim=%s,
                         first_image_final=%s, last_image_final=%s, end_exam_first_image=%s, end_exam_last_image=%s,
                         send_duration=%s, first_report_turn_around=%s, transport=%s, schedule_first_report=%s,
                         schedule_first_prelim=%s, schedule_first_final=%s, order_first_report=%s,
                         order_first_prelim=%s, order_first_final=%s, scheduler_id=%s
                  where rad_exam_id=%s '''
    access_wait              = calc_metric(row['appointment'],row['schedule_event'])
    reg_wait                 = calc_metric(row['begin_reg'],row['sign_in'])
    reg_duration             = calc_metric(row['check_in'],row['begin_reg'])
    exam_wait                = calc_metric(row['begin_exam'],row['appointment'])
    exam_duration            = calc_metric(row['end_exam'],row['begin_exam'])
    total_wait               = calc_metric(row['begin_exam'],row['sign_in'])
    order_complete           = calc_metric(row['end_exam'],row['order_arrival'])
    prelim_turn_around       = calc_metric(row['first_prelim'],row['end_exam'])
    turn_around              = calc_metric(row['first_final'],row['end_exam'])
    order_first_image        = calc_metric(row['first_image'],row['order_arrival'])
    order_last_image         = calc_metric(row['last_image'],row['order_arrival'])
    first_image_prelim       = calc_metric(row['first_prelim'],row['first_image'])
    last_image_prelim        = calc_metric(row['first_prelim'],row['last_image'])
    first_image_final        = calc_metric(row['first_final'],row['first_image'])
    last_image_final         = calc_metric(row['first_final'],row['last_image'])
    end_exam_first_image     = calc_metric(row['first_image'],row['end_exam'])
    end_exam_last_image      = calc_metric(row['last_image'],row['end_exam'])
    send_duration            = calc_metric(row['last_image'],row['first_image'])
    first_report_turn_around = calc_metric(row['first_report'],row['end_exam'])
    transport                = calc_metric(row['begin_exam'],row['schedule_event'])
    schedule_first_report    = calc_metric(row['first_report'],row['schedule_event'])
    schedule_first_prelim    = calc_metric(row['first_prelim'],row['schedule_event'])
    schedule_first_final     = calc_metric(row['first_final'],row['schedule_event'])
    order_first_report       = calc_metric(row['first_report'],row['order_arrival'])
    order_first_prelim       = calc_metric(row['first_prelim'],row['order_arrival'])
    order_first_final        = calc_metric(row['first_final'],row['order_arrival'])
    cursor.execute(rem_sql,(access_wait, reg_wait, reg_duration, exam_wait, exam_duration, total_wait,
                            order_complete, prelim_turn_around, turn_around, order_first_image, order_last_image,
                            first_image_prelim, last_image_prelim, first_image_final, last_image_final,
                            end_exam_first_image, end_exam_last_image, send_duration, first_report_turn_around,
                            transport, schedule_first_report, schedule_first_prelim, schedule_first_final,
                            order_first_report, order_first_prelim, order_first_final,row['rad_exam_id']))
    cursor.execute(ref_sql,(access_wait, reg_wait, reg_duration, exam_wait, exam_duration, total_wait,
                            order_complete, prelim_turn_around, turn_around, order_first_image, order_last_image,
                            first_image_prelim, last_image_prelim, first_image_final, last_image_final,
                            end_exam_first_image, end_exam_last_image, send_duration, first_report_turn_around,
                            transport, schedule_first_report, schedule_first_prelim, schedule_first_final,
                            order_first_report, order_first_prelim, order_first_final,row['scheduler_id'],row['rad_exam_id']))

def main(h,opts):
    sql = ''' select re.id rad_exam_id, ret.order_arrival, ret.schedule_event, ret.sign_in, ret.begin_reg, ret.check_in,
                     ret.appointment, ret.begin_exam, ret.end_exam, rpm.first_image, rpm.last_image,
                     rrfr.report_event first_report, rrfp.report_event first_prelim, rrff.report_event first_final,
                     rep.scheduler_id
              from rad_exams re left outer join rad_exam_times ret on ret.rad_exam_id=re.id
                   left outer join rad_reports rrfr on rrfr.id=re.first_report_id
                   left outer join rad_reports rrfp on rrfp.id=re.first_prelim_report_id
                   left outer join rad_reports rrff on rrff.id=re.first_final_report_id
                   left outer join rad_pacs_metadata rpm on rpm.rad_exam_id=re.id
                   left outer join rad_exam_personnel rep on rep.rad_exam_id=re.id
              where re.id between %s and %s '''
    if utils.get_maxid(h.cursor,'rad_exams')==None:
        logging.warning('no rows in rad_examss, skipping data migration')
        return
    utils.walk_table(h.cursor,'rad_exams',sql,update_rows,per_row_args=(h.cursor,))
    h.db.commit()

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'recalculate rad_exam_metrics and rad_exam_facts, add scheduler to facts'
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
