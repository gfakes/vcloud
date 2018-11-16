#!/bin/bash

if [ ! -e rabbitmq-server_2.6.1-1_all.deb ]
then
  echo "Install: must be in server-build/rabbitmq directory"
  exit 2
fi

sudo dpkg -i rabbitmq-server_2.6.1-1_all.deb
sudo apt-mark hold rabbitmq-server
sudo /etc/init.d/rabbitmq-server stop
sudo cp -v *.ez /usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins
sudo cp rabbitmq-env.conf /etc/rabbitmq
sudo mkdir /servers/rabbitmq
sudo chown rabbitmq:rabbitmq /servers/rabbitmq
sudo /etc/init.d/rabbitmq-server start
sudo update-rc.d -f rabbitmq-server remove
sudo update-rc.d rabbitmq-server defaults 25 75
sudo cp -v rabbitmqadmin /usr/bin
sudo rabbitmqadmin import /servers/harbinger/harbinger/server-build/rabbitmq/rabbit.config
sudo rabbitmqadmin -u harbinger -p superguest12 delete user name=guest
sudo rabbitmqadmin -u harbinger -p superguest12 declare exchange name=etl_trash type=topic
sudo service rabbitmq-server restart
