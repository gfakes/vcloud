#!/bin/bash

if [ ! -e postgresql-9.1.2.tar.gz ]
then
  echo "Install: must be in server-build/postgres directory"
  exit 2
fi
echo "Installing to /data/pgdata"
tar zxf postgresql-9.1.2.tar.gz
cd postgresql-9.1.2/
./configure
make
sudo make install
cd ../
rm -rf postgresql-9.1.2
echo "Install: finshed make install"

sudo adduser postgres
sudo mkdir -p /data/pgdata
sudo chown postgres /data/pgdata
sudo -u postgres /usr/local/pgsql/bin/initdb -D /data/pgdata


sudo cp default_conf/postgres-9.1 /etc/init.d
sudo update-rc.d postgres-9.1 defaults 20 80
sudo chmod +x /etc/init.d/postgres-9.1
sudo cp default_conf/20-postgres.conf /etc/sysctl.d


echo "/etc/environment before"
cat /etc/environment
sudo sed -i -e 's/\/usr\/games/\/usr\/local\/pgsql\/bin/g' /etc/environment
echo "/etc/environment after"
cat /etc/environment

