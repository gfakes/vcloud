#!/bin/bash
/usr/local/pgsql/bin/psql -U harbinger harbinger -c "analyze verbose" > /servers/harbinger/logs/analyze_tables.log 2>&1
/usr/local/pgsql/bin/psql -U mirth mirthdb -c "analyze verbose" >> /servers/harbinger/logs/analyze_tables.log 2>&1
