#!/bin/bash

echo "bringing down everything, control-c if you want to stop this within 10 seconds"
sleep 10
sudo service glassfish stop
sudo service data_manager stop
sudo service mirth stop
sudo service rabbitmq-server stop
sudo service tomcat6 stop
sudo service opendj stop
echo "showing postgres processes, if any"
ps -ef | grep postgres
if [ `ps -ef | grep postgres | grep -c idle` -gt 0 ]; then
  echo "aborting due to postgres connections"
  exit 1
fi
sudo service postgres-9.1 stop
