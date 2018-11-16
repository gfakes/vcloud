#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
export PGPASSWORD=$HARBINGER_PW
start_log
echo 'Restoring ETL Handlers...' | tee -a $LOGFILE
psql -e -U harbinger harbinger -c 'truncate data_manager_etl_handlers;' | tee -a $LOGFILE
psql -e -U harbinger harbinger -f /servers/harbinger/data/etl-handlers.sql | tee -a $LOGFILE
end_log
