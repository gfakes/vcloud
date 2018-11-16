#!/usr/bin/env python
import imp
import numpy
utils = imp.load_source('utils', '/servers/harbinger/harbinger/general-et/utils.py')
SC = '/servers/harbinger/config/site.config.json'
h = utils.HarbingerETEnv(SC,'bridge-service.log',amqp=False,db=True,schema='harbinger-rw')
sql = 'select procedure_id, exam_duration from rad_exam_facts'
h.hcurs.execute(sql)
temp = h.hcurs.fetchall()
d = {}
for t in temp:
	if t['procedure_id'] not in d:
		d[t['procedure_id']]=[]
	d[t['procedure_id']].append(t['exam_duration'])
sql = 'update procedures set scheduled_duration=%s where id=%s'
for pid in d.keys():
	dd = numpy.median(d[pid])/60
	h.hcurs.execute(sql,(dd,pid))
h.hdb.commit()
h.close()
