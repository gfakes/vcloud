#!/bin/bash

##Install OpenDJ

if [ ! -d /servers/opendj ]; then
  sudo mkdir /servers/opendj
fi
sudo cp /servers/harbinger/harbinger/server-build/opendj/OpenDJ-2.4.3.zip /servers/opendj
cd /servers/opendj
sudo unzip OpenDJ-2.4.3.zip
sudo chown -R opendj:opendj /servers/opendj
sudo cp /servers/harbinger/harbinger/server-build/opendj/opendj-init /etc/init.d/opendj
sudo chmod +x /etc/init.d/opendj
sudo update-rc.d opendj defaults 20 80
