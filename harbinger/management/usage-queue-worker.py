#!/usr/bin/env python

import sys,traceback,os,logging,imp,argparse,json
import iso8601
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# callback for handling messages
def load_data(cursor,message):
  sql = ''' insert into app_tracking (application_name, browser_name, browser_version, browser_ip, platform, query_parameters, relative_url, url, username, employee_id, created_at)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s )'''
  application_name = message['application_name']
  browser_name = message['browser_name']
  browser_version = message['browser_version']
  browser_ip = message['ip']
  platform = message['platform']
  query_parameters = json.dumps(message['query_parameters']) # turn pydict back into JSON
  relative_url = message['relative_url']
  url = message['url']
  username = message['username']
  if message.has_key('employee_id'):
    employee_id = message['employee_id']
  else:
    employee_id = None
  created_at = iso8601.parse_date(message['message_event_time']) # parse to native DT
  cursor.execute(sql,(application_name, browser_name, browser_version, browser_ip, platform, query_parameters, relative_url, url, username, employee_id, created_at))

def main(h,opts):
  # build out queue
  qname = 'harbinger-usage-requests'
  queue = h.harbinger.queue_declare(queue=qname, durable=True)
  message_count = queue.method.message_count
  logging.info("AMQP queue %s has %s messages to process", qname, message_count)
  # grab and process each message
  for x in range(0, message_count):
    method_frame, header_frame, body = h.harbinger.basic_get(queue=qname)
    if method_frame:
      msg = json.loads(body)
      load_data(h.hcurs,msg)
      h.hdb.commit()
      h.harbinger.basic_ack(delivery_tag=method_frame.delivery_tag)

if __name__ == '__main__':
    DESC = 'capture usage statistics'
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'usage-queue-worker.log',db=True,schema='harbinger-rw')
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
      h.close()
    sys.exit(0)
