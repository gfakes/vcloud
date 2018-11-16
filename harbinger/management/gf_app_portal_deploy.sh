#!/bin/bash

#/servers/glassfish/glassfish3/bin/asadmin deploy --name hst --contextroot /hst ~/hst.war

FILE=${1:?USAGE: $0 warfile}

BASE=$(basename $FILE)

if [ -e $FILE ]
then

  APPNAME=`cut -d. -f1 <<< $BASE`
  EXT=`cut -d. -f2 <<< $BASE`
  VERSION=`cut -d. -f3 <<< $BASE`


  if test "$EXT" != "war"
  then
    echo "$FILE is not a warfile"
    exit
  fi
  #echo "$0: Glassfish login"
  #/servers/glassfish/glassfish3/bin/asadmin login
  #echo "$0: Undeploying"
  #/servers/glassfish/glassfish3/bin/asadmin undeploy $APPNAME
  echo "$0: Deploying portal page to slash"
  /servers/glassfish/glassfish3/bin/asadmin --user admin --passwordfile /servers/.asadminpass deploy --name $APPNAME --force=true --target server --contextroot / $FILE

else
  echo "File $FILE does not exist"
fi
