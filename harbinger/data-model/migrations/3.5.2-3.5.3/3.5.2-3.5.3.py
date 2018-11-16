#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def add_be(row,cursor):
    sql = 'update rad_exam_facts set begin_exam_epoch=%s where rad_exam_id=%s'
    cursor.execute(sql,(row['bee'],row['rad_exam_id']))

def main(h,opts):
    sql = ''' select rad_exam_id, extract(epoch from begin_exam) bee
              from rad_exam_times
              where end_exam is not null and begin_exam is not null and id between %s and %s '''
    if utils.get_maxid(h.cursor,'rad_exam_times')==None or utils.get_maxid(h.cursor,'rad_exam_facts')==None:
        logging.warning('no rows in rad_exam_times or rad_exam_facts, skipping data migration')
        return
    utils.walk_table(h.cursor,'rad_exam_times',sql,add_be,per_row_args=(h.cursor,))
    h.db.commit()

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'add rad_exam_facts.begin_exam_epoch for data model v3.5.3 update'
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
