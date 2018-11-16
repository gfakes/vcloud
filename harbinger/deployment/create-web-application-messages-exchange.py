#!/usr/bin/env python

import sys,traceback,os,logging,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def main(h,opts):
  # no need to explicitely open/close the connection, it is handled by the HarbingerETEnv class creation/close
  # HarbingerETEnv reference:  https://github.com/analytical-informatics/harbinger-general-et/blob/master/utils.py#L169
  # pika reference: http://pika.readthedocs.org/en/0.9.14/modules/channel.html
  #h.harbinger => pika.BlockingConnection().channel()
  try:
      h.harbinger.exchange_declare(exchange='web-application-messages', exchange_type='topic',durable=True)
  except Exception as e:
       print 'Found existing exchange, deleting first.'
       # conn(h) closed in failed exchange declare, creating second conn(h2)
       h2 = h.hconn.channel()
       h2.exchange_delete(exchange='web-application-messages')
       h2.exchange_declare(exchange='web-application-messages', exchange_type='topic',durable=True)

if __name__ == '__main__':
    DESC = 'creates the web-application-messages exchange as durable'
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
