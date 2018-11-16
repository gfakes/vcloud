#!/bin/bash
AI_SERVERNAME=gf-pm.eng.local

cd /servers/glassfish/glassfish3/glassfish/bin
./asadmin login

if [ $? != 0 ]; then
 echo "Must login to continue"
 exit
fi

./asadmin delete-jvm-options -- -client
./asadmin create-jvm-options -- -server
./asadmin delete-jvm-options -- -Xmx512m
./asadmin create-jvm-options -- -Xmx4G
./asadmin delete-jvm-options -- "-XX\:MaxPermSize=192m"
./asadmin create-jvm-options -- "-XX\:MaxPermSize=2048m"
./asadmin create-jvm-options -- "-XX\:+CMSClassUnloadingEnabled"
./asadmin create-jvm-options -- "-XX\:+CMSPermGenSweepingEnabled"
./asadmin create-jvm-options -- "-XX\:+UseConcMarkSweepGC"
./asadmin create-jvm-options -- "-XX\:+CMSIncrementalMode"
./asadmin create-jvm-options -Dproduct.name=""
./asadmin create-jvm-options -- -Dharbinger.hipaa.host=${AI_SERVERNAME}
./asadmin create-jvm-options -- -Dharbinger.cometd.host=${AI_SERVERNAME}
./asadmin create-jvm-options -- -Dharbinger.sso.url="http\://${AI_SERVERNAME}\:8088/openam"
./asadmin set server.network-config.protocols.protocol.http-listener-1.http.xpowered-by=false
./asadmin set server.network-config.protocols.protocol.http-listener-2.http.xpowered-by=false
./asadmin set server.network-config.protocols.protocol.admin-listener.http.xpowered-by=false

#./asadmin set server-config.network-config.protocols.protocol.admin-listener.security-enabled=true
#./asadmin enable-secure-admin
