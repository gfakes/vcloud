#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
export PGPASSWORD=$HARBINGER_PW
start_log
VERSION=$(cat version)
echo 'Dropping and creating new databases...' | tee -a $LOGFILE
psql -e -f recreate.sql -U postgres postgres | tee -a $LOGFILE
psql -e -f ../harbinger-schema.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../harbinger-documentation-schema.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../servicetools-schema.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../harbinger-partitions.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f recreate-ro.sql -U postgres harbinger | tee -a $LOGFILE
psql -e -f ../default-data/departments.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/clinical_roles.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/cms_facility_types.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/external_system_roles.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/patient_types.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/documentation.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/data_manager_etl_handlers.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../default-data/universal_event_types.sql -U harbinger harbinger | tee -a $LOGFILE
set_config "data-model-version" $VERSION
cd /servers/harbinger/harbinger/data-model/deployment
echo "$(timestamp) loading CMS HCPCS and ICD code sets" | tee -a $LOGFILE
./load-cms_hcpcs.py
./load-icd_codes.py
echo "Current data-model-version: $(get_config "data-model-version")" >> $LOGFILE
end_log
