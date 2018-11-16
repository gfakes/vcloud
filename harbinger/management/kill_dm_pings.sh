#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
PIDS=$(ps -ef | grep "data_manager@127.0.0.1 -setcookie data_manager ping" | grep -v grep | awk '{print $2}')
if [[ "$PIDS" != $'' ]]; then
    kill $PIDS >> $LOGFILE
else
    echo "No runaway data_manager pings" >> $LOGFILE
fi
end_log
