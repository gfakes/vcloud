#!/usr/bin/env python

import sys,traceback,logging,pprint,imp,os,argparse,json,subprocess,datetime
import semantic_version
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')

# class to handle migration JSON
class Migrations:
    def __init__(self,mfile):
        self.definitions = {}
        self.versions = []
        # load the file
        try:
            self.definitions = json.load(open(mfile))
        except Exception as e:
            logging.critical(e)
            logging.critical('unable to load migration definitions from %s',mfile)
            raise Exception('unable to load migration file')
        for v in self.definitions.keys():
            self.definitions[semantic_version.Version(v)] = self.definitions[v]
            self.versions.append(semantic_version.Version(v))
        self.versions.sort(reverse=True)
        self.current_version = self.versions[0]
        #import code; code.interact(local=locals()) # DEBUG

    # find next version from current version
    def get_next_version(self,current_version):
        next_version = None
        if current_version==self.current_version:
            next_version = current_version
        else:
            for idx in range(len(self.versions)):
                if self.versions[idx]==current_version:
                    next_version = self.versions[idx-1]
        return next_version

# get version currently running
def active_version(cursor):
    version = ''
    cursor.execute('select configuration_value from configuration_variables where configuration_key=%s',('data-model-version',))
    temp = cursor.fetchone()
    if temp!=None:
        version=semantic_version.Version(temp['configuration_value'])
    return version

# update configuration_variables table
def update_configvars(cursor,version):
    sql = 'update configuration_variables set configuration_value=%s,updated_at=NOW() where configuration_key=%s'
    cursor.execute(sql,(str(version),'data-model-version'))

# update to the next iteration of the db
def update_db(m,cursor):
    migration_root = '/servers/harbinger/harbinger/data-model/migrations'
    installed_version = active_version(cursor)
    next_version = m.get_next_version(installed_version)
    # make sure we found a valid version
    if next_version==None:
        logging.critical('unable to find next version from current version %s',installed_version)
        raise Exception('unable to find next version from current version %s' % installed_version)
    # build the command
    future = m.definitions[next_version]
    file_path = os.path.join(migration_root,future['file'])
    if future['type']=='sql':
        cmd = ['psql','-X','-e','-v','ON_ERROR_STOP=1','-f',file_path,'-U','harbinger']
    else:
        cmd = [file_path,]
    # cmd = ['cat',file_path] # DEBUG
    # run the command
    logging.info('starting %s update executing %s',future['type'],future['file'])
    print 'starting %s update executing %s' % (future['type'],future['file'])
    r = subprocess.Popen(cmd,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    logging.info('finished execution, STDOUT:\n')
    so,se = r.communicate()
    # log stdout
    for line in so.split('\n'):
        logging.info(line)
    # log stderr
    if se!='':
        logging.error('STDERR:\n')
        for line in se.split('\n'):
            logging.error(line)
    # make sure it worked
    if r.returncode!=0:
        logging.critical('update to version %s failed',next_version)
        raise Exception('update to version %s failed' % next_version)
    # save state and return it
    av = active_version(cursor)
    logging.info('updating configuration_variables for %s',av)
    update_configvars(cursor,av)
    return av

def main(h,opts):
    migrations_file = '/servers/harbinger/harbinger/data-model/migrations/migrations.json'
    m = Migrations(migrations_file)
    # get current state
    logging.info('current version of data-model: %s',m.current_version)
    logging.info('active version of data-model: %s',active_version(h.cursor))
    print 'current version of data-model: %s' % m.current_version
    print 'active version of data-model: %s' % active_version(h.cursor)
    # check if we even need to trun
    finished = m.current_version == active_version(h.cursor)
    if finished:
        logging.info('database version is up-to-date, not running updates')
        return True
    # if need to run, count iterations and log stuff
    logging.info('starting update sequence...')
    count = 0
    last_version = None
    while(not finished):
        # run the actual updates
        updated_version = update_db(m,h.cursor)
        h.db.commit()
        finished = m.current_version == updated_version
        count += 1
        # prevent infinite loops
        if last_version==updated_version:
            logging.critical('looping error updating on %s',updated_version)
            raise Exception('looping error updating on %s' % updated_version)
        else:
            last_version = updated_version
    # post-updates log stats
    logging.info('ran %s update scripts',count)
    logging.info('current version of data-model: %s',m.current_version)
    logging.info('active version of data-model: %s',active_version(h.cursor))
    print 'ran %s update scripts' % str(count)
    print 'current version of data-model: %s' % m.current_version
    print 'active version of data-model: %s' % active_version(h.cursor)

if __name__ == '__main__':
    DESC = 'update data model to current version'
    SC = '/servers/harbinger/config/site.config.json'
    try:
        parser = argparse.ArgumentParser(description=DESC)
        parser.add_argument('--config', help='path to site configuration', default=SC)
        opts = parser.parse_args()
    except Exception as e:
        print repr(e)
        sys.exit(1)
    try:
        h = utils.HarbingerETEnv(opts.config,'bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
        logging.info(DESC)
        main(h,opts)
    except Exception as e:
        logging.critical(traceback.format_exc())
        print 'ERROR: %s' % e
        sys.exit(1)
    else:
        h.close()
    sys.exit(0)
