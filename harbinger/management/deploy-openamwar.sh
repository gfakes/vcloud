#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
# usage
if [ $# -lt 1 ]; then
  echo "usage: deploy-openamwar.sh /path/to/new.war"
  exit
fi
# do stuff
start_log
echo 'Stopping tomcat...' | tee -a $LOGFILE
sudo service tomcat6 stop
echo 'Stopped tomcat, moving files' | tee -a $LOGFILE
sudo mv -v /var/lib/tomcat6/webapps/openam.war /tmp/old-openam.war  | tee -a $LOGFILE
sudo mv -v $1 /var/lib/tomcat6/webapps/openam.war | tee -a $LOGFILE
sudo rm -rf /var/lib/tomcat6/webapps/openam | tee -a $LOGFILE
sudo rm -rf /var/lib/tomcat6/work/Catalina/localhost/openam | tee -a $LOGFILE
echo 'Starting tomcat...' | tee -a $LOGFILE
sudo service tomcat6 start
echo 'Done' | tee -a $LOGFILE
end_log
