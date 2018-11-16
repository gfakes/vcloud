#!/usr/bin/env python

import sys,traceback,os,datetime,logging,pprint,imp,argparse,json
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def check_and_attempt_fix(row,h):
    select_sql = 'SELECT * FROM %s '%row.get("request_item_type") + 'where id=%s'
    control_select_sql = "SELECT * FROM control_merge_logs WHERE merged_table_name=%s AND merged_row_id = %s"
    merge_sql = "UPDATE hipaa_request_items SET request_item_id = %s WHERE id = %s"
    h.cursor.execute(select_sql,(row.get("request_item_id"),))
    fk_row = h.cursor.fetchone()
    fk_table = row.get("request_item_type")
    fk_id = row.get("request_item_id")
    if fk_row == None:
        logging.info("Found record without matching foreign record: %s -> %s",fk_table, fk_id)
        h.cursor.execute(control_select_sql,(fk_table, fk_id))
        merge_log = h.cursor.fetchone()
        if merge_log == None:
            logging.info("    No merge log for missing foreign record: %s -> %s",fk_table, fk_id)
            return "delete"
        else:
            logging.info("    Found merge log for missing foreign record: %s -> %s",fk_table, fk_id)
            logging.info("    Updating HIPAA to point to: %s -> %s",fk_table, merge_log.get("primary_row_id"))
            h.cursor.execute(merge_sql,(merge_log.get("primary_row_id"), row.get("id")))
            return "merged"
    else:
        reassign_patients_to_patient_mrns(row,h)
        #logging.info("Legit record: %s -> %s" % (fk_table, fk_id))

def delete_and_log(request,total_items,deleted,logfile):
    delete_hri_sql = "DELETE FROM hipaa_request_items WHERE id IN %s"
    delete_hr_sql = "DELETE FROM hipaa_requests WHERE id = %s"
    if len(deleted) == 0:
        return None
    logging.info("Delete and Log: %s",len(deleted))
    logging.info("DELETE FROM hipaa_request_items WHERE id IN %s",repr(tuple([x['id'] for x in deleted])))
    h.cursor.execute(delete_hri_sql,(tuple([x['id'] for x in deleted]),))
    if len(deleted) == total_items:
        logging.info("DELETE FROM hipaa_requests WHERE id = %s",request.get("id"))
        h.cursor.execute(delete_hr_sql,(request.get("id"),))
        orequest = request.copy()
        orequest["hipaa_request_items"] = deleted
        orequest["updated_at"] = utils.dt_to_json(request.get("updated_at"))
        out = [orequest]
    else:
        out = deleted
    logging.info("Reading records from %s",logfile)
    try:
        with open(logfile,"r") as f:
            try:
                currentlist = json.loads(f.read())
            except ValueError:
                currentlist = []
    except IOError:
        logging.info("No old set of deleted_hipaa_logs")
        currentlist = []
    logging.info("Writing %s records to %s",len(deleted),logfile)
    with open(logfile,"w") as f:
        #logging.info(currentlist[0])
        for o in out:
            currentlist.append(o)
        f.write(json.dumps(currentlist))

def check_request_items(request,h):
    logfile = os.path.join(h.conf('local-paths','reports-dir'),'deleted_hipaa_logs.json')
    sql = "SELECT * FROM hipaa_request_items WHERE hipaa_request_id = %s"
    h.cursor.execute(sql,(request.get("id"),))
    items = h.cursor.fetchall()
    deleted = []
    for item in items:
        action = check_and_attempt_fix(item,h)
        if action == "delete":
            #import code; code.interact(local=locals()) # DEBUG
            deleted.append(utils.pgd2pyd(item))
    delete_and_log(request,len(items),deleted,logfile)

def reassign_patients_to_patient_mrns(row,h):
    select_sql = "SELECT id FROM patient_mrns WHERE patient_id=%s"
    delete_sql = "DELETE FROM hipaa_request_items WHERE id=%s"
    insert_sql = "INSERT INTO hipaa_request_items (hipaa_request_id, request_item_type, request_item_id) VALUES (%s, %s, %s)"
    if row.get("request_item_type") == "patients":
        h.cursor.execute(select_sql,(row.get("request_item_id"),))
        ids = h.cursor.fetchall()
        if len(ids) > 0:
            for i in [x.get('id') for x in ids]:
                logging.info("Adding hipaa_request_item for patient_mrn.id=%s",i)
                # can't use utils.insert_dict because SQL clause 'RETURNING ID' fails on partitioned tables with: "You need an unconditional ON INSERT DO INSTEAD rule with a RETURNING clause"
                h.cursor.execute(insert_sql,(row.get("hipaa_request_id"),"patient_mrns",i))
                logging.info("Removing original patient-based hipaa_request_item")
            h.cursor.execute(delete_sql,(row.get("id"),))
            return "legit"
        else:
            return "delete"
    else:
        return "legit"

def main(h,opts):
    sql = 'SELECT * from hipaa_requests where id between %s and %s'
    if utils.get_maxid(h.cursor,'hipaa_requests')==None:
        logging.warning('no rows in hipaa_requests, skipping data migration')
        return
    utils.walk_table(h.cursor,"hipaa_requests",sql,check_request_items,per_row_args=[h],CHUNK_SIZE=100)
    h.db.commit()

if __name__ == '__main__':
    DESC = 'Fix orphaned rows in HIPAA audit logs'
    SC = '/servers/harbinger/config/site.config.json'
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
        print 'ERROR: %s' % e
        logging.critical(traceback.format_exc())
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
