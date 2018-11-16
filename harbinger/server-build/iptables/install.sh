#!/bin/bash

if [ ! -e iptables.rules ]
then
  echo "Install: must be in server-build/iptables directory"
  exit 2
fi

sudo cp -v iptables.rules /etc
sudo cp -v iptablesload /etc/network/if-pre-up.d/
