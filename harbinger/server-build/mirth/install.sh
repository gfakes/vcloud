#!/bin/bash

if [ ! -e mirthconnect-2.1.0.5389.b671-unix.tar.gz ]
then
  echo "Install: must be in server-build/mirth directory"
  exit 2
fi

if [ ! -e /servers ]
then
  echo "Install: directory /servers does not exist"
  exit 2
fi

tar zxf mirthconnect-2.1.0.5389.b671-unix.tar.gz
sudo mv Mirth\ Connect /servers/mirth

if [ ! -e /servers/mirth ]
then
  echo "Install: directory /servers/mirth does not exist"
  exit 2
fi

sudo cp -v default_conf/mcservice.vmoptions /servers/mirth
sudo cp -v default_conf/mirth.properties /servers/mirth/conf
sudo cp -v /servers/harbinger/harbinger/server-build/rabbitmq/rabbitmq-client.jar /servers/mirth/custom-lib

sudo ln -s /servers/mirth/mcservice /etc/init.d/mirth
sudo update-rc.d mirth defaults 95 05

/usr/local/pgsql/bin/psql -U postgres postgres -f default_conf/db.sql
