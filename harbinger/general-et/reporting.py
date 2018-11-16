import os,imp,datetime,json,pprint,logging
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')
xl = imp.load_source('excel', '/servers/harbinger/harbinger/general-et/excel.py')

class Batch:
    def __init__(self,harbinger,repdef_file,outfile):
        self.h = harbinger
        self.outfile = os.path.join(self.h.conf('local-paths','reports-dir'),outfile)
        self.report_defs = {}
        self.tabs = []
        try:
            self.report_defs = json.load(open(repdef_file))
        except Exception as e:
            logging.critical('caught exception: %s',repr(e))
            logging.critical('unable to load/parse report definitions file %s',repdef_file)
            raise Exception('Report Definitions Failure')
        logging.info('loaded %s report definitions',len(self.report_defs))

    def create_sql_args(self,report):
        #import code; code.interact(local=locals())
        args = []
        for arg in self.report_defs[report]['args']:
            # assume the argument is literal
            real_arg = arg
            # check if it needs to be evaluated
            if type(arg)==type({}):
                fun,param = arg.items()[0]
                # need to handle all cases of args (none, single, list)
                if param == None:
                    real_arg = apply(globals()[fun])
                elif not utils.isSeq(param):
                    param = [param,]
                    real_arg = apply(globals()[fun],param)
                else:
                    real_arg = apply(globals()[fun],param)
            args.append(real_arg)
        return args

    def write_tab(self,report,data):
        cols = self.report_defs[report]['columns']
        header = [col.values()[0] for col in cols]
        label = self.report_defs[report]['name']
        if len(label)>30:
            logging.warning('truncating label "%s" because it exceeds Excel\'s 30 character maximum (length=%s)',label,len(label))
            label = label[:30]
        printable = []
        for row in data:
            temp = []
            for key in [col.keys()[0] for col in cols]:
                element = row[key]
                if type(element)==type(datetime.datetime.now()):
                    element = element.replace(tzinfo=None)
                elif type(element)==type(datetime.timedelta(days=1)):
                    element = utils.strf_timedelta(element)
                temp.append(element)
            printable.append(temp)
        if len(printable)>65535:
            logging.warning('truncating rows on report %s because %s rows > Excel\'s 65535 limit',report,len(printable))
        sheet = xl.make_sheet(printable[:65535],label,header)
        if len(printable)>0: # weak xl library assumes you are only auto-typing something with data
            xl.column_autotype(sheet,printable[:65535])
        #import code; code.interact(local=locals())
        self.tabs.append(sheet)

    def run_reports(self):
        started = datetime.datetime.now()
        logging.info('started running reports...')
        for report,report_def in self.report_defs.iteritems():
            rstarted = datetime.datetime.now()
            logging.info('running report: %s',report)
            args = self.create_sql_args(report) # derive arguments
            query = report_def['sql'].replace('?','%s') # convert from ruby to python string substitution syntax
            self.h.hcurs.execute(query,args) # execute sql
            data = self.h.hcurs.fetchall() # get back data
            self.write_tab(report,data) # write a tab
            logging.info('done with report %s in %s',report,datetime.datetime.now() - rstarted)
        logging.info('writing report to Excel file %s',self.outfile)
        xl.write_big_xls(self.outfile,self.tabs)
        logging.info('...done running %s reports in %s',len(self.report_defs),datetime.datetime.now() - started)
        return self.outfile

def days_ago(d=0):
    return datetime.date.today() - datetime.timedelta(days=d)
