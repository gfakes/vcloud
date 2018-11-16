#!/bin/bash

echo "<html><body><pre>"
echo "================== healthchecker =================="
echo -n "Bridge Version: "
cat /servers/harbinger/harbinger/version
echo -n "Date: "
date
echo -n "Hostname: "
hostname -f
echo -n "OS Version: "
lsb_release -s -d
echo ''


echo "================== DISK SPACE =================="
df -h
echo ''


echo "================== DISK SPACE (i-nodes) =================="
df -i
echo ''


echo "================== Nagios Status =================="
/servers/harbinger/management/display_nagios.rb
echo ''


echo "================== Mirth Queues =================="
/servers/harbinger/management/display_mirth.sh
echo ''


echo "================== RabbitMQ Queues =================="
/servers/harbinger/management/display_rabbitmq.sh
echo ''


echo "================== Deployed Application list =================="
/servers/harbinger/management/gf_app_list.sh
echo ''


echo "================== Application versions =================="
/servers/harbinger/management/display_app_versions.sh
echo ''


echo "================== Application Usage (7 days) =================="
/servers/harbinger/management/display_usage.sh
echo ''


echo "================== SDK version =================="
ls /servers/glassfish/glassfish3/glassfish/domains/domain1/lib | grep sdk
echo ''


echo "================== Configuration Variables =================="
/servers/harbinger/management/display_configuration_variables.sh
echo ''
echo "</pre></body></html>"
