#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
export PGPASSWORD=$HARBINGER_PW
start_log
echo 'Saving ETL Handlers...' | tee -a $LOGFILE
pg_dump -U harbinger harbinger -a --column-inserts -t data_manager_etl_handlers -t data_manager_etl_handlers_id_seq > /servers/harbinger/data/etl-handlers.sql
end_log
