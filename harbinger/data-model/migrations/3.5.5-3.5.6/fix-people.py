#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def main(h,opts):
    # sql
    person_sql = 'select id from people where current_employee_id not in (select id from employees)'
    update_person_sql = 'update people set current_employee_id=%s where id=%s'
    delete_person_sql = 'delete from people where id=%s'
    employee_sql = 'select id from employees where person_id=%s'
    # find all people rows that don't have a valid current_employee_id
    h.cursor.execute(person_sql)
    badfk_rows = h.cursor.fetchall()
    logging.info('found %s rows of people with invalid current_employee_id FK',len(badfk_rows))
    # walk each row and determine if a valid employee_id exists
    for row in badfk_rows:
        people_id = row['id']
        logging.info('investigating people.id=%s',people_id)
        h.cursor.execute(employee_sql,(people_id,))
        temp = h.cursor.fetchone()
        # if employees.person_id points to row, fix the people row to match
        if temp!=None:
            employee_id = temp['id']
            logging.info('updating people.id=%s to set current_employee_id=%s',people_id,employee_id)
            h.cursor.execute(update_person_sql,(employee_id,people_id))
        # if no matches, delete the orphan people row
        else:
            logging.info('deleting orphan people.id=%s',people_id)
            h.cursor.execute(delete_person_sql,(people_id,))
    h.db.commit()

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'fix orphaned people rows by correcting employee FK or deleting'
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
