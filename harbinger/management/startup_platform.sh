#!/bin/bash

sudo service postgres-9.1 start
sudo service opendj start
echo "sleeping 10 seconds before starting tomcat after opendj"
sleep 10
sudo service tomcat6 start
sudo service rabbitmq-server start
sudo service mirth start
sudo service data_manager start
echo "sleeping 30 seconds before starting glassfish due to openam"
sleep 30
sudo service glassfish start
