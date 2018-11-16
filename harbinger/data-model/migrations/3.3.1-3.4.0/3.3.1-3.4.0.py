#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# populate new patient_age column for all exams
def walk_exams(h):
    walk_sql = ''' select re.id re_id, extract(days from ret.end_exam-p.birthdate) p_age
                   from rad_exams re left outer join rad_exam_times ret on ret.rad_exam_id=re.id
                        left outer join patient_mrns pm on pm.id=re.patient_mrn_id
                        left outer join patients p on p.id=pm.patient_id
                   where re.id between %s and %s '''
    redplan = 'prepare redplan as update rad_exam_details set patient_age=$1 where rad_exam_id=$2'
    h.hcurs.execute(redplan)
    refplan = 'prepare refplan as update rad_exam_facts set patient_age=$1 where rad_exam_id=$2'
    h.hcurs.execute(refplan)
    logging.info('starting patient_age updates')
    try:
        utils.walk_table(h.hcurs,'rad_exams',walk_sql,add_patientage,per_row_args=(h.hcurs,))
        h.hdb.commit()
        logging.info('finished patient_age updates')
    except Exception as e:
        logging.error('%s: aborted patient_age updates',e)

# update rad_exam_details and rad_exam_facts with patient_age
def add_patientage(row,cursor):
    red_sql = 'execute redplan (%s, %s)'
    ref_sql = 'execute refplan (%s, %s)'
    if row['p_age'] != None:
        cursor.execute(red_sql,(row['p_age'],row['re_id']))
        cursor.execute(ref_sql,(row['p_age'],row['re_id']))

# populate new volume column for all procedures
def walk_procs(h):
    walk_sql = 'select id, volume_countable from procedures where id between %s and %s'
    cpt_count = False
    procplan = 'prepare procplan as update procedures set volume=$1 where id=$2'
    h.hcurs.execute(procplan)
    factplan = 'prepare factplan as update rad_exam_facts set volume=$1 where procedure_id=$2'
    h.hcurs.execute(factplan)
    # special-case for CC where volume = # of CPT
    if h.conf('customer','name')=="Cincinnati Childrens":
        cpt_count = True
        logging.info('using volume=N/0 based on count-of-mapped-CPTs-minimum-1/volume_countable=false')
    else:
        logging.info('using volume=1/0 based on volume_countable=true/false')
    try:
        logging.info('starting procedure volume updates')
        utils.walk_table(h.hcurs,'procedures',walk_sql,update_procs,per_row_args=(h.hcurs,cpt_count))
        h.hdb.commit()
        logging.info('finished procedure volume updates')
    except Exception as e:
        logging.error('%s: aborted procedure volume updates',e)

# update procedures and rad_exam_facts with volume
def update_procs(row,cursor,cpt_count):
    proc_sql = 'execute procplan (%s, %s)'
    fact_sql = 'execute factplan (%s, %s)'
    volume = 1 # default
    # set volume_countable = true to volume = count(mapped CPTs) if customer=CC
    if row['volume_countable'] and cpt_count:
        count_sql = ''' select count(id) c from procedure_hcpcs_mappings where procedure_id=%s '''
        cursor.execute(count_sql,(row['id'],))
        temp = cursor.fetchone()
        if temp!=None:
            volume = temp['c']
            if volume == 0: # handle unmapped procs with baseline volume
                volume = 1
    # set volume_countable = false to volume = 0
    elif cpt_count or not row['volume_countable']:
        volume = 0
    cursor.execute(proc_sql,(volume,row['id']))
    cursor.execute(fact_sql,(volume,row['id']))

def main(h,opts):
    walk_exams(h) # populate patient_age
    walk_procs(h) # populate volume

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'fixing procedures, rad_exam_details, and rad_exam_facts for data model v3.4.0 update'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC, metavar=SC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
        h.close()
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    sys.exit(0)
