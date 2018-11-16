#!/bin/bash

APP=${1:?USAGE: $0 <app name or war file>}

# allow a /tmp/app.war to be passed and grep just "app"
APP=$(basename $APP)
APPNAME=`cut -d. -f1 <<< $APP`

if [ -e /servers/glassfish/glassfish3/glassfish/domains/domain1/applications/__internal/$APPNAME/$APPNAME.war ]
then
  echo "Making copy of currently running war"
  cp -v /servers/glassfish/glassfish3/glassfish/domains/domain1/applications/__internal/$APPNAME/$APPNAME.war /tmp/$APPNAME.war.`date +"%Y%m%d%H%M"`
  echo "Undeploying"
  /servers/glassfish/glassfish3/bin/asadmin --user admin --passwordfile /servers/.asadminpass undeploy $APPNAME
fi
