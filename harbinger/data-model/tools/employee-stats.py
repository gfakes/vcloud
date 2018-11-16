#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,os,argparse
import tabulate
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def lookup_refs(cursor,employee_id):
    FK = [ 'claim_transactions.billing_employee_id',
           'claim_transactions.ordering_employee_id',
           'claim_transactions.performing_employee_id',
           'claim_transactions.posting_employee_id',
           'claim_transaction_facts.billing_employee_id',
           'claim_transaction_facts.ordering_employee_id',
           'claim_transaction_facts.performing_employee_id',
           'claim_transaction_facts.posting_employee_id',
           'employee_clinical_role_mappings.employee_id',
           'employee_demos.employee_id',
           'employee_specialty_mappings.employee_id',
           'patient_events_history.operator_employee_id',
           'patient_events.operator_employee_id',
           'rad_exam_personnel.scheduler_id',
           'rad_exam_personnel.signin_id',
           'rad_exam_personnel.authorizing_id',
           'rad_exam_personnel.checkin_id',
           'rad_exam_personnel.begin_exam_id',
           'rad_exam_personnel.end_exam_id',
           'rad_exam_personnel.performing_id',
           'rad_exam_personnel.attending_id',
           'rad_exam_personnel.ordering_id',
           'identifiers.employee_id',
           'rad_reports.transcriptionist_id',
           'rad_reports.rad1_id',
           'rad_reports.rad2_id',
           'rad_reports.rad3_id',
           'rad_reports.rad4_id',
           'residents.employee_id',
           'rad_exam_facts.ordering_provider_id',
           'rad_exam_facts.radiologist_id',
           'rad_exam_facts.technologist_id',
           'rad_exam_facts.resident_id',
           'rad_exam_personnel.assisting_tech1_id',
           'rad_exam_personnel.assisting_tech2_id',
           'rad_exam_personnel.assisting_tech3_id',
           'rad_exam_personnel.technologist_id' ]
    rad_exam_id_excludes = [ 'claim_transactions.billing_employee_id',
                             'claim_transactions.ordering_employee_id',
                             'claim_transactions.performing_employee_id',
                             'claim_transactions.posting_employee_id',
                             'claim_transaction_facts.billing_employee_id',
                             'claim_transaction_facts.ordering_employee_id',
                             'claim_transaction_facts.performing_employee_id',
                             'claim_transaction_facts.posting_employee_id',
                             'employee_clinical_role_mappings.employee_id',
                             'employee_demos.employee_id',
                             'employee_specialty_mappings.employee_id',
                             'patient_events_history.operator_employee_id',
                             'patient_events.operator_employee_id',
                             'identifiers.employee_id',
                             'residents.employee_id' ]
    stats = { 'vol'         : ('select count(id) vol ',''),
              'recent'      : ('select max(updated_at) recent ',''),
              'rad_exam_id' : ('select rad_exam_id', 'order by updated_at desc limit 1') }
    results = {}
    for fk in FK:
        for stat in stats.keys():
            value = None
            if stat=='rad_exam_id' and fk in rad_exam_id_excludes:
                continue # skip rad_exam_id query where appropriate
            if fk not in results:
                results[fk] = {}
            select, postwhere = stats[stat]
            table, col = fk.split('.')
            sql = '%s from %s where %s=%s%s' % (select,table,col,'%s',postwhere)
            cursor.execute(sql,(employee_id,))
            temp = cursor.fetchone()
            if temp!=None:
                value = temp[stat]
            results[fk][stat] = value
    return results
    
def main(h,opts):
    results = lookup_refs(h.hcurs,opts.employee_id)
    printable = []
    fk = results.keys()
    fk.sort()
    for key in fk:
        stats = results[key]
        row = (key,stats['vol'],stats['recent'],stats.get('rad_exam_id','N/A'))
        if stats['vol'] > 0:
            printable.append(row)
    header = ['Foreign Key','Ref Count','Most Recent .updated_at','Most Recent .rad_exam_id']
    print tabulate.tabulate(printable,headers=header,tablefmt='pipe')

if __name__ == '__main__':
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description='statistics about an employee\'s FK references (volume, most recent timestamp/IDs')
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
        parser.add_argument('employee_id', help='the employee.id that is being audited', type=int)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True)
        main(h,opts)
        h.close()
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    sys.exit(0)
