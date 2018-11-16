#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
PIDS=$(ps -ef | grep "harbinger.et-standalone" | grep -v grep | awk '{print $2}')
if [[ "$PIDS" != $'' ]]; then
    kill $PIDS >> $LOGFILE
else
    echo "No HL7 parser running" >> $LOGFILE
fi
end_log
