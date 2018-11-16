#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,argparse,random,datetime
import tqdm
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def get_rads(cursor):
    sql = ''' select count(id) vol, radiologist_id, radiologist_specialty_id
              from rad_exam_facts where
              end_exam_year < %s group by radiologist_id, radiologist_specialty_id '''
    cursor.execute(sql,(2016,))
    temp = cursor.fetchall()
    rads = [{'radiologist_id':row['radiologist_id'],'radiologist_specialty_id':row['radiologist_specialty_id']} for row in temp if row['radiologist_id']!=None]
    return rads

def get_ids(cursor):
    ids = { 'radiologists' : get_rads(cursor) }
    roles = ['resident_id','technologist_id','ordering_provider_id']
    for role in roles:
        sql = 'select distinct %s from rad_exam_facts'%role + ' where end_exam_year < %s'
        cursor.execute(sql,(2016,))
        temp = cursor.fetchall()
        ids[role] = [row[role] for row in temp if row[role]!=None]
    return ids

def update_rows(row,cursor,good_ids,bad_emp_ids):
    roles = ['technologist_id', 'ordering_provider_id', 'resident_id', 'radiologist_id']
    updated = {}
    for role in roles:
        # build delete list
        eid = row.get(role)
        updated[role] = eid
        # map new / correct ids
        if eid!=None:
            bad_emp_ids.add(eid)
            # special-case for rad
            if role=='radiologist_id':
                r = random.choice(good_ids['radiologists'])
                updated['radiologist_id'] = r['radiologist_id']
                updated['radiologist_specialty_id'] = r['radiologist_specialty_id']
            # common case
            else:
                updated[role] = random.choice(good_ids[role])
    # sql
    rep_sql = ''' update rad_exam_personnel set technologist_id=%s, ordering_id=%s
                  where rad_exam_id=%s '''
    rr_sql = ''' update rad_reports set rad1_id=%s, rad2_id=%s
                 where rad_exam_id=%s '''
    ref_sql = ''' update rad_exam_facts set technologist_id=%s, ordering_provider_id=%s, resident_id=%s, radiologist_id=%s, radiologist_specialty_id=%s
                  where rad_exam_id=%s '''
    cursor.execute(rep_sql,(updated.get('technologist_id'), updated.get('ordering_provider_id'),row['rad_exam_id']))
    cursor.execute(rr_sql,(updated.get('radiologist_id'), updated.get('resident_id'),row['rad_exam_id']))
    cursor.execute(ref_sql,(updated.get('technologist_id'), updated.get('ordering_provider_id'),updated.get('resident_id'), updated.get('radiologist_id'), updated.get('radiologist_specialty_id'),row['rad_exam_id']))

def del_bad_ids(cursor,bad_emp_ids):
    CHUNK_SIZE=50
    bad_list = list(bad_emp_ids)
    i_sql = 'delete from identifiers where employee_id in %s'
    e_sql = 'delete from employees where id in %s'
    p_sql = 'delete from people where current_employee_id in %s'
    for idmin in tqdm.tqdm(xrange(0,len(bad_emp_ids),CHUNK_SIZE),desc='deleting bad employees',leave=True):
        idmax = idmin + CHUNK_SIZE
        bads = tuple(bad_list[idmin:idmax])
        cursor.execute(i_sql,(bads,))
        cursor.execute(e_sql,(bads,))
        cursor.execute(p_sql,(bads,))
    print #tqdm

def del_bad(cursor):
    s = datetime.datetime(2016,1,1)
    #do not attempt to delete employees that have clinical role mappings
    whitelist_query = "select distinct e.id from employees as e left outer join employee_clinical_role_mappings as ecrm ON ecrm.employee_id = e.id where ecrm.id is not NULL and e.updated_at >= '%s'" % s
    i_sql = "delete from identifiers where updated_at >= '%s' and employee_id not in (%s)" % (s, whitelist_query)
    e_sql = "delete from employees where updated_at >= '%s' and id not in (%s)" % (s, whitelist_query)
    p_sql = "delete from people where updated_at >= '%s' and current_employee_id not in (%s)" % (s, whitelist_query)
    cursor.execute(i_sql)
    cursor.execute(e_sql)
    cursor.execute(p_sql)

def main(h,opts):
    bad_emp_ids = set([])
    good_ids = get_ids(h.cursor)
    #import code; code.interact(local=locals())
    sql = ''' select ref.rad_exam_id, technologist_id, ordering_provider_id, resident_id, radiologist_id, radiologist_specialty_id
              from rad_exam_facts ref
              where ref.end_exam_year=%s and ref.id between %s and %s '''
    if utils.get_maxid(h.cursor,'rad_exam_facts')==None:
        logging.warning('no rows in rad_exam_facts, skipping data fixup')
        return
    utils.walk_table(h.cursor,'rad_exam_facts',sql,update_rows,sql_args=(2017,),per_row_args=(h.cursor,good_ids,bad_emp_ids),progressBar=True)
    #logging.info('deleting %s bad employees',len(bad_emp_ids))
    #del_bad_ids(h.cursor,bad_emp_ids)
    del_bad(h.cursor)
    h.db.commit()

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'fix bogus employees'
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
