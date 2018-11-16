#!/usr/bin/env python

import sys,traceback,os,pprint,logging,datetime,imp,argparse,socket,json,urllib2,uuid
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

def main(h,opts):
    AUTH_URL = 'http://auth.analytical.info/authenticate'
    # hostname reverse lookup
    host = 'Unknown'
    try:
        # there are many legit reasons why this fails
        # http://pubs.opengroup.org/onlinepubs/7908799/xns/endhostent.html
        host = socket.gethostname()
        name, alias, addresslist = socket.gethostbyaddr(host)
        host = name
    except Exception as e:
        logging.warning('unable to resolve %s: %s',host,e)
    # mac
    printable_mac = 'Unknown'
    try:
        # can't honest think why this would fail
        mac = hex(uuid.getnode())[2:]
        printable_mac = ':'.join(a+b for a,b in zip(mac[::2], mac[1::2]))
    except Exception as e:
        logging.warning('unable to determine MAC: %s',e)
    # dm version
    dm_version = 'Unknown'
    try:
        # if this fails, there is not a working data manager installed...
        dm_path = os.path.realpath('/servers/data_manager/current')
        dm_version = os.path.split(dm_path)[1].split('-')[1]
    except Exception as e:
        logging.warning('unable to determine data-manager version: %s',e)
    # bridge version
    bridge_version = 'Unknown'
    try:
        # if this fails, bridge is not installed to the proper path...
        bridge_path = '/servers/harbinger/harbinger/version'
        bridge_version = open(bridge_path,'rb').read().strip()
    except Exception as e:
        logging.warning('unable to determine Bridge version: %s',e)
    # build payload
    payload = { 'address'        : host,
                'mac'            : printable_mac,
                'bridge_version' : bridge_version,
                'dman_version'   : dm_version,
                'customer'       : h.conf('customer','name'),
                'hostname'       : h.conf('customer','host'),
                'environment'    : h.conf('customer','env') }
    # send payload
    req = urllib2.Request(AUTH_URL)
    req.add_header('Content-Type', 'application/json')
    p = json.dumps(payload)
    logging.info('posting %s to %s',p,AUTH_URL)
    try:
        response = urllib2.urlopen(req, p)
        logging.info('authentication success: %s',response)
    except Exception as e:
        logging.critical('failed to authenticate to %s: %s',AUTH_URL,e)

if __name__ == '__main__':
    DSC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description='Bridge license authentication')
        parser.add_argument('--config', help='path to site configuration', default=DSC, metavar=DSC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False)
        main(h,opts)
        h.close()
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    sys.exit(0)
