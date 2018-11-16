#!/usr/bin/env python

import sys,traceback,os,logging,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def main(h,opts):
  # no need to explicitely open/close the connection, it is handled by the HarbingerETEnv class creation/close
  # HarbingerETEnv reference:  https://github.com/analytical-informatics/harbinger-general-et/blob/master/utils.py#L169
  # pika reference: http://pika.readthedocs.org/en/0.9.14/modules/channel.html
  #h.harbinger => pika.BlockingConnection().channel()
  try:
      h.harbinger.exchange_declare(exchange='usage_requests', exchange_type='topic',durable=True)
  except Exception as e:
       print 'Found existing exchange, deleting first.'
       h.harbinger.exchange_delete(exchange='usage_requests')
       h.harbinger.exchange_declare(exchange='usage_requests', exchange_type='topic',durable=True)
  h.harbinger.queue_declare(queue='harbinger-usage-requests', durable=True)
  h.harbinger.queue_bind(queue='harbinger-usage-requests', exchange='usage_requests', routing_key='#')

if __name__ == '__main__':
    DESC = 'creates the exchange and binds the queue required for tracking app usage'
    SC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        print 'ERROR: %s' % e
        logging.critical(traceback.format_exc())
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
