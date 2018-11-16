import os,csv,datetime,json,collections,pprint,logging,decimal,collections,calendar,time,subprocess
import pytz,pika,psycopg2,psycopg2.extras,tqdm,paramiko

########################################################################################################
# file / TSV / CSV helpers
########################################################################################################

# opens filename as csv with tab delimiter
# return a generator that yields dictionaries
# dictionaries keys will be first row of csv.reader with spaces replaced to - and # replaced to number
# duplicate headers get appended with the suffix -extra
def open_tsv(filename,delim='\t'):
    reader = csv.reader(open(filename),delimiter=delim)
    return make_tsv_gen(reader)

# take a csv.reader and returns a generator that yields dictionaries
# dictionaries keys will be first row of csv.reader with spaces replaced to - and # replaced to number
# duplicate headers get appended with the suffix -extra
def make_tsv_gen(reader):
    header = [t.lower().replace(' ','-').replace('#','number') for t in reader.next()]
    # deal w/ duplicate header names
    temp = set()
    x=0
    while x<len(header):
        while header[x] in temp:
            header[x] += '-extra'
        temp.add(header[x])
        x+=1
    for row in reader:
        yield dict(zip(header,(v.strip() for v in row)))

# similar to open_tsv, but with slightly different options:
# takes an already open fileobj (usecase: reading from within a zipfile)
# and also allows an arbitrary number of rows to be skipped and multi-line headers
# dictionaries keys will be first row of csv.reader with spaces replaced to - and # replaced to number
# duplicate headers get appended with the suffix -extra
#
# multi-line headers add each successive line together, e.g. headcount=2 with input of:
#   col1 , col2 , col3 , col4
#   why  , does  , cms  , dothis
# would return a header of ['col1 why', 'col2 does', 'col3 cm3', 'col4 dothis']
def open_csv(fileobj,skip=0,headcount=1):
    reader = csv.reader(fileobj)
    return make_csv_gen(reader,skip,headcount)

# similar to make_csv_gen, but with slightly different options:
# takes a csv.reader and allows an arbitrary number of rows to be skipped and multi-line headers
# dictionaries keys will be first row of csv.reader with spaces replaced to - and # replaced to number
# duplicate headers get appended with the suffix -extra
#
# multi-line headers add each successive line together, e.g. headcount=2 with input of:
#   col1 , col2 , col3 , col4
#   why  , does  , cms  , dothis
# would return a header of ['col1 why', 'col2 does', 'col3 cm3', 'col4 dothis']
def make_csv_gen(reader,skip,headcount):
    while skip>0:
        reader.next()
        skip -= 1
    header = [t.lower().strip() for t in reader.next()]
    headcount -=1
    while headcount>0:
        temp = [t.lower().strip() for t in reader.next()]
        for x in range(0,len(header)):
            if temp[x]!='':
                header[x]=(header[x]+' '+temp[x]).strip()
        headcount -=1
    # deal w/ duplicate header names
    temp = set()
    x=0
    while x<len(header):
        while header[x] in temp:
            header[x] += '-extra'
        temp.add(header[x])
        x+=1
    for row in reader:
        yield dict(zip(header,(v.strip() for v in row)))

# barebones/simple csv reader for headerless files
# return yields dictionaries of header
def open_csv_nohead(filename,header):
    reader = csv.reader(open(filename))
    for row in reader:
        yield dict(zip(header,(v.strip() for v in row)))

########################################################################################################
# config / ET / migration / buildout helpers
########################################################################################################
class DMResponse(Exception):
    '''because exception-based flow-control is the only way i can figure this out :('''

# JSON config class to handle site.config.json
class JSONConfig:
    def __init__(self,cfile):
        self.config = {}
        try:
            self.config = json.load(open(cfile))
        except Exception as e:
            print 'Unable to load config file'
            raise Exception('Unable to load config file')

    # return value for given key pair
    def get(self,section,key):
        val = self.config.get(section,{}).get(key)
        if type(val)==type(u''):
            val = val.encode('utf8')
        return val

# opens file named cfile as JSONConfig
# returns JSONConfig object
def load_config(cfile):
    return JSONConfig(cfile)

# configure AMQP sending to a host based on config file
class AmqpSender:
    def __init__(self,cfile):
        self.config = load_config(cfile)
        self.hconn = None # connection
        self.harbinger = None # channel
        self.connect_amqp()

    # establish connection
    def connect_amqp(self):
        try:
            cred = pika.PlainCredentials(self.config.get('amqp','login'),self.config.get('amqp','password'))
            self.hconn = pika.BlockingConnection(pika.ConnectionParameters(host=self.config.get('amqp','host'),credentials=cred))
            self.harbinger = self.hconn.channel()
            logging.info('UTILS: opened AQMP connection to %s',self.config.get('amqp','host'))
        except Exception as e:
            logging.critical('UTILS: caught exception: %s',repr(e))
            logging.critical('UTILS: unable to connect to AMQP')
            raise Exception('AMQP Connection Failure')

    # close connection
    def close_amqp(self):
        if self.hconn!=None:
            self.hconn.close()
            logging.info('UTILS: closed AQMP connection to %s',self.config.get('amqp','host'))

    # retain backward compatibility
    def close(self):
        self.close_amqp()

    # send regular messages to the data-manager (no ACK)
    # no return
    def send(self,exchange,routing_key,payload):
        try:
            self.harbinger.basic_publish(exchange,routing_key,json.dumps(payload),properties=pika.BasicProperties(delivery_mode = 2))
            logging.debug('UTILS: sent %s to exchange=%s with routing_key=%s',json.dumps(payload),exchange,routing_key)
        except Exception as e:
            logging.critical('UTILS: caught exception: %s',repr(e))
            logging.critical('UTILS: unable to send to AQMP connection %s exchange=%s routing key=%s',self.config.get('amqp','host'),exchange,routing_key)
            raise Exception('Harbinger AMQP Send Failure')

    # send control messages to the data-manager (blocks waiting for ACK)
    # returns success/failure
    def send_control(self,message,routing_key):
        success = False
        uniq = 'cmdline-utils'
        send_exchange = 'control_requests'
        listen_exchange = 'control_responses'
        real_catch = '%s.#' % uniq
        real_routing_key = '%s.%s' % (uniq,routing_key)
        # bind to queue and send
        q = self.harbinger.queue_declare(exclusive=True,auto_delete=True)
        qname = q.method.queue
        self.harbinger.queue_bind(exchange=listen_exchange,queue=qname,routing_key=real_catch)
        self.harbinger.basic_consume(self.dm_callback,queue=qname)
        self.send(send_exchange,real_routing_key,message)
        # start listening and wait for desired response
        try:
            self.harbinger.start_consuming()
        except DMResponse:
            success = True
        except Exception as e:
            logging.error('UTILS: control_response capture failed, got %s',repr(e))
        finally:
            self.harbinger.stop_consuming()
        return success

    # handle responses from the data manager
    def dm_callback(self,channel,method,properties,body):
        channel.basic_ack(delivery_tag=method.delivery_tag)
        msg = json.loads(body)
        logging.debug('UTILS:  received message=%s',msg)
        rk = method.routing_key
        status = rk.split('.')[-1]
        if status=='complete':
            logging.info('UTILS:  success: data_manager_message_log_id=%s',msg)
            raise DMResponse('Message Received')
        elif status=='error':
            logging.error('UTILS:  failure: data_manager_message_log_id=%s',msg)
            raise Exception('Message Failed')

    # wait for queues to settle before continuing
    def wait_quiesce(self):
        cmd = ['rabbitmqadmin','-u',self.config.get('amqp','login'),'-p',self.config.get('amqp','password'),
               '-f','pretty_json','list','queues','name','messages']
        total = 1
        while total > 0:
            time.sleep(15)
            rabbit_status = json.loads(subprocess.check_output(cmd))
            total = 0
            for q in rabbit_status:
                if q['name']!='harbinger-usage-requests':
                    total += q['messages']
            logging.info('UTILS: waiting for queues to quiesce, total messages in all queues=%s',total)

# connect to postgres schema based on config
class schemaConnect:
    def __init__(self,schema,cfile):
        self.schema = schema
        self.config = load_config(cfile)
        self.db = None # database connection
        self.cursor = None # cursor
        self.connect_db()

    # open db connection
    def connect_db(self):
        try:
            cfg = (self.config.get('harbinger','host'),
                   self.config.get('harbinger','database'),
                   self.config.get(self.schema,'login'),
                   self.config.get(self.schema,'password'))
            connect = "host='%s' dbname='%s' user='%s' password='%s' client_encoding='UTF8'" % cfg
            self.db = psycopg2.connect(connect)
            self.cursor = self.db.cursor(cursor_factory=psycopg2.extras.DictCursor)
            logging.info('UTILS: opened Harbinger DB connection to %s.%s',self.config.get('harbinger','host'),self.schema)
        except Exception as e:
            logging.critical('UTILS: caught exception: %s',repr(e))
            logging.critical('UTILS: unable to connect to Harbinger DB')
            raise Exception('Harbinger DB Connection Failure')

    # close db connection
    def close_db(self):
        if self.db!=None:
            self.db.close()
            logging.info('UTILS: closed Harbinger DB connection to %s.%s',self.config.get('harbinger','host'),self.schema)

# super-useful class to create an ET environment for Harbinger
# loads site config file and provides access to config variables,
# handles logging with basic timing info, opens/closes AMQP, database, SFTP connections
class HarbingerETEnv:
    def __init__(self,cfile,logname,amqp=True,db=False,schema='harbinger'):
        self.config = load_config(cfile) # JSONConfig
        # setup logging
        logging.basicConfig(filename=os.path.join(self.config.get('local-paths','logging-dir'),logname),
                            level=self.config.get('logging','python-level'),
                            format='%(asctime)s: %(levelname)s: %(message)s')
        self.started = datetime.datetime.now() # log script runtime
        logging.info('UTILS: starting')
        self.schema = schema # db schema
        self.amqp = None # AmqpSender
        self.pgc = None # schemaConnect
        self.hconn = None # amqp connection
        self.harbinger = None # amqp channel
        self.hdb = self.db = None # db connection
        self.hcurs = self.cursor = None # db cursor
        self.transport = None # paramiko connection
        self.sftp = None # sftp
        # only connect to amqp if set
        if amqp:
            self.amqp = AmqpSender(cfile)
            self.hconn = self.amqp.hconn
            self.harbinger = self.amqp.harbinger
        # only connect to db if set
        if db:
            self.pgc = schemaConnect(self.schema,cfile)
            self.hdb = self.db = self.pgc.db
            self.hcurs = self.cursor = self.pgc.cursor

    # get JSONConfig value (pass through)
    def conf(self,section,key):
        return self.config.get(section,key)

    # close AmqpSender (pass through)
    def close_amqp(self):
        if self.hconn!=None:
            self.amqp.close()

    # close schemaConnect (pass through)
    def close_db(self):
        if self.pgc!=None:
            self.pgc.close_db()

    # prepare to shutdown class, disconnect from db and amqp, log runtime
    def close(self):
        self.close_db()
        self.close_amqp()
        self.sftp_disconnect()
        duration = datetime.datetime.now() - self.started
        logging.info('UTILS: finished, script runtime was %s',duration)

    # pass through to AmqpSender
    def send(self,exchange,routing_key,payload):
        self.amqp.send(exchange,routing_key,payload)

    # pass through to AmqpSender
    def send_control(self,message,routing_key):
        return self.amqp.send_control(message,routing_key)

    # pass through to AmqpSender
    def wait_quiesce(self):
        self.amqp.wait_quiesce()

    # establish SFTP connection with optional retries and RSA pk support
    def sftp_connect(self,MAX_RETRY=2):
        attempt = 1
        connected = False
        pk = False
        if self.config.get('sftp','keyfile')!=None:
            pk = True
        logging.info('UTILS: attempting to connect to %s@%s:%s',self.config.get('sftp','login'),self.config.get('sftp','host'),self.config.get('sftp','port'))
        # try to reconnect while not connected up to MAX_RETRY times
        while attempt<MAX_RETRY and connected == False:
            try:
                if pk:
                    privatekeyfile = os.path.join(self.config.get('local-paths','config-dir'),self.config.get('sftp','keyfile'))
                    mykey = paramiko.RSAKey.from_private_key_file(privatekeyfile,password=self.config.get('sftp','password'))
                self.transport = paramiko.Transport((self.config.get('sftp','host'),self.config.get('sftp','port')))
                if pk:
                    self.transport.connect(username=self.config.get('sftp','login'),pkey = mykey)
                else:
                    self.transport.connect(username=self.config.get('sftp','login'),password=self.config.get('sftp','password'))
                self.sftp = paramiko.SFTPClient.from_transport(self.transport)
                connected = True
                logging.info('UTILS: connected to %s@%s:%s',self.config.get('sftp','login'),self.config.get('sftp','host'),self.config.get('sftp','port'))
            except Exception as e:
                logging.error('unable to connect: %s',repr(e))
                logging.error('failed to connect on attempt # %s',attempt)
                attempt += 1
        if not connected:
            logging.error('UTILS: failed to connect to %s@%s:%s',self.config.get('sftp','login'),self.config.get('sftp','host'),self.config.get('sftp','port'))
            raise Exception('Unable to connect to %s@%s:%s'%(self.config.get('sftp','login'),self.config.get('sftp','host'),self.config.get('sftp','port')))

    # disconnect paramiko transport
    def sftp_disconnect(self):
        if self.transport!=None and self.transport.is_active():
            self.transport.close()
            logging.info('UTILS: disconnected from %s@%s:%s',self.config.get('sftp','login'),self.config.get('sftp','host'),self.config.get('sftp','port'))

    # send file to SFTP site
    def sftp_put(self,local_path,remote_path):
        lazy = False
        if self.sftp==None:
            lazy = True
            self.sftp_connect()
        try:
            self.sftp.put(local_path,remote_path)
            logging.info('UTILS: put %s to %s',local_path,remote_path)
        except Exception as e:
            logging.error('UTILS: failed to put %s to %s, got %s',local_path,remote_path,repr(e))
        if lazy:
            self.sftp_disconnect()

    # get file from SFTP site
    def sftp_get(self,remote_path,local_path):
        lazy = False
        if self.sftp==None:
            lazy = True
            self.sftp_connect()
        try:
            self.sftp.get(remote_path,local_path)
            logging.info('UTILS: get %s to %s',remote_path,local_path)
        except Exception as e:
            logging.error('UTILS: failed to get %s to %s, got %s',remote_path,local_path,repr(e))
        if lazy:
            self.sftp_disconnect()

# walk a table for iterative tasks that require action on every row in a database table
#
# sql is the select statement to walk the table (which allows for non-walked-table data to be available in the iterative actions), the last 2 args must be the min/max range of the PK of the table being walked
# per_row_func refers to the function that will be run on every row from the selected sql
# pk is the primary key column of the table being iterated (default=id)
# sql args is an optional tuple of args (before the min/max values) to the select sql
# per_row_args is an optional tuple of additional args (after the result row dict) passed into the per_row_func
# tqdm sets the option to display a console progress bar (disabled by default)
def walk_table(cursor,table,sql,per_row_func,pk='id',CHUNK_SIZE=5000,sql_args=(),per_row_args=(),progressBar=False):
    max_sql = 'select max(%s) maxid from %s' % (pk,table)
    total_rows = 0
    cursor.execute(max_sql)
    MAXID = cursor.fetchone()['maxid']
    if MAXID==None:
        logging.critical('UTILS: no valid maximum ID for table %s, aborting walk',table)
        raise Exception('no valid maximum ID for table %s, aborting walk',table)
    else:
        logging.info('UTILS: walking %s up to max(%s)=%s',table,pk,MAXID)
    if progressBar:
        for idmin in tqdm.tqdm(xrange(1,MAXID,CHUNK_SIZE),desc='walking table %s'%table,leave=True):
            idmax = idmin + CHUNK_SIZE - 1
            cursor.execute(sql,sql_args+(idmin,idmax))
            rows = cursor.fetchall()
            if rows!=None:
                row_count = len(rows)
            else:
                row_count = 0
            total_rows += row_count
            logging.info('UTILS: fetching %s.%s between %s and %s, got %s rows',table,pk,idmin,idmax,row_count)
            if row_count == 0:
                continue
            for row in rows:
                per_row_func(row,*per_row_args)
        print # tqdm
    else:
        for idmin in xrange(1,MAXID,CHUNK_SIZE):
            idmax = idmin + CHUNK_SIZE - 1
            cursor.execute(sql,sql_args+(idmin,idmax))
            rows = cursor.fetchall()
            if rows!=None:
                row_count = len(rows)
            else:
                row_count = 0
            total_rows += row_count
            logging.info('UTILS: fetching %s.%s between %s and %s, got %s rows',table,pk,idmin,idmax,row_count)
            if row_count == 0:
                continue
            for row in rows:
                per_row_func(row,*per_row_args)
    logging.info('UTILS: completed walking %s, got %s total rows',table,total_rows)

# an easier-to-use version of the process_group() helper, it takes strings instead of IDs
# give it a list of each group you are mapping to a list of roles
# ecrm => employee_clinical_role_mappings
#
# template ecrm:
# ecrm = [ { 'dept'  : 'Radiology',
#            'roles' : ['ai-staff',],
#            'es'    : 'External System',
#            'ms'    : 'Metasite',
#            'idt'   : 'Login',
#            'emps'  : ['login_identifier1','login_identifier2'] }, ]
#
# example ecrm:
# ecrm = [ { 'dept'  : 'Radiology',
#            'roles' : ['ai-staff',],
#            'es'    : 'Active Directory',
#            'ms'    : 'Customer Metasite',
#            'idt'   : 'Login',
#            'emps'  : ['ctoland','mdaly'] }, ]
def map_employee_clinical_roles(cursor,ecrm):
    for group in ecrm:
        dept_id = find_or_insertOne(cursor,'departments','department',group['dept'])
        es_id = esmeta_find_or_create(cursor,(group['es'],group['ms']))
        idt_id = find_or_insertOne(cursor,'identifier_types','identifier_type',group['idt'])
        process_group(cursor, group['emps'], group['roles'], es_id, idt_id, dept_id)

# setup external systems / metasites and their important/associated children (statuses, sites, roles, etc.)
# also sets configuration_variables for login info
# template esms:
# esms = { 'metasite1' : { 'external_systems' : [ { 'name'        : 'extsys1',
#                                                   'roles'       : [ 'source_from_external_system_roles_table','can_be_empty_list'],
#                                                   'statuses'    : [ ('ext_sys_status','source_from_universal_event_types'),
#                                                                     ('statuses_key_is_optional','etc') ] },
#                                                 { 'name'        : 'extsys2',
#                                                   'roles'       : [],
#                                                   'config_vars' : True } ] }, # this flag sets configuration_variables login-* to match this external_system key
#          'metasite2' : { } } # ETC
#
# example esms:
# esms = { 'Customer Metasite' : { 'external_systems' : [ { 'name'        : 'GE Centricity',
#                                                           'roles'       : ['RIS',],
#                                                           'statuses'   : [ ('F','final'),
#                                                                            ('X','cancelled'),
#                                                                            ('C','complete') ] },
#                                                         { 'name'        : 'Active Directory',
#                                                           'roles'       : ['Authentication',],
#                                                           'config_vars' : True },
#                                                         { 'name'        : 'Epic',
#                                                           'roles'       : ['Registration','HIS','EMR'] } ],
#                                  'sites'            : [ ('Site1','Main Hospital'),
#                                                         ('Site2','Outpatient Clinic'),
#                                                         ('Site3','Hospital 3') ] } }
#          'National Provider Identifier Registry' : { 'external_systems' : [ { 'name'  : 'NPI',
#                                                                               'roles' : ['Credentialing',] } ] } }
def setup_esms(cursor,esms):
    for metasite in esms.keys():
        ms_id = find_or_insertOne(cursor,'metasites','metasite',metasite)
        for es in esms[metasite]['external_systems']:
            es_id = insert_dict(cursor,'external_systems',{'external_system':es['name'],'metasite_id':ms_id})
            for role in es['roles']:
                role_id = get_single_id(cursor,'external_system_roles','system_role',role)
                esrm_id = insert_dict(cursor,'external_system_role_mappings',{'external_system_id'      : es_id,
                                                                              'external_system_role_id' : role_id } )
            for pair in es.get('statuses',[]):
                status, uet = pair
                uet_id = get_single_id(cursor,'universal_event_types','event_type',uet)
                ess = { 'external_system_id'      : es_id,
                        'universal_event_type_id' : uet_id,
                        'status'                  : status }
                ess_id = insert_dict(cursor,'external_system_statuses',ess)
            if es.get('config_vars')==True:
                cv_id = find_or_insertSimple(cursor,'configuration_variables',
                                                   {'configuration_key'   : 'login-metasite',
                                                    'configuration_value' : metasite })
                cv_id = find_or_insertSimple(cursor,'configuration_variables',
                                                   {'configuration_key'   : 'login-external-system',
                                                    'configuration_value' : es['name'] })
                cv_id = find_or_insertSimple(cursor,'configuration_variables',
                                                   {'configuration_key'   : 'login-identifier-type',
                                                    'configuration_value' : 'Login' }) # controversial?
        for pair in esms[metasite].get('sites',[]):
            site, name = pair
            s = { 'site' : site,
                  'name' : name }
            site_id = find_or_insertSimple(cursor,'sites',s)
            ma_id = find_or_insertSimple(cursor,'metasite_associations',{'metasite_id':ms_id,'site_id':site_id})

# find a single configuration_variable
def get_config_var(cursor,key):
    cvar = None
    sql = 'select configuration_value from configuration_variables where configuration_key = %s'
    cursor.execute(sql,(key,))
    temp = cursor.fetchone()
    if temp!=None:
        cvar = temp['configuration_value']
        logging.debug('UTILS: configuration_variable=%s has value=%s',key,cvar)
    else:
        logging.warning('UTILS: no configuration_variable=%s found')
    return cvar

# return a dictionary of configuration keys/values
def get_config_vars(cursor):
    cvars = {}
    sql = 'select configuration_key,configuration_value from configuration_variables'
    cursor.execute(sql)
    temp = cursor.fetchall()
    if temp!=[]:
        cvars = dict([(x['configuration_key'],x['configuration_value']) for x in temp])
    else:
        logging.warning('UTILS: no configuration_variables in system!')
    return cvars

# given an identifier, use the configuration_variables table to get the employee_id
def get_operator(curs,ident):
    opid = None
    sql = ''' select e.* from employees e left outer join identifiers i on i.employee_id=e.id
                              left outer join external_systems es on es.id=i.external_system_id
                              left outer join metasites m on m.id=es.metasite_id
                              left outer join identifier_types it on it.id=i.identifier_type_id
              where it.identifier_type=(select configuration_value from configuration_variables where configuration_key=%s) and
                    es.external_system=(select configuration_value from configuration_variables where configuration_key=%s) and
                    m.metasite=(select configuration_value from configuration_variables where configuration_key=%s) and i.identifier=%s '''
    curs.execute(sql,('login-identifier-type','login-external-system','login-metasite',ident))
    temp = curs.fetchone()
    if temp!=None:
        opid = temp['id']
    logging.debug('UTILS: using operator employee.id=%s for identifier=%s based on configuration_variables',opid,ident)
    return opid

# get employee ID from identifier, identifier_type_id and external_system_id
def empid_from_ident(curs,ident,ident_type_id,ext_sys_id):
    emp_id = None
    sql = ''' select * from identifiers where identifier=%s and identifier_type_id=%s and external_system_id=%s '''
    curs.execute(sql,(ident,ident_type_id,ext_sys_id))
    temp = curs.fetchone()
    if temp!=None:
        emp_id = temp['employee_id']
    return emp_id

# get person ID from employee ID
def personid_from_empid(curs,empid):
    if empid==None:
        return empid
    personid = None
    sql = ''' select * from employees where id=%s '''
    curs.execute(sql,(empid,))
    temp = curs.fetchone()
    if temp!=None:
        personid = temp['person_id']
    return personid

# get all the clinical_role_ids for an employee ID
def clinicalroleids_from_empid(curs,emp_id):
    role_ids = []
    sql = ''' select clinical_role_id from employee_clinical_role_mappings where employee_id=%s '''
    curs.execute(sql,(emp_id,))
    temp = curs.fetchall()
    if temp!=None:
        for row in temp:
            role_ids.append(row['clinical_role_id'])
    return role_ids

# get all the specialty_ids for an employee ID
def specialtyids_from_empid(curs,emp_id):
    spec_ids = []
    sql = ''' select specialty_id from employee_specialty_mappings where employee_id=%s '''
    curs.execute(sql,(emp_id,))
    temp = curs.fetchall()
    if temp!=None:
        for row in temp:
            spec_ids.append(row['specialty_id'])
    return spec_ids

# get current_employee_id for a person_id
def get_current_empid(curs,person_id):
    emp_id = None
    sql = ''' select current_employee_id from people where id=%s '''
    curs.execute(sql,(person_id,))
    temp = curs.fetchone()
    if temp!=None:
        emp_id = temp['current_employee_id']
    return emp_id

# inserts or updates a radiologist with a complex dict (rad)
# does lookups to ensure the end result is that employee has all the info
# from the rad dict inserted - doesn't delete extra attributes not specified
# or updates things to match
#
# rad = { 'identifiers' : [ { 'identifier'         : example_ident,
#                             'identifier_type_id' : identifier_type_id,
#                             'external_system_id' : external_system_id },
#                           { etc. } ],
#         'roles'       : [ role1_id, role2_id, etc. ],
#         'specialties' : [ spec1_id, spec2_id, etc. ],
#         'academic_year' : current_year
#         'pgy'           : current_pgy_#
def rad_insert_or_update(curs,rad):
    logging.debug('UTILS: starting insert/update of rad %s',pprint.pformat(rad,width=1))
    person_id = None
    emp_id = None
    for ident in rad['identifiers']:
        if ident['identifier']==None:
            continue
        emp_id = empid_from_ident(curs,ident['identifier'],ident['identifier_type_id'],ident['external_system_id'])
        if emp_id!=None:
            ident['inserted'] = True
            logging.debug('UTILS: already found employee.id=%s for this identifier: %s',emp_id,ident['identifier'])
            person_id = personid_from_empid(curs,emp_id)
            logging.debug('UTILS: person.id=%s for employee.id=%s',person_id,emp_id)
    if person_id == None:
        person_id = insert_dict(curs,'people',{'name':rad['employee_name']})
        emp_id = insert_dict(curs,'employees',
                             { 'name'      : rad['employee_name'],
                               'active'    : rad.get('active',True),
                               'person_id' : person_id })
        update_dict(curs,'people',
                    { 'id'                  : person_id,
                      'current_employee_id' : emp_id })
    else:
        emp_id = get_current_empid(curs,person_id)
        if emp_id==None:
            logging.error('UTILS: should not be possible to have gotten to this code w/o an employee.id...')
            return None
    existing_roles = clinicalroleids_from_empid(curs,emp_id)
    for role in rad.get('roles',[]):
        if role in existing_roles:
            logging.warning('UTILS: skipping duplicate clinical_role mapping for employee.id=%s',emp_id)
        else:
            ecrm_id = insert_dict(curs,'employee_clinical_role_mappings',
                                  { 'clinical_role_id' : role,
                                    'employee_id'      : emp_id })
    primary_spec = True # assume that any specialty is primary
    existing_specs = specialtyids_from_empid(curs,emp_id)
    if existing_specs!=[]:
        primary_spec = False # if some specialties exist, assume one of them is primary
    for spec in rad.get('specialties',[]):
        if spec in existing_specs:
            logging.warning('UTILS: skipping duplicate specialty mapping for employee.id=%s',emp_id)
        else:
            # first spec inserted will be primary (unless they already exist)
            esm_id = insert_dict(curs,'employee_specialty_mappings',
                                         { 'specialty_id'      : spec,
                                           'employee_id'       : emp_id,
                                           'primary_specialty' : primary_spec })
            primary_spec = False # set all subsequent specs to not primary
    for ident in rad['identifiers']:
        if ident['identifier']==None:
            continue
        if ident.get('inserted')==True:
            logging.debug('UTILS: skipping dupe insert of identifier %s for employee.id=%s',ident['identifier'],emp_id)
            continue
        iid = insert_dict(curs,'identifiers',
                          { 'identifier'         : ident['identifier'],
                            'employee_id'        : emp_id,
                            'identifier_type_id' : ident['identifier_type_id'],
                            'external_system_id' : ident['external_system_id'] })
    # this is particularly difficult to understand because it was added for single customer migration
    if rad.get('pgy')!=None:
        ACADEMIC_YEAR = rad['academic_year']
        PGY = rad['pgy']
        res_id = insert_dict(curs,'residents',
                             { 'pgy2' : ACADEMIC_YEAR-PGY+1,
                               'pgy3' : ACADEMIC_YEAR-PGY+2,
                               'pgy4' : ACADEMIC_YEAR-PGY+3,
                               'pgy5' : ACADEMIC_YEAR-PGY+4,
                               'employee_id' : emp_id })
    logging.debug('UTILS: finished employee insert/update')
    return emp_id

# take in a list of hcpcs strings
# return a dictionary with the list cms_hcpcs_code_ids (from the active set of HCPCS codes) and the sum of the work RVU
def get_hcpcs(cursor,hcpcs):
    m = { 'hcpcs_ids' : [],
          'rvu'       : 0 }
    sql = ''' select chc.id, chc.work_rvu
              from cms_hcpcs_codes chc left outer join cms_hcpcs_code_revisions chcr on chc.cms_hcpcs_code_revision_id=chcr.id
              where chcr.active=%s and chc.cms_modifier_id is null and chc.hcpcs=%s '''
    for code in hcpcs:
        cursor.execute(sql,(True,code))
        temp = cursor.fetchone()
        if temp!=None:
            m['hcpcs_ids'].append(temp['id'])
            m['rvu'] += temp['work_rvu']
    return m


# take a list of dictionaries that contain mapping info for employee logins and clinical_roles and map them.
# presumes that employee identifiers are config-vars-default login types, will create new person/employee if
# they don't already exist.
#
# example ecrm list-of-dicts:
#    ecrm = [ { 'roles' : ['ai-staff',],
#               'emps'  : ['ctoland1','mdaly3','bslater1'] },
#             { 'roles' : ['director','radiologist'],
#               'emps'  : ['MHENRY8','TSCOTT4','JKLEIN1','EHOGGAR1','EHOULE1','CDIETZ1'] } ]
#
def set_ecrm(cursor,ecrm,dept='Radiology'):
    dept_id = find_or_insertOne(cursor,'departments','department',dept) # TODO: will need to be changed if/when clinical_roles change
    extsys_id = esmeta_find_or_create(cursor,(get_config_var(cursor,'login-external-system'),get_config_var(cursor,'login-metasite')))
    identifier_type_id = find_or_insertOne(cursor,'identifier_types','identifier_type',get_config_var(cursor,'login-identifier-type'))
    for group in ecrm:
        process_group(cursor,group['emps'],group['roles'],extsys_id,identifier_type_id,dept_id)

# take a list of identifiers, get the employee_id for each identifier (OR INSERT IT AS A NEW EMPLOYEE/PERSON)
# then map all the roles to each employee from the identifiers
# also needs the identifier external_system_id and identifier_type_id for the identifiers
# and the department_id of the roles
def process_group(cursor, identifiers, roles, external_system_id, identifier_type_id, department_id):
    for ident in identifiers:
        employee_id = empid_from_ident(cursor,ident,identifier_type_id,external_system_id)
        if employee_id == None:
            person_id = insert_dict(cursor,'people',{'name':ident})
            employee_id = insert_dict(cursor,'employees',
                                      { 'name'      : ident,
                                        'active'    : True,
                                        'person_id' : person_id })
            logging.info('UTILS: creating new employee for identifier=%s, new employee.id=%s',ident,employee_id)
            update_dict(cursor,'people',
                        { 'id'                  : person_id,
                          'current_employee_id' : employee_id })
            l_id = insert_dict(cursor,'identifiers',
                               { 'identifier'         : ident,
                                 'employee_id'        : employee_id,
                                 'identifier_type_id' : identifier_type_id,
                                 'external_system_id' : external_system_id })
        add_roles(cursor, employee_id, roles, department_id)

# adds each role (in dept) to employee, skips dupe roles
def add_roles(cursor, employee_id, roles, dept_id):
    # get current clinical role mappings
    sql = ''' select cr.clinical_role, cr.id cr_id, d.id dept_id, d.department dept
              from employee_clinical_role_mappings ecrm left outer join clinical_roles cr on cr.id=ecrm.clinical_role_id
              left outer join departments d on d.id=cr.department_id
              where ecrm.employee_id=%s '''
    cursor.execute(sql,(employee_id,))
    existing_raw = cursor.fetchall()
    existing_roles = [(x['clinical_role'],x['dept_id']) for x in existing_raw]
    for role in roles:
        if (role,dept_id) in existing_roles:
            logging.warning('UTILS: employee.id=%s already has clinical_role=%s mapped',employee_id,role)
        else:
            #import code; code.interact(local=locals())
            cr_id = get_id_of(cursor,'clinical_roles',['clinical_role','department_id'],[role,dept_id])
            crm_id = insert_dict(cursor,'employee_clinical_role_mappings',
                                 { 'employee_id'      : employee_id,
                                   'clinical_role_id' : cr_id })
            logging.debug('UTILS: inserted employee_clinical_role_mappings.id=%s',crm_id)

# lookup a GPCI by carrier and locality
def get_gpci_id(cursor,carrier,locality):
    gpci_id = None
    sql = ''' select cg.id
              from cms_gpci cg left outer join cms_hcpcs_code_revisions chcr on cg.cms_hcpcs_code_revision_id=chcr.id
              where chcr.active=%s and cg.carrier=%s and cg.locality=%s '''
    cursor.execute(sql,(True,carrier,locality))
    cgid = cursor.fetchone()
    if cgid!=None:
        gpci_id = cgid['id']
    return gpci_id

def dump_table(curs,tablename,sql,header,path):
    output = os.path.join(path,'%s.csv'%tablename)
    real_header = dict(zip(header,header))
    curs.execute(sql)
    data = curs.fetchall()
    f = open(output,'w')
    dw = csv.DictWriter(f,header,quoting=csv.QUOTE_ALL,extrasaction='ignore')
    dw.writerow(real_header)
    dw.writerows(data)
    f.close()

# given a string or integer CMS place of service code, determine if it is a "facility" or not
# CMS defs: http://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set.html
def determine_facility(cursor,pos_code):
    facility = None
    if pos_code!=None and pos_code.strip()!='':
        pos_code=int(pos_code.strip())
    else:
        pos_code = None
    sql = 'select cms_facility from cms_facility_types where pos_code=%s'
    cursor.execute(sql,(pos_code,))
    result = cursor.fetchone()
    if result!=None and result.get('cms_facility')!=None:
        facility = result['cms_facility']
    return facility

# find or create an external_system/metasite combination
# esmeta = (external_system, metasite)
def esmeta_find_or_create(curs,esmeta):
    extsys, metasite = esmeta
    msid = find_or_insertOne(curs,'metasites','metasite',metasite)
    return find_or_insertSimple(curs,'external_systems',{'external_system':extsys,'metasite_id':msid})

def generic_finder(curs,name,value):
    generics = { 'universal_event_type' : { 'table' : 'universal_event_types',
                                            'field' : 'event_type' },
                 'site'                 : { 'table' : 'sites',
                                            'field' : 'site' },
                 'modality'             : { 'table' : 'modalities',
                                            'field' : 'modality' } }
    return get_single_id(curs,generics[name]['table'],generics[name]['field'],value)

########################################################################################################
# general utility
########################################################################################################

# returns a copy of the input dictionary with whitespace values replaced as None
def emptys_to_none(inrow):
    out = inrow.copy()
    for col in out.keys():
        if out[col] == "" or out[col] == " ":
            out[col] = None
    return out

# make harbinger message dictionary safe/clean for transport:
# * convert all strings to unicode
# * convert stripped/empty strings to None
def clean_message(d):
    for k in d.keys():
        if type(d[k]) in (type(''),type(u'')):
            d[k] = unicode_or_empty(d[k]).strip()
            if d[k]=='':
                d[k] = None

# split string var based on whitespace
# returns an empty list if var==None
def splitnoneempty(var):
    if var!=None:
        return var.split()
    return []

# take a list of strings and return a single string joined with joiner (default newline)
# handles Nones in the strs list by skipping them
# strips results such that if entire list of strs has nothing joined, it returns None
def nonestringsjoin(strs,joiner='\n'):
    joined = ''
    for x in strs:
        if x!=None:
            joined += x+joiner
    if joined.strip() == '':
        joined = None
    elif len(joiner)==0:
        pass
    else:
        joined = joined[:-len(joiner)]
    return joined

# attempt to cast candidate to float
# return conversion or integer zero
# (note: idk why this function exists, it seems reallllly specificly weird)
def floatorzero(candidate):
    revised = 0
    try:
        revised = float(candidate)
    except Exception as e:
            logging.warning('UTILS: caught exception: %s',repr(e))
            logging.warning('UTILS: loatorzero conversion failure on %s',repr(candidate))
    return revised

# cast num to int
# return None if num==None or ''
# (note: very inconsistent with above float conversion)
def int_or_none(num):
    converted = None
    if num not in (None,''):
        converted = int(num)
    return converted

# takes a string, float, or int representing $USD and returns number of pennies
# WARNING: make sure to strip the following common strings in money representations: () , $
def moneyfy(money):
    cash = decimal.Decimal(money) * decimal.Decimal(100.00)
    pennies = int(cash)
    return pennies

# takes a value from a money type col and returns something human-printable
# designed for USD
def printable_money(pennies):
    return float(str(decimal.Decimal(pennies)/100))

# find chronologically earliest datetime from list, return default if dates are garbage
def earliest_event_time(default,dates):
    return sorted_event_times(default,dates,False)

# find chronologically latest datetime from list, return default if dates are garbage
def latest_event_time(default,dates):
    return sorted_event_times(default,dates,True)

# used by latest/earliest_event_time funcs above
def sorted_event_times(default,dates,reverse_sort):
    event_time = default
    temp = sorted(filter(None,dates),reverse=reverse_sort)
    if temp!=[]:
        event_time = temp[0]
    return event_time

# pull local timezone: only validated to work on Ubuntu 12 and 14
def local_timezone():
    tz = 'US/Eastern'
    try:
        f = open('/etc/timezone')
        tz = f.read().strip()
    except Exception as e:
        logging.error('UTILS: unable to read /etc/timezone, defaulting to US/Eastern')
    else:
        f.close()
    return tz

# convert a python datetime to ISO-8601 string for JSON
# also sets a timezone if none already present (defaults to local zone)
# defaults to None if strftime fails (e.g. DT < 1900)
def dt_to_json(dt,tz=None):
    jdt = None
    if tz==None:
        tz = local_timezone()
    if dt!=None:
        try:
            idt = dt
            if dt.tzinfo==None:
                idt = pytz.timezone(tz).localize(dt)
            jdt = idt.strftime('%Y-%m-%dT%H:%M:%S%z')
        except Exception as e:
            logging.warning('UTILS: caught exception: %s',repr(e))
            logging.warning('UTILS: dt_to_json conversion failure on dt=%s',repr(dt))
    return jdt

# convert a python date to ISO-8601 string for JSON
def d_to_json(d):
    jd = None
    if d!=None:
        try:
            jd = d.isoformat()[:10]
        except Exception as e:
            logging.warning('UTILS: caught exception: %s',repr(e))
            logging.warning('UTILS: d_to_json conversion failure on d=%s',repr(d))
    return jd

# return unix epoch time from a datetime
def dt_to_epoch(pydt):
    return calendar.timegm(pydt.utctimetuple())

# returns a human-friendly string from a timedelta
# shamelessly borrowed from http://stackoverflow.com/a/13756038
def strf_timedelta(td):
    seconds = int(td.total_seconds())
    periods = [ ('year',   60*60*24*365),
                ('month',  60*60*24*30),
                ('day',    60*60*24),
                ('hour',   60*60),
                ('minute', 60),
                ('second', 1) ]
    strings=[]
    if seconds==0:
        return "0.%s seconds" % td.microseconds # short-circuit for subsecond runs
    for period_name,period_seconds in periods:
        if seconds > period_seconds:
            period_value , seconds = divmod(seconds,period_seconds)
            if period_value == 1:
                strings.append("%s %s" % (period_value, period_name))
            else:
                if period_name=='second':
                    strings.append("%s.%s %ss" % (period_value, td.microseconds, period_name))
                else:
                    strings.append("%s %ss" % (period_value, period_name))
    return ", ".join(strings)

# useful for patient ages that come back as a timedelta
def timedelta_to_years(td):
    YEAR_IN_SEC = (60*60*24*365) # number of seconds/year
    age = int(td.total_seconds() / YEAR_IN_SEC)
    return age

# deprecating this, i don't think it's used anymore
#class jsonEncoder(json.JSONEncoder):
#    def default(self, obj):
#        if isinstance(obj, datetime.datetime):
#            return dt_to_json(obj)
#        elif isinstance(obj, datetime.date):
#            return d_to_json(obj)
#        return json.JSONEncoder.default(self, obj)

# flatten a list
def flatten(l):
    return list(flatgen(l))

# used to flatten a list
def flatgen(l):
    for el in l:
        if isinstance(el, collections.Iterable) and not isinstance(el, basestring):
            for sub in flatten(el):
                yield sub
        else:
            yield el

# cast candidate to string if it's not None
def strifnotnull(candidate):
    result = candidate
    if candidate!=None:
        result = str(candidate)
    return result

# if trash is unicode string, return it unchanged
# if trash is string, return it as unicode string
# if trash isn't a string or unicode string, return empty unicode string
def unicode_or_empty(trash):
    treasure = u''
    if trash!=None and type(trash)==type(''):
        treasure = trash.decode('UTF8','replace')
    elif type(trash)==type(u''):
        treasure = trash
    return treasure

# return a pair of date objects that bound last month and the first of this month
def get_drange_lastmonth():
    now = datetime.date.today()
    y,m = now.year, now.month
    END = datetime.date(y,m,1)
    if m==1:
        y -= 1
        m = 12
    else:
        m -= 1
    START = datetime.date(y,m,1)
    return (START,END)

# return if obj is a sequence
# source: http://stackoverflow.com/a/2937122
def isSeq(obj):
    if isinstance(obj, basestring):
        return False
    return isinstance(obj, collections.Sequence)


########################################################################################################
# database helpers (previously in dbutils.py)
#
# these are probably things that should be avoided whenever possible
# much of the dictionary-like functionality is built-in with pymssql, MySQLDB, and psycopg2
# really only cx_Oracle should be calling these fetches
########################################################################################################
def fetchoneDict(cursor):
    row = cursor.fetchone()
    if row is None: return None
    cols = [ d[0] for d in cursor.description ]
    return dict(zip(cols, row))

def fetchallDict(cursor):
    acc = []
    rowdict = fetchoneDict(cursor)
    while rowdict != None:
        acc.append(rowdict)
        rowdict = fetchoneDict(cursor)
    if acc == []:
        return None
    else:
        return acc

# insert a dictionary (data) into table w/o checking if it exists first
def insert_dict(curs, table, data):
    temp = table.split('.') # detect schema? i hope so...
    if len(temp)>1:
        schema, real_table = temp
        #logging.debug(curs.mogrify('insert into %s."%s" ("%s") values ' % (schema,real_table, '","'.join(data.keys())) + "(%s) returning id" % (','.join(['%s'] * len(data)),),data.values()))
        curs.execute('insert into %s."%s" ("%s") values ' % (schema,real_table, '","'.join(data.keys())) + "(%s) returning id" % (','.join(['%s'] * len(data)),),data.values())
    else:
        #logging.debug(curs.mogrify('insert into "%s" ("%s") values ' % (table, '","'.join(data.keys())) + "(%s) returning id" % (','.join(['%s'] * len(data)),),data.values()))
        curs.execute('insert into "%s" ("%s") values ' % (table, '","'.join(data.keys())) + "(%s) returning id" % (','.join(['%s'] * len(data)),),data.values())
    return curs.fetchone()[0]

# internally used by various db functions
def build_where(fields,values):
    return ' and '.join([('"%s" = ' % f) + '%s' for (f,v) in zip(fields,values) if v != None] + [('"%s" is null' % f) for (f,v) in zip(fields,values) if v == None])

# internally used by various db functions
def get_lookupN(curs, table, fields, values):
    curs.execute('select * from "%s" where %s' % (table,build_where(fields,values)),tuple([v for v in values if v != None]))

# lookup id of row from table based on fields with values
def get_id_of(curs,table,fields,values):
    get_lookupN(curs,table,fields,values)
    row = curs.fetchone()
    if row != None:
        return row['id']
    else:
        return None

# same as get_id_of except single field/value instead of lists
def get_single_id(curs,table,field,value):
    rid = get_id_of(curs,table,[field,],[value,])
    return rid

# get largest ID in a table
def get_maxid(curs,table):
    sql = 'select max(id) id from %s' % table
    curs.execute(sql)
    row = fetchoneDict(curs)
    if row != None:
        return row['id']
    else:
        return None

# internally used by various db functions
def find_or_insertN(curs, table, fields, values, data):
    if set(values) == set([None]):
        return None
    get_lookupN(curs, table, fields, values)
    row = curs.fetchone()
    if row:
        return row['id']
    else:
        return insert_dict(curs,table,data)

# finds ID of or inserts a new row into table with field/values
# if field/value lookup fails, inserts data
# allows simpler lookup with more comprehensive insert (sort of dumb, eh?)
def find_or_insert(curs, table, field, value, data):
    return find_or_insertN(curs,table,[field],[value], data)

# finds or inserts a row into table with single field/value
def find_or_insertOne(curs, table, field, value):
    data = dict(zip([field],[value]))
    return find_or_insert(curs, table, field, value, data)

# update an existing table row with dictionary (data), doesn't lookup if row exist first
def update_dict(curs,table,data):
    temp = table.split('.') # detect schema? i hope so...
    if len(temp)>1:
        schema, real_table = temp
        #logging.debug(curs.mogrify('update %s."%s" set %s ' % (schema,real_table,','.join([('"%s" = ' % f) + '%s' for f in data.keys()])) + "where id = %s", tuple(data.values() + [data['id']])))
        curs.execute('update %s."%s" set %s ' % (schema,real_table,','.join([('"%s" = ' % f) + '%s' for f in data.keys()])) + "where id = %s", tuple(data.values() + [data['id']]))
    else:
        #logging.debug(curs.mogrify('update "%s" set %s ' % (table,','.join([('"%s" = ' % f) + '%s' for f in data.keys()])) + "where id = %s", tuple(data.values() + [data['id']])))
        curs.execute('update "%s" set %s ' % (table,','.join([('"%s" = ' % f) + '%s' for f in data.keys()])) + "where id = %s", tuple(data.values() + [data['id']]))
    return data['id']

# update or insert a row into table based on data, does lookup first
def insert_or_update_dict(curs,table,data):
    if data.get('id',None) == None or get_id_of(curs,table,data.keys(),data.values())==None:
        return insert_dict(curs,table,data)
    else:
        return update_dict(curs,table,data)

def find_or_insertSimple(curs, table, data):
    return find_or_insertN(curs, table, data.keys(), data.values(), data)

# DB-specific
def oracle_strdt(strdt): # take Oracle-formatted string and return Datetime
    # '17-DEC-09 05.10.41.000000 PM'
    # '12-NOV-11 04.18.00.000000000 PM'
    return datetime.datetime.strptime(strdt[:17]+strdt[-2:],'%d-%b-%y %I.%M.%S%p')

def oracle_dt(dt): # turn datetime into Oracle-formatted string
    return dt.strftime('%Y-%m-%d %H:%M:%S')

# stupidy psycopg2 dictionary rows don't do .keys() and .values() in the same order
# and they also and don't pprint nicely either, this fixes that for those use cases
def pgd2pyd(pgdict):
    pydict = dict([(k,pgdict[k]) for k in pgdict.keys()])
    return pydict


########################################################################################################
# DEPRECATED: app schema data migration helpers (previously in hdbutils.py)
#
# at one time this was used to support an application schema migration script that would copy app schema
# data from server a to server b (different clinical FK), it has not been maintained is not recommenged
# to be used (just clone the entire DB)
########################################################################################################
def fk_migrator(funcname,values):
    funcs = { 'harbinger.resources'            : harbinger_ext_resources,
              'harbinger.sites'                : harbinger_ext_sites,
              'harbinger.specialties'          : harbinger_ext_specialties,
              'peerreview.exam_reviews'        : peerreview_exam_reviews,
              'scannerutilization.black_lists' : scannerutilization_black_lists }
    return funcs[funcname](**values)

def harbinger_ext_resources(cursor,resource_id):
    return { 'resource_id' : harbinger_resources(cursor,resource_id) }

def harbinger_ext_sites(cursor,site_id):
    return { 'site_id' : harbinger_sites(cursor,site_id) }

def harbinger_ext_specialties(cursor,specialty_id):
    return { 'specialty_id' : harbinger_specialties(cursor,specialty_id) }

def harbinger_simple(cursor,table,col,rid):
    value = None
    sql = 'select %s from %s ' % (col,table)
    sql += 'where id=%s'
    cursor.execute(sql,(rid,))
    temp = cursor.fetchone()
    if temp!=None:
        value = temp[col]
    return value

def harbinger_modalities(cursor,modality_id):
    logging.debug('UTILS: FK finding modalities.id=%s',modality_id)
    saved = { 'modalities' : { 'id'       : modality_id,
                               'modality' : harbinger_simple(cursor,'modalities','modality',modality_id) } }
    return saved

def harbinger_sites(cursor,site_id):
    logging.debug('UTILS: FK finding sites.id=%s',site_id)
    saved = { 'sites' : { 'id'   : site_id,
                          'site' : harbinger_simple(cursor,'sites','site',site_id) } }
    return saved

def harbinger_specialties(cursor,specialty_id):
    logging.debug('UTILS: FK finding specialties.id=%s',specialty_id)
    saved = { 'specialties' : { 'id'        : specialty_id,
                                'specialty' : harbinger_simple(cursor,'specialties','specialty',specialty_id) } }
    return saved

def harbinger_resources(cursor,resource_id):
    logging.debug('UTILS: FK finding resources.id=%s',resource_id)
    saved = {}
    sql = ''' select resource,modality_id,site_id from resources where id=%s '''
    cursor.execute(sql,(resource_id,))
    temp = cursor.fetchone()
    if temp!=None:
        saved['resources'] = { 'id'          : resource_id,
                               'resource'    : temp['resource'],
                               'modality_id' : harbinger_modalities(cursor,temp['modality_id']),
                               'site_id'     : harbinger_sites(cursor,temp['site_id']) }
    return saved

def harbinger_rad_exams(cursor,rad_exam_id):
    logging.debug('UTILS: FK finding rad_exams.id=%s',rad_exam_id)
    saved = {}
    sql = ''' select id,accession,site_id from rad_exams where id=%s '''
    cursor.execute(sql,(rad_exam_id,))
    temp = cursor.fetchone()
    if temp!=None:
        saved['rad_exams'] = { 'id'        : rad_exam_id,
                               'accession' : temp['accession'],
                               'site_id'   : harbinger_sites(cursor,temp['site_id']) }
    return saved

def harbinger_external_systems(cursor,external_system_id):
    logging.debug('UTILS: FK finding external_systems.id=%s',external_system_id)
    saved = {}
    sql = ''' select id,external_system,metasite_id from external_systems where id=%s '''
    cursor.execute(sql,(external_system_id,))
    temp = cursor.fetchone()
    if temp!=None:
        saved['external_systems'] = { 'id'              : external_system_id,
                                      'external_system' : temp['external_system'],
                                      'metasite_id'     : harbinger_metasites(cursor,temp['metasite_id']) }
    return saved

def harbinger_metasites(cursor,metasite_id):
    logging.debug('UTILS: FK finding metasites.id=%s',metasite_id)
    saved = { 'metasites' : { 'id'       : metasite_id,
                              'metasite' : harbinger_simple(cursor,'metasites','metasite',metasite_id) } }
    return saved

def harbinger_identifier_types(cursor,identifier_type_id):
    logging.debug('UTILS: FK finding identifier_types.id=%s',identifier_type_id)
    saved = { 'identifier_types' : { 'id'              : identifier_type_id,
                                     'identifier_type' : harbinger_simple(cursor,'identifier_types','identifier_type',identifier_type_id) } }
    return saved

def harbinger_identifiers_by_employee_id(cursor,employee_id):
    logging.debug('UTILS: FK finding identifiers.employee_id=%s',employee_id)
    saved = {}
    sql = ''' select id,identifier,identifier_type_id,external_system_id from identifiers where employee_id=%s '''
    cursor.execute(sql,(employee_id,))
    temp = cursor.fetchall()
    if temp!=None:
        saved['identifiers'] = []
        for row in temp:
            ident = { 'id'                 : row['id'],
                      'identifier'         : row['identifier'],
                      'identifier_type_id' : harbinger_identifier_types(cursor,row['identifier_type_id']),
                      'employee_id'        : employee_id,
                      'external_system_id' : harbinger_external_systems(cursor,row['external_system_id']) }
            saved['identifiers'].append(ident)
    return saved

def harbinger_employees(cursor,employee_id):
    logging.debug('UTILS: FK finding employees.id=%s',employee_id)
    saved = {}
    sql = ''' select id,name from employees where id=%s '''
    cursor.execute(sql,(employee_id,))
    temp = cursor.fetchone()
    if temp!=None:
        saved['employees'] = { 'id'   : employee_id,
                               'name' : temp['name'] }
        saved.update(harbinger_identifiers_by_employee_id(cursor,employee_id))
    return saved

def peerreview_exam_reviews(cursor,reviewer_employee_id,target_employee_id):
    logging.debug('UTILS: FK finding exam_reviews reviewer_employee.id=%s target_employee.id=%s rad_exam_id=%s',
                  reviewer_employee_id,target_employee_id,rad_exam_id)
    saved = { 'reviewer_employee_id' : harbinger_employees(cursor,reviewer_employee_id),
              'target_employee_id'   : harbinger_employees(cursor,target_employee_id),
              'rad_exam_id'          : harbinger_rad_exams(cursor,rad_exam_id) }
    return saved

def scannerutilization_black_lists(cursor,black_list_table,black_list_row_id):
    logging.debug('UTILS: FK finding blacklisted %s.id=%s',black_list_table,black_list_row_id)
    saved = { 'black_list_table' : black_list_table }
    if black_list_table=='modalities':
        saved['black_list_row_id'] = harbinger_modalities(cursor,black_list_row_id)
    elif black_list_table=='resources':
        saved['black_list_row_id'] = harbinger_resources(cursor,black_list_row_id)
    elif black_list_table=='sites':
        saved['black_list_row_id'] = harbinger_sites(cursor,black_list_row_id)
    else:
        logging.error('UTILS: unable to find FK for scannerutilization.black_lists %s.id=%s',black_list_table,black_list_row_id)
    return saved

########################################################################################################
########################################################################################################
