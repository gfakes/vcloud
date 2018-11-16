#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add -
apt-get update
apt-get install postgresql-9.5 libpq-dev
mkdir /data/pgdata
chown postgres /data/pgdata
sudo -u postgres /usr/lib/postgresql/9.5/bin/initdb -D /data/pgdata
update-rc.d -f postgresql remove
update-rc.d postgresql defaults 20 80
gem install pg -v=0.17 -- --with-pg-config=/usr/bin/pg_config --no-ri --no-rdoc
mkdir -p /usr/local/pgsql/bin
ln -sfv /usr/bin/psql /usr/local/pgsql/bin/psql
service postgresql stop
