import ldap,logging

# URI format definition: http://tools.ietf.org/html/rfc4516.html
def initialize_source(uri,admin_dn,password):
    l = None
    try:
        l = ldap.initialize(uri)
        l.simple_bind_s(admin_dn,password)
        logging.info('LDAP: opened connection to %s binding as %s',uri,admin_dn)
    except Exception as e:
        logging.critical('LDAP: caught exception: %s',repr(e))
        logging.critical('LDAP: failed to open connection to %s binding as %s',uri,admin_dn)
    return l

# create a DN for a CN by joining it to the base DN
# there is probably a better method, but this works for extant test cases
def join_cn_base(base,cn):
    dn = 'CN=%s'%cn
    dn += ', ' + base
    return dn

# delete a DN
def del_dn(ldap_source, dn):
    success = False
    try:
        result = ldap_source.delete_s(dn)
        success = True
        logging.info('LDAP: deleted %s',dn)
    except Exception as e:
        #import code; code.interact(local=locals())
        logging.critical('LDAP: caught exception: %s',e)
        logging.critical('LDAP: unable to delete %s',dn)
    return success

# given a CN and base DN, delete the object
def del_cn(ldap_source, base_dn, cn):
    dn = join_cn_base(base_dn,cn)
    return del_dn(ldap_source,dn)

# what gets opened must get closed
def close_source(ldap_source):
    uri = ldap_source._uri
    ldap_source.unbind_s()
    logging.info('LDAP: closed connection to %s',uri)

#########################################################################
# this stuff is all old / weird / should be deprecated                  #
# it is only being kept for customer-maryland repo compat               #
#                                                                       #
# it should probably be using the accessor methods to parse return vals #
# instead of crazy array / dict slicing                                 #
#########################################################################
def get_ldap_attr(o,ldfilter,attr,l):
    result = None
    temp = l.search_s(o,ldap.SCOPE_SUBTREE,ldfilter,['dn',attr])
    if temp!=None:
        try:
            result = temp[0][1][attr][0]
        except Exception as e:
            logging.debug('caught exception: %s',repr(e))
            logging.debug('no %s attribute for filter %s',attr,ldfilter)
    return result

def get_ldap_attr_by_cn(o,cn,attr,l):
    cnfilter = '(cn=%s)' % cn
    return get_ldap_attr(o,cnfilter,attr,l)

def get_cns_in_filter(o,ldfilter,l):
    cns = None
    results = l.search_s(o,ldap.SCOPE_SUBTREE,ldfilter,['cn','dn'])
    if temp!=None:
        try:
            cns = [x[1]['cn'][0] for x in results]
        except:
            logging.debug('caught exception: %s',repr(e))
            logging.debug('no matches for filter %s',ldfilter)
    return cns

def get_cns_in_edirgroup(o,group,l):
    group_filter = '(groupMembership=%s' % group
    return get_cns_in_filter(o,group_filter,l)
#########################################################################
#########################################################################
