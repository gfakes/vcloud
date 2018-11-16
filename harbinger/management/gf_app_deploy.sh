#!/bin/bash


#command and options
     #deploy [--help]
     #[--force={false|true}]
     #[--virtualservers virtual_servers]
     #[--contextroot context_root]
     #[--precompilejsp={false|true}]
     #[--verify={false|true}]
     #[--name component_name]
     #[--upload={true|false}]
     #[--retrieve local_dirpath]
     #[--dbvendorname dbvendorname]
     #[--createtables={true|false}|--dropandcreatetables={true|false}]
     #[--uniquetablenames={true|false}]
     #[--deploymentplan deployment_plan]
     #[--enabled={true|false}]
     #[--generatermistubs={false|true}]
     #[--availabilityenabled={false|true}]
     #[--asyncreplication={true|false}]
     #[--lbenabled={true|false}]
     #[--keepstate={false|true}]
     #[--libraries jar_file[,jar_file]*]
     #[--target target]
     #[--type pkg-type]
     #[--properties(name=value)[:name=value]*]
     #[file_archive|filepath]

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
  # important to clear out the table because each app re-deploy loses the cache of files
  if [ "$APPNAME" == "service-tools" ]
  then
    psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "TRUNCATE TABLE servicetools.servicetools_bulk_imports;"
  fi
  #echo "$0: Glassfish login"
  #/servers/glassfish/glassfish3/bin/asadmin login
  if [ -e /servers/glassfish/glassfish3/glassfish/domains/domain1/applications/__internal/$APPNAME/$APPNAME.war ]
  then
    echo "Making copy of currently running war"
    cp -v /servers/glassfish/glassfish3/glassfish/domains/domain1/applications/__internal/$APPNAME/$APPNAME.war /tmp/$APPNAME.war.`date +"%Y%m%d%H%M"`
    echo "Undeploying"
    /servers/glassfish/glassfish3/bin/asadmin --user admin --passwordfile /servers/.asadminpass undeploy $APPNAME
  fi
  echo "Deploying"
  /servers/glassfish/glassfish3/bin/asadmin --user admin --passwordfile /servers/.asadminpass deploy --name $APPNAME --target server --contextroot /$APPNAME $FILE

else
  echo "File $FILE does not exist"
fi
