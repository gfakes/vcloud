#!/usr/bin/env python

import sys,traceback,logging,pprint,datetime,json,imp
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def update_hcpcs_mappings(h,proc_id,hcpcs_ids,met,opid):
    EXCHANGE = 'warehouse_updates'
    ROUTING_KEY = 'dm3-upgrade-procedure-remappings.control.update_mapping.procedure_hcpcs_mappings'
    payload = { 'base_field'         : 'procedure_id',
                'base_id'            : proc_id,
                'control_event_type' : 'edit',
                'message_event_time' : met,
                'operator_id'        : opid,
                'reference_field'    : 'cms_hcpcs_code_id' }
    for hcpcsid in hcpcs_ids:
        mapping_key = 'mapping_'+str(hcpcsid)
        payload[mapping_key] = hcpcsid
    logging.debug('update HCPCS message:\n%s',pprint.pformat(payload))
    h.send(EXCHANGE,ROUTING_KEY,payload)

def get_hcpcs_ids(curs,cpts):
    hcpcs_ids = []
    sql = ''' select id from cms_hcpcs_codes where cms_modifier_id is null and hcpcs=%s '''
    for cpt in cpts:
        curs.execute(sql,(cpt,))
        temp = curs.fetchone()
        if temp!=None:
            hcpcs_ids.append(temp['id'])
        else:
            logging.warning('unable to find ID of cms_hcpcs_codes.hcpcs=%s',cpt)
    return hcpcs_ids

def get_proc_cpts(curs,proc_id):
    cpts = []
    sql = ''' select c.id, c.cpt
              from procedure_cpt_mappings pcm left outer join cpt_codes c on c.id=pcm.cpt_code_id
              where pcm.procedure_id=%s '''
    curs.execute(sql,(proc_id,))
    temp = curs.fetchall()
    if temp!=None and temp!=[]:
        for row in temp:
            cpts.append(row['cpt'])
    return cpts

def get_procs(curs):
    procs = []
    sql = ''' select p.id, p.code, p.volume_countable, p.scheduled_duration, p.active, p.fee, p.reportable, p.site_id, p.description, p.specialty_id from procedures p '''
    curs.execute(sql)
    temp = curs.fetchall()
    if temp!=None:
        procs = temp
    return procs

def fix_gpci(cursor,carrier,locality):
    gpci_id = None
    logging.info('updating sites to add cms_gpci_id')
    find_sql = ''' select cg.id
                   from cms_gpci cg left outer join cms_hcpcs_code_revisions chcr on cg.cms_hcpcs_code_revision_id=chcr.id
                   where chcr.active=%s and cg.carrier=%s and cg.locality=%s '''
    update_sql = 'update sites set cms_gpci_id=%s'
    cursor.execute(find_sql,(True,carrier,locality))
    cgid = cursor.fetchone()
    if cgid!=None:
        gpci_id = cgid['id']
    if gpci_id!=None:
        cursor.execute(update_sql,(gpci_id,))
        logging.info('updated all sites to have cms_gpci_id=%s')
    else:
        logging.critical('unable to find cms_gpci for carrier=%s locality=%s')

def main():
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','bridge-service.log',amqp=True,db=True,schema='harbinger-rw')
    logging.info('fixing procedure => hcpcs_codes mappings for DM3')
    MET = utils.dt_to_json(datetime.datetime.now())
    OPERATORS = ['mdaly','mdaly7','AI-service','ctoland','U0886475']
    opid = None
    for operator in OPERATORS:
        opid = utils.get_operator(h.hcurs,operator)
        if opid!=None:
            break
    if opid==None:
        logging.critical('Unable to find valid operator_id, aborting export/import of procedures')
        raise Exception('Unable to find valid operator_id')
    fix_gpci(h.hcurs,h.conf('cpt','contractor'),h.conf('cpt','locality'))
    PROCS = get_procs(h.hcurs)
    for proc in PROCS:
        cpts = get_proc_cpts(h.hcurs,proc['id'])
        hcpcs_ids = get_hcpcs_ids(h.hcurs,cpts)
        logging.info('sending procedure.id=%s %s with HCPCS mappings %s',proc['id'],proc['code'],repr(set(cpts)))
        update_hcpcs_mappings(h,proc['id'],hcpcs_ids,MET,opid)
    h.close()

if __name__ == '__main__':
    try:
        main()
    except:
        logging.critical(traceback.format_exc())
        print traceback.format_exc()
        sys.exit(1)
    sys.exit(0)
