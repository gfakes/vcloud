#!/bin/bash


sudo apt-get install tomcat6
sudo sed -i -e 's/8080/8088/g'  /etc/tomcat6/server.xml
sudo chown -R tomcat6 /usr/share/tomcat6
sudo update-rc.d -f tomcat6 remove
sudo update-rc.d tomcat6 defaults 92 08
sudo echo "" > /var/lib/tomcat6/webapps/ROOT/index.html

