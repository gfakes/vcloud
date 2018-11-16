#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
VERSION=$(cat version)
echo 'Dropping and creating new databases...' | tee -a $LOGFILE
psql -e -f recreate.sql -U postgres postgres | tee -a $LOGFILE
export PGPASSWORD=$HARBINGER_PW
psql -e -f ../harbinger-schema.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../harbinger-documentation-schema.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f ../servicetools-schema.sql -U harbinger harbinger | tee -a $LOGFILE
psql -e -f recreate-ro.sql -U postgres harbinger | tee -a $LOGFILE
set_config "data-model-version" $VERSION
echo "Current data-model-version: $(get_config "data-model-version")" >> $LOGFILE
end_log
