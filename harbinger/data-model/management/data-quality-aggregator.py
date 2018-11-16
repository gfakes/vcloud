#!/usr/bin/env python

import sys,traceback,os,logging,imp,argparse,json,subprocess,datetime
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# future metrics to collect:
# * mirth traffic
# * system load over previous 24 hours
# * did service log in that day?

# determine which bridge version is checked out
def find_deployed():
  version = None
  path = '/servers/harbinger/harbinger/version'
  try:
    f = open(path)
    version = f.read().strip()
  except Exception as e:
    logging.warning('unable to determine deployed version of Bridge, recieved %s',repr(e))
  else:
    f.close()
  return version

# determine which SDK is deployed to glassfish
def find_sdk():
  version = None
  path = '/servers/glassfish/glassfish3/glassfish/domains/domain1/lib'
  try:
    for dirpath, dirnames, filenames in os.walk(path):
      for name in filenames:
        if 'harbinger-sdk' in name:
          version = name
          continue
  except Exception as e:
    logging.warning('unable to determine SDK version deployed to GlassFish, received %s',repr(e))
  return version

# run display_app_versions.sh
def get_app_versions():
  v = {}
  executable = '/servers/harbinger/management/display_app_versions.sh'
  try:
    raw = subprocess.check_output([executable,])
    v = dict([app.split(': ') for app in raw.split('\n') if app!=''])
  except Exception as e:
    logging.warning('unable to determine deployed app versions, recieved %s',repr(e))
  return v

# get deployment info from reading files and db
def get_deployment_info(cursor):
  cvars = utils.get_config_vars(cursor)
  d = { 'bridge-version-db'       : cvars.get('bridge-version'),
        'bridge-version-deployed' : find_deployed(),
        'data-model-version'      : cvars.get('data-model-version'),
        'data-manager-version'    : cvars.get('data-manager-version'),
        'sdk-version'             : find_sdk(),
        'app-versions'            : get_app_versions() }
  return d

# get unique visitors from app_tracking
def get_uniq_visitors(cursor,start,stop):
  count = 0
  sql = 'select count(distinct username) uniqs from app_tracking where created_at between %s and %s'
  cursor.execute(sql,(start,stop))
  raw = cursor.fetchone()
  if raw!=None:
    count = raw['uniqs']
  return count

# get total hit count from app_tracking
def get_total_hits(cursor,start,stop):
  hits = 0
  sql = 'select count(id) hits from app_tracking where created_at between %s and %s'
  cursor.execute(sql,(start,stop))
  raw = cursor.fetchone()
  if raw!=None:
    count = raw['hits']
  return hits

# get total hits per app from app_tracking
def get_per_app_hits(cursor,start,stop):
  hits = 0
  sql = 'select count(id) hits, application_name from app_tracking where created_at between %s and %s group by application_name'
  cursor.execute(sql,(start,stop))
  raw = cursor.fetchall()
  if raw not in (None,[]):
    hits = dict([(x['application_name'],x['hits']) for x in raw])
  return hits

# generate aggregate stats from app_tracking
def get_app_traffic(cursor,start,stop):
  at = { 'unique-visit-count' : get_uniq_visitors(cursor,start,stop),
         'per-app-hits'       : get_per_app_hits(cursor,start,stop),
         'total-hits'         : get_total_hits(cursor,start,stop) }
  return at

# get data_manager_message_logs volume per routing_key_domain
def get_dmml(cursor,start,stop):
  ml = {}
  sql = ''' select count(dmml.id) vol, dmrkd.routing_key_domain
            from data_manager_message_logs dmml left outer join data_manager_routing_key_domains dmrkd
                 on dmrkd.id=dmml.data_manager_routing_key_domain_id
            where dmml.handle_message_begin between %s and %s
            group by dmrkd.routing_key_domain order by dmrkd.routing_key_domain '''
  cursor.execute(sql,(start,stop))
  raw = cursor.fetchall()
  if raw not in (None,[]):
    ml = dict([(x['routing_key_domain'],x['vol']) for x in raw])
  return ml

# get count of data_manager_warehouse_logs
def get_dmwl(cursor,start,stop):
  vol = 0
  sql = ''' select count(dmwl.id) vol
            from data_manager_warehouse_logs dmwl left outer join data_manager_message_logs dmml on dmml.id=dmwl.data_manager_message_log_id
            where dmml.handle_message_begin between %s and %s '''
  #cursor.execute(sql,(start,stop))
  #raw = cursor.fetchone()
  #if raw!=None:
  #  vol = raw['vol']
  return vol

# get count of data_manager_error_logs
def get_dmel(cursor,start,stop):
  vol = 0
  sql = ''' select count(dmel.id) vol
            from data_manager_error_logs dmel left outer join data_manager_message_logs dmml on dmml.id=dmel.data_manager_message_log_id
            where dmml.handle_message_begin between %s and %s '''
  #cursor.execute(sql,(start,stop))
  #raw = cursor.fetchone()
  #if raw!=None:
  #  vol = raw['vol']
  return vol

# generate aggregate stats from data_manager tables
def get_dm_stats(cursor,start,stop):
  d = { 'message_logs-by-rk' : get_dmml(cursor,start,stop),
        'warehouse_logs-vol' : get_dmwl(cursor,start,stop),
        'error_logs-vol'     : get_dmel(cursor,start,stop) }
  return d

# get statistics about fact table density
def get_fact_density(cursor,dt):
  f = {}
  sql = ''' select count(modality_id) count_modality, count(ordering_provider_id) count_ordering_provider, count(procedure_id) count_procedure,
                   count(procedure_specialty_id) count_procedure_specialty, count(volume) exam_vol, count(radiologist_id) count_radiologist,
                   count(radiologist_specialty_id) count_radiologist_specialty, count(resident_id) count_resident,
                   count(site_location_id) count_site_location, count(patient_age) count_patient_age, count(resource_id) count_resource,
                   count(rad_exam_department_id) count_rad_exam_department, count(site_class_id) count_site_class, count(technologist_id) count_technologist,
                   count(access_wait) count_access_wait, count(reg_wait) count_reg_wait, count(reg_duration) count_reg_duration,
                   count(exam_wait) count_exam_wait, count(exam_duration) count_exam_duration, count(total_wait) count_total_wait,
                   count(order_complete) count_order_complete, count(first_report_turn_around) count_first_report_turn_around,
                   count(prelim_turn_around) count_prelim_turn_around, count(turn_around) count_turn_around, count(order_first_image) count_order_first_image,
                   count(order_last_image) count_order_last_image, count(first_image_prelim) count_first_image_prelim,
                   count(last_image_prelim) count_last_image_prelim, count(first_image_final) count_first_image_final,
                   count(last_image_final) count_last_image_final, count(end_exam_first_image) count_end_exam_first_image,
                   count(end_exam_last_image) count_end_exam_last_image, count(send_duration) count_send_duration
            from rad_exam_facts where end_exam_year=%s and end_exam_month=%s and end_exam_day=%s '''
  cursor.execute(sql,(dt.year,dt.month,dt.day))
  f = utils.pgd2pyd(cursor.fetchone())
  f.update(metrics_to_timestamps(f))
  return f

# derive timestamps based on statistics from metrics
def metrics_to_timestamps(metrics):
  mapping = { 'count_reg_duration'             : ('begin_reg','check_in'),
              'count_access_wait'              : ('appointment','schedule_event'),
              'count_total_wait'               : ('begin_exam','sign_in'),
              'count_exam_wait'                : ('appointment','begin_exam'),
              'count_order_complete'           : ('end_exam','order_arrival'),
              'count_exam_duration'            : ('begin_exam','end_exam'),
              'count_prelim_turn_around'       : ('end_exam','report_event'),
              'count_turn_around'              : ('end_exam','report_event'),
              'count_first_report_turn_around' : ('end_exam','report_event'),
              'count_order_first_image'        : ('first_image','order_arrival'),
              'count_end_exam_first_image'     : ('end_exam','first_image'),
              'count_first_image_prelim'       : ('first_image','report_event'),
              'count_first_image_final'        : ('first_image','report_event'),
              'count_order_last_image'         : ('last_image','order_arrival'),
              'count_end_exam_last_image'      : ('end_exam','last_image'),
              'count_last_image_prelim'        : ('last_image','report_event'),
              'count_last_image_final'         : ('last_image','report_event'),
              'count_send_duration'            : ('first_image','last_image') }
  # create a dictionary of timestamp: 0 for all timestamps from mapping, src for flatten: http://stackoverflow.com/a/952952
  timestamps = dict([(x,0) for x in list(set([item for sublist in mapping.values() for item in sublist]))])
  # build out the combinations
  for metric_key in mapping.keys():
    mvol = metrics[metric_key]
    stamps = mapping[metric_key]
    for stamp in stamps:
      if mvol > timestamps[stamp]:
        timestamps[stamp] = mvol
  return timestamps

# get 24 hour datetime range for given date
def get_range(dt):
  start = stop = None
  start = datetime.datetime(dt.year,dt.month,dt.day)
  stop = start + datetime.timedelta(days=1)
  return (start, stop)

# check if a given date has been sampled
# returns ID if true, None if false
def sample_exists(cursor,dt):
  sample_id = None
  sql = 'select id from data_quality_stats where sample_date=%s'
  cursor.execute(sql,(dt,))
  temp = cursor.fetchone()
  if temp!=None:
    sample_id = temp['id']
  return sample_id

# gather all quality data for given day
def gather_raw_data(cursor,dt):
  start, stop = get_range(dt)
  qs = { 'sample_date'  : dt,
         'fact_density' : json.dumps(get_fact_density(cursor,dt)),
         'data_manager' : json.dumps(get_dm_stats(cursor,start,stop)),
         'app_traffic'  : json.dumps(get_app_traffic(cursor,start,stop)) }
  return qs

# insert new quality stats or update existing
def insert_or_update(cursor,dt):
  qs = gather_raw_data(cursor,dt)
  dqs_id = sample_exists(cursor,dt)
  if dqs_id == None:
    qs['deployment'] = json.dumps(get_deployment_info(cursor))
    utils.insert_dict(cursor,'data_quality_stats',qs)
  else:
    qs['id'] = dqs_id
    del qs['data_manager']
    del qs['app_traffic']
    utils.update_dict(cursor,'data_quality_stats',qs)

def main(h,opts):
  dt = datetime.date.today() - datetime.timedelta(days=1)
  insert_or_update(h.hcurs,dt)
  h.hdb.commit()
  # TODO: add options to rerun historic

if __name__ == '__main__':
    DESC = 'aggregate daily data quality statistics to database'
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
      h.close()
    sys.exit(0)
