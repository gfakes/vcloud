#!/bin/bash
VERSION="1.4"
TARGET="/tmp/portal.war"
sed "s/_VERSION_/$VERSION/g" portal.html > portal-rendered.html
jar cfM $TARGET portal-rendered.html WEB-INF *.png *.jpg favicon.ico browserconfig.xml manifest.json safari-pinned-tab.svg
rm portal-rendered.html
echo "Please now run: gf_app_portal_deploy.sh /tmp/portal.war"
