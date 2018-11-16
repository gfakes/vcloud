#!/usr/bin/env python

import sys,traceback,os,pprint,argparse,json,socket

def main(opts):
    # preflight check
    if not os.path.isfile(opts.skel):
        raise Exception("Unable to read skeleton config from %s"%opts.skel)
    if not os.access(os.path.dirname(opts.out),os.W_OK):
        raise Exception("Unable to write output config to %s"%opts.out)
    # load skel
    try:
        config = json.load(open(opts.skel,'rb'))
    except Exception as e:
        raise Exception("Unable to read skeleton config from %s (%s)"%(opts.skel,repr(e)))
    # prompt for input
    if opts.customer:
        customer_name = opts.customer
    else:
        default_customer = config.get('customer',{}).get('name','Example Health System')
        customer_name = raw_input('Enter Customer Name (default="%s"): '%default_customer).strip()
        if customer_name=='':
            customer_name = default_customer
    if opts.host:
        hostname = opts.host
    else:
        guessed_hostname = socket.gethostname()
        hostname = raw_input('Enter fully qualified domain name (default="%s"):'%guessed_hostname).strip()
        if hostname=='':
            hostname = guessed_hostname
    if opts.env:
        env = opts.env
    else:
        default_env = config.get('customer',{}).get('env','production')
        env = raw_input('Enter the server environment (default="%s"):'%default_env).strip()
        if env=='':
            env = default_env
    # set values
    if config.get('customer',{})=={}:
        config['customer']={}
    config['customer']['name'] = customer_name
    config['customer']['host'] = hostname
    config['customer']['env'] = env
    # write output
    try:
        of = open(opts.out,'wb')
        json.dump(config,of,indent=2)
        of.close()
    except Exception as e:
        raise Exception("Unable to write output config to %s (%s)"%(opts.out,repr(e)))
    
if __name__ == '__main__':
    DESC = 'Configure new site configuration from skeleton template'
    SKEL = '/servers/bridge/skel/site.config.json'
    OUT = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--skel', help='path to skeleton site configuration input', default=SKEL)
        parser.add_argument('--out', help='path to output site configuration', default=OUT)
        parser.add_argument('--customer', help='set customer name')
        parser.add_argument('--host', help='set server name (fqdn)')
        parser.add_argument('--env', help='set customer environment')
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        main(opts)
    except Exception as e:
        print 'ERROR: %s' % e
        sys.exit(1)
    sys.exit(0)
