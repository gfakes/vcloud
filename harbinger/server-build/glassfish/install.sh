cd /servers/glassfish/
sudo unzip /servers/harbinger/harbinger/server-build/glassfish/glassfish-3.1.1.zip
sudo chown -R glassfish:glassfishadm /servers/glassfish
sudo chmod -R ug+rwx /servers/glassfish/glassfish3/bin/
sudo chmod -R ug+rwx /servers/glassfish/glassfish3/glassfish/bin/
sudo chmod -R o-rwx /servers/glassfish/glassfish3/bin/
sudo chmod -R o-rwx /servers/glassfish/glassfish3/glassfish/bin/
sudo cp /servers/harbinger/harbinger/server-build/glassfish/glassfish-init /etc/init.d/glassfish
sudo chmod a+x /etc/init.d/glassfish
sudo update-rc.d glassfish defaults 98 02
sudo chown -R glassfish:glassfishadm /servers/harbinger/lucene/indexes
sudo cp /servers/harbinger/harbinger/server-build/glassfish/postgresql-9.1-901.jdbc4.jar /servers/glassfish/glassfish3/glassfish/domains/domain1/lib/
