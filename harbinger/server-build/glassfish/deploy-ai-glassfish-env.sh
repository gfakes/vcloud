#!/bin/bash
AI_SERVERNAME=gf-pm.eng.local
AI_DBHOST=localhost

#ro config
RO_DB=harbinger
RO_DB_USER=roharbinger
RO_DB_PASSWORD=s4f3forSDKuse.
RO_DB_HOST=${AI_DBHOST}

#hst config
HST_DB=harbinger
HST_DB_USER=harbinger
HST_DB_PASSWORD=hcR3volution!
HST_DB_HOST=${AI_DBHOST}


##### do not edit below
cd /servers/glassfish/glassfish3/glassfish/bin
./asadmin login

if [ $? != 0 ]; then
 echo "Must login to continue"
 exit
fi

./asadmin create-custom-resource \
--restype java.util.Properties \
--factoryclass org.glassfish.resources.custom.factory.PropertiesFactory \
--enabled=true \
--property cometd-amqp.url="http\://${AI_SERVERNAME}/cometd-amqp/cometd":harbinger.amqp.host="localhost":harbinger.amqp.user="harbinger":harbinger.amqp.password="superguest12" \
harbinger-config

./asadmin create-custom-resource \
--restype java.util.Properties \
--factoryclass org.glassfish.resources.custom.factory.PropertiesFactory \
--enabled=true \
--property hibernate.search.default.indexBase="/servers/harbinger/lucene/indexes":hibernate.ejb.metamodel.generation="disabled" \
harbinger-jpa-config

./asadmin create-jdbc-connection-pool \
--datasourceclassname=org.postgresql.ds.PGConnectionPoolDataSource \
--restype=javax.sql.ConnectionPoolDataSource \
--property user=${RO_DB_USER}:password=${RO_DB_PASSWORD}:databaseName=${RO_DB}:serverName=${RO_DB_HOST} \
harbingerPool

./asadmin create-jdbc-connection-pool \
--datasourceclassname=org.postgresql.ds.PGConnectionPoolDataSource \
--restype=javax.sql.ConnectionPoolDataSource \
--property user=${HST_DB_USER}:password=${HST_DB_PASSWORD}:databaseName=${HST_DB}:serverName=${HST_DB_HOST} \
harbingerHSTPool


./asadmin create-jdbc-resource \
--connectionpoolid harbingerPool \
jdbc/harbinger

./asadmin create-jdbc-resource \
--connectionpoolid harbingerHSTPool \
jdbc/harbinger-hst
