#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,os,argparse,datetime,pytz
from faker import Faker # sudo apt-get install python-pip; sudo pip install fake-factory
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def assign_residents(row,cursor,fake,pstatusid):
    p_report_body = fake.text(max_nb_chars=1024)
    f_report_body = fake.text(max_nb_chars=256) + '\n' + p_report_body
    f_report_impression = f_report_body.split('\n')[:2]
    p_report_impression = p_report_body.split('\n')[:2]
    cursor.execute('select end_exam from rad_exam_times where rad_exam_id=%s',(row['rad_exam_id'],))
    ee = cursor.fetchone()['end_exam']
    ptime = pytz.timezone('US/Eastern').localize(fake.date_time_between(ee,row['report_event']))
    raw_tat = ptime-ee
    tat = (raw_tat.days*86400) + raw_tat.seconds
    prelim = { 'report_body'       : p_report_body,
               'report_impression' : p_report_impression,
               'report_status_id'  : pstatusid,
               'rad1_id'           : row['rad1_id'],
               'rad2_id'           : row['rad2_id'],
               'rad_exam_id'       : row['rad_exam_id'],
               'report_event'      : ptime }
    utils.insert_dict(cursor,'rad_reports',prelim)
    cursor.execute('update rad_reports set report_body=%s,report_impression=%s where id=%s',(f_report_body,f_report_impression,row['id']))
    cursor.execute('update rad_exam_metrics set first_report_turn_around=%s, prelim_turn_around=%s where rad_exam_id=%s',
                   (tat,tat,row['rad_exam_id']))

def main(h,opts):
    # setup faker
    fake = Faker()
    fake.seed(420)
    h.hcurs.execute('select * from external_system_statuses where status=%s',('prelim',))
    pstatusid = h.hcurs.fetchone()['id']
    walk_sql = 'select * from rad_reports where rad2_id is not null and id between %s and %s'
    utils.walk_table(h.hcurs,'rad_reports',walk_sql,assign_residents,per_row_args=(h.hcurs,fake,pstatusid))
    logging.info('committing db changes')
    h.hdb.commit()

if __name__ == '__main__':
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description='update ai cloud dataset for rsna 2014')
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
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
