#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
TAG=`cat /servers/harbinger/harbinger/version`
echo "setting configuration_variables: bridge-version: $TAG " | tee -a $LOGFILE
set_config "bridge-version" $TAG
end_log
