#!/usr/bin/env python

import sys,traceback,os,datetime,logging,pprint,imp,argparse
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def main(h,opts):
    customer_metasite = h.conf('customer','name')
    if customer_metasite==None:
        customer_metasite = 'AI'
    esms = { customer_metasite : { 'external_systems' : [ { 'name'        : 'AD',
                                                            'roles'       : ['Authentication',],
                                                            'config_vars' : True } ] },
             'National Provider Identifier Registry' : { 'external_systems' : [ { 'name'  : 'NPI',
                                                                                  'roles' : ['Credentialing',] } ] } }
    utils.setup_esms(h.cursor,esms)
    h.db.commit()
    print 'use the /servers/harbinger/management/ai-staff-add.py script to add ai-staff users\n'
    
if __name__ == '__main__':
    DESC = 'build baseline site configuration'
    SC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-build.log',amqp=False,db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        print 'ERROR: %s' % e
        logging.critical(traceback.format_exc())
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
