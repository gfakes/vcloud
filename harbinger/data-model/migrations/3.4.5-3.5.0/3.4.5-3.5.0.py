#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,argparse,operator
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# determine external_system for resources based on exam volume
# also deletes unused resources
def set_resource_extsys(cursor):
    logging.info('setting external_system_id for resources, deleting unusued resources')
    # build shell of resources
    resources = {}
    sql = 'select id from resources'
    cursor.execute(sql)
    temp = cursor.fetchall()
    for row in temp:
        resources[row['id']] = {}
    logging.info('found %s resources, querying for rad_exam volume by external_system_id',len(resources))
    # get per-resource external_system vols
    sql = ''' select r.id, re.external_system_id, count(re.id) vol
              from rad_exams re left outer join resources r on r.id = re.resource_id
              where re.resource_id is not null
              group by r.id, re.external_system_id '''
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        resources[row['id']][row['external_system_id']]=row['vol']
    # set external_system for resource or delete it
    usql = 'update resources set external_system_id=%s where id=%s'
    delcount = upcount = 0
    logging.info('processing resources')
    for rid in resources:
        resource = resources[rid]
        if resource=={}:
            delete_resource(cursor,rid)
            delcount += 1
        else:
            # sorting idea: http://stackoverflow.com/a/613218
            vols = sorted(resource.items(), key=operator.itemgetter(1),reverse=True)
            esid = vols[0][0]
            cursor.execute(usql,(esid,rid))
            upcount += 1
    logging.info('updated %s resources with external_system_id, deleted %s unused resources',upcount,delcount)

# delete a specific resource id
def delete_resource(cursor,rid):
    logging.info('    deleting resource.id=%s',rid)
    dsql = 'delete from resources where id=%s'
    cursor.execute(dsql,(rid,))

# find duplicate resources based on name + external system
# choose consumer/consued based on exam volume
# return list of candidates
def get_resource_candidates(cursor):
    logging.info('looking for resource merge candidates')
    candidates = []
    resources = {}
    # get volume of each resource
    sql = ''' select r.id, r.resource, r.external_system_id, count(re.id) vol
              from resources r left outer join rad_exams re on re.resource_id=r.id
              where re.resource_id is not null
              group by r.id, r.resource, r.external_system_id '''
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        if row['external_system_id'] not in resources:
            resources[row['external_system_id']] = {}
        if row['resource'] not in resources[row['external_system_id']]:
            resources[row['external_system_id']][row['resource']] = {}
        resources[row['external_system_id']][row['resource']][row['id']] = row['vol']
    # process and group resources
    for es in resources:
        for resource in resources[es]:
            data = resources[es][resource]
            if len(data)>1:
                vols = sorted(data.items(), key=operator.itemgetter(1),reverse=True)
                candidate = { 'consumer_id'  : vols[0][0],
                              'consumed_ids' : [x[0] for x in vols[1:]] }
                candidates.append(candidate)
    logging.info('found %s resource merge candidates',len(candidates))
    return candidates

# merge list of resources candidates
# merge = update rad_exams and rad_exam_facts references to consumer_id, delete resource consumed_id
def merge_resources(cursor,candidates):
    logging.info('merging resources')
    re_up_sql = 'update rad_exams set resource_id=%s where resource_id=%s'
    ref_up_sql = 'update rad_exam_facts set resource_id=%s where resource_id=%s'
    merge_count = 0
    for candidate in candidates:
        consumer_id = candidate['consumer_id']
        for consumed_id in candidate['consumed_ids']:
            logging.info('    resource.id=%s consuming id=%s in rad_exams and rad_exam_facts',consumer_id,consumed_id)
            cursor.execute(re_up_sql,(consumer_id,consumed_id))
            cursor.execute(ref_up_sql,(consumer_id,consumed_id))
            merge_count += 1
            delete_resource(cursor,consumed_id)
    logging.info('succesfully merged %s resources',merge_count)

# determine external_system for procedures based on exam volume
# also deletes unused procedures
def set_procedure_extsys(cursor):
    logging.info('setting external_system_id for procedures, deleting unusued procedures')
    # build shell of procedures
    procedures = {}
    sql = 'select id from procedures'
    cursor.execute(sql)
    temp = cursor.fetchall()
    for row in temp:
        procedures[row['id']] = {}
    logging.info('found %s procedures, querying for rad_exam volume by external_system_id',len(procedures))
    # get per-procedure external_system vols
    sql = ''' select p.id, re.external_system_id, count(re.id) vol
              from rad_exams re left outer join procedures p on p.id = re.procedure_id
              where re.procedure_id is not null
              group by p.id, re.external_system_id '''
    sql2 = ''' select p.id, re.external_system_id, count(re.id) vol
               from rad_exams re left outer join rad_exam_details red on re.id=red.rad_exam_id
               left outer join procedures p on p.id = red.previous_procedure_id
               where red.previous_procedure_id is not null
               group by p.id, re.external_system_id '''
    cursor.execute(sql)
    results = cursor.fetchall()
    cursor.execute(sql2)
    results += cursor.fetchall()
    for row in results:
        if row['external_system_id'] not in procedures[row['id']]:
            procedures[row['id']][row['external_system_id']] = 0
        procedures[row['id']][row['external_system_id']] += row['vol']
    # set external_system for procedure or delete it
    usql = 'update procedures set external_system_id=%s where id=%s'
    delcount = upcount = 0
    logging.info('processing procedures')
    for pid in procedures:
        procedure = procedures[pid]
        if procedure=={}:
            delete_procedure(cursor,pid)
            delcount += 1
        else:
            vols = sorted(procedure.items(), key=operator.itemgetter(1),reverse=True)
            esid = vols[0][0]
            cursor.execute(usql,(esid,pid))
            upcount += 1
    logging.info('updated %s procedures with external_system_id, deleted %s unused procedures',upcount,delcount)

# delete procedure by id
def delete_procedure(cursor,pid):
    logging.info('    deleting procedure.id=%s',pid)
    dh_sql = 'delete from procedure_hcpcs_mappings where procedure_id=%s'
    dp_sql = 'delete from procedures where id=%s'
    cursor.execute(dh_sql,(pid,))
    cursor.execute(dp_sql,(pid,))

# get metadata for procedure to update fact table
def get_proc_details(cursor,pid):
    details = { 'pro_rvu'      : 0,
                'tech_rvu'     : 0,
                'volume'       : 1,
                'specialty_id' : None }
    sql = 'select pro_rvu, tech_rvu, volume, specialty_id from procedures where id=%s'
    cursor.execute(sql,(pid,))
    temp = cursor.fetchone()
    if temp!=None:
        details['pro_rvu'] = temp['pro_rvu']
        details['tech_rvu'] = temp['tech_rvu']
        details['volume'] = temp['volume']
        details['specialty_id'] = temp['specialty_id']
    return details

# find duplicate procedures based on code + external system
# choose consumer/consued based on exam volume
# return list of candidates
def get_procedure_candidates(cursor):
    logging.info('looking for procedure merge candidates')
    candidates = []
    procedures = {}
    # get volume of each procedure
    sql = ''' select p.id, p.code, p.external_system_id, count(re.id) vol
              from procedures p left outer join rad_exams re on re.procedure_id=p.id
              where re.procedure_id is not null
              group by p.id, p.code, p.external_system_id '''
    sql2 = ''' select p.id, p.code, p.external_system_id, count(red.rad_exam_id) vol
               from procedures p left outer join rad_exam_details red on red.previous_procedure_id=p.id
               where red.previous_procedure_id is not null
               group by p.id, p.code, p.external_system_id '''
    cursor.execute(sql)
    results = cursor.fetchall()
    cursor.execute(sql2)
    results += cursor.fetchall()
    for row in results:
        if row['external_system_id'] not in procedures:
            procedures[row['external_system_id']] = {}
        if row['code'] not in procedures[row['external_system_id']]:
            procedures[row['external_system_id']][row['code']] = {}
        if row['id'] not in procedures[row['external_system_id']][row['code']]:
            procedures[row['external_system_id']][row['code']][row['id']] = 0
        procedures[row['external_system_id']][row['code']][row['id']] += row['vol']
    # process and group procedures
    for es in procedures:
        for code in procedures[es]:
            data = procedures[es][code]
            if len(data)>1:
                vols = sorted(data.items(), key=operator.itemgetter(1),reverse=True)
                candidate = { 'consumer_id'  : vols[0][0],
                              'consumed_ids' : [x[0] for x in vols[1:]] }
                candidate.update(get_proc_details(cursor,vols[0][0]))
                candidates.append(candidate)
    logging.info('found %s procedure merge candidates',len(candidates))
    return candidates

# merge list of procedure candidates
# merge = update rad_exam_details, rad_exams, rad_exam_facts, radonc_cases references to consumer_id
#         delete procedure_hcpcs_mappings, procedure consumed_id
def merge_procedures(cursor,candidates):
    logging.info('merging procedures')
    re_up_sql = 'update rad_exams set procedure_id=%s where procedure_id=%s'
    red_up_sql = 'update rad_exam_details set previous_procedure_id=%s where previous_procedure_id=%s'
    ref_up_sql = ''' update rad_exam_facts set procedure_id=%s, pro_rvu=%s, tech_rvu=%s, volume=%s, procedure_specialty_id=%s
                     where procedure_id=%s '''
    ro_up_sql = 'update radonc_cases set procedure_id=%s where procedure_id=%s'
    merge_count = 0
    for candidate in candidates:
        consumer_id = candidate['consumer_id']
        prvu = candidate['pro_rvu']
        trvu = candidate['tech_rvu']
        vol = candidate['volume']
        spec_id = candidate['specialty_id']
        for consumed_id in candidate['consumed_ids']:
            logging.info('    procedure.id=%s consuming id=%s in rad_exams and rad_exam_facts',consumer_id,consumed_id)
            cursor.execute(re_up_sql,(consumer_id,consumed_id))
            cursor.execute(ro_up_sql,(consumer_id,consumed_id))
            cursor.execute(red_up_sql,(consumer_id,consumed_id))
            cursor.execute(ref_up_sql,(consumer_id,prvu,trvu,vol,spec_id,consumed_id))
            merge_count += 1
            delete_procedure(cursor,consumed_id)
    logging.info('succesfully merged %s procedures',merge_count)

def main(h,opts):
    # resources
    set_resource_extsys(h.cursor)
    resources = get_resource_candidates(h.cursor)
    merge_resources(h.cursor,resources)
    # procedures
    set_procedure_extsys(h.cursor)
    procedures = get_procedure_candidates(h.cursor)
    merge_procedures(h.cursor,procedures)
    #import code; code.interact(local=locals())
    #h.db.rollback()
    h.db.commit()

if __name__ == '__main__':
    SC = '/servers/harbinger/config/site.config.json'
    DESC = 'consolidating resources and procedures by external_system for data model v3.5.0 update'
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
