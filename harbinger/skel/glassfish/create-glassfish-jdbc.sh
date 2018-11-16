#!/bin/bash

DB=harbinger
DB_USER=appschemauser_changeme
DB_PASSWORD=appschemapass_changeme
DB_HOST=localhost
JDBC_POOL=changemePOOL
JDBC_RESOURCE=jdbc/changeme

cd /servers/glassfish/glassfish3/glassfish/bin
./asadmin login

if [ $? != 0 ]; then
 echo "Must login to continue"
 exit
fi

./asadmin create-jdbc-connection-pool \
--datasourceclassname=org.postgresql.ds.PGConnectionPoolDataSource \
--restype=javax.sql.ConnectionPoolDataSource \
--property user=${DB_USER}:password=${DB_PASSWORD}:databaseName=${DB}:serverName=${DB_HOST} \
${JDBC_POOL}

./asadmin create-jdbc-resource \
--connectionpoolid ${JDBC_POOL} \
${JDBC_RESOURCE}
