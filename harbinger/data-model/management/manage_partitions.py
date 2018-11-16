#!/usr/bin/env python

import sys,math,traceback,logging,imp,json
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# determine if a table exists, returns bool
def table_exists(cursor,table_name):
    exists_q = "SELECT COUNT(*) = 1 as exist FROM pg_tables WHERE schemaname = 'public' AND tablename = %s"
    cursor.execute(exists_q,[table_name])
    temp = cursor.fetchone()
    if temp!=None:
        return temp['exist']
    else:
        return False

# get current maximum id from a table or return 1 if zero rows in table
def table_max_id(cursor,table_name):
    max_id = 1
    max_id_q = "SELECT id as max_id FROM %s order by id desc limit 1" % table_name
    cursor.execute(max_id_q)
    temp = cursor.fetchone()
    if temp!=None:
        max_id = temp['max_id']
    return max_id

# determine if a partition table should be created, and create it if required
def create_next_part(cursor,part_info):
    # in this context, current partition = the partition table name that "should" be in use (based on the partition rules)
    # and expansion partition = the next partition that "should" be in use
    max_id = table_max_id(cursor,part_info['name']) # maximum ID of table
    p_size = part_info['size'] # max desired rowcount for any given partition in the table
    free = math.ceil(max_id / (p_size + 0.0)) * p_size - max_id # determine free space in current partition
    next_part = int(math.ceil((max_id / (p_size + 1.0)))) # determine expansion partition number
    part_num_str = '%05d' % next_part # pad expansion partition number to 5 digits
    prev_part_str = '%05d' % (next_part - 1) # determine current partition number, padded to 5 digits
    partition_name = '%s_%s' % (part_info['name'], part_num_str) # expansion partition name
    prev_partition_name = '%s_%s' % (part_info['name'], prev_part_str) # current partition name
    #import code; code.interact(local=locals()) # DEBUG

    # check if current partition already exists, log warning if it doesn't
    if not table_exists(cursor,prev_partition_name):
        logging.warning("Current partition has overflowed, expected to find %s but it does not exist.",prev_partition_name)

    # check if current free space in active partition is less than desired
    if free < part_info['free']:
        # check if expansion partition already exists
        if table_exists(cursor,partition_name):
            # if table already exists, bail
            logging.debug('Current partition %s is adequate, has %s free rows',partition_name,part_info['free'])
            return

        # since next partition doesn't exist, create it
        id_from = (next_part * p_size) + 1 # lower ID bound for expansion partition
        id_to = (next_part + 1) * p_size; # upper ID bound for expansion partition

        # log status before creating the expansion partition
        logging.info("Max ID of %s: %s",part_info['name'], max_id)
        logging.info("Creating %s %s %s", partition_name, id_from, id_to)
        # create a list of SQL operations to create the expansion partition, add the constraints and rules
        ops = [('CREATE TABLE %s () INHERITS (%s)' % (partition_name,part_info['name']),[]),
               ('ALTER TABLE %s ADD CONSTRAINT %s_%s_id_check CHECK %s ' % (partition_name,part_info['name-prefix'],part_num_str,'(((id >= %s) AND (id <= %s)))'),[id_from,id_to]),
               ('ALTER TABLE %s ADD CONSTRAINT %s_%s_pk PRIMARY KEY (id)' % (partition_name,part_info['name-prefix'],part_num_str),[]),
               ('CREATE RULE %s as ON INSERT TO %s WHERE (id between %s) DO INSTEAD INSERT INTO %s VALUES (NEW.*)' % (partition_name,part_info['name'], '%s AND %s', partition_name),[id_from,id_to])]
        # add the necessary indexes to the SQL operations for the expansion partition by iterating over each index
        ops += [('CREATE INDEX %s ON %s USING btree (%s)' % ('%s_%s_%s' % (part_info['name-prefix'],part_num_str,i['name']),partition_name,','.join(i['columns'])),[]) for i in part_info['indexes']]
        # execute each SQL operation
        for s in ops:
            # log SQL operations
            logging.info("Executing: %s %s", s[0],s[1])
            # s[0] = SQL, s[1] = arguments
            cursor.execute(s[0],s[1])

def main():
    h = utils.HarbingerETEnv('/servers/harbinger/config/site.config.json','bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
    logging.info('database partition management cron')
    # load JSON config of partition table definitions
    tables = json.load(open('/servers/harbinger/harbinger/data-model/partition-config.json'))
    # iterate every table in config
    for t in tables['partitions']:
        create_next_part(h.hcurs,t)
    h.hdb.commit()
    h.close()

if __name__ == '__main__':
    try:
        main()
    except:
        logging.critical(traceback.format_exc())
        print traceback.format_exc()
        sys.exit(1)
    sys.exit(0)
