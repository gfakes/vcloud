#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
VERSION=$(get_config "data-model-version")
OPATH=$(get_siteconfig "local-paths" "reports-dir")
OUTPUT="$OPATH/schema-docs-$VERSION"
# bail if no valid commit
if [ -z $VERSION ]; then
    echo
    echo "no data-model-version, aborting schema doc generation"
    echo
    exit 1
fi
echo "writing data-model schema docs"
# generate the schema
java -jar /servers/harbinger/harbinger/data-model/tools/schemaSpy_5.0.0.jar \
     -dp /servers/harbinger/harbinger/server-build/glassfish/postgresql-9.1-901.jdbc4.jar \
     -t pgsql -db harbinger -s public -host localhost -u roharbinger \
     -I "(app\_tracking.*)?(data\_quality\_stats)?(data\_manager\_.*)?(control\_.*)?(hipaa\_.*)?" -charset UTF-8 \
     -norows  -rails  -hq  -noads  -nologo -o $OUTPUT
# remove donation links
cd $OUTPUT
find . -maxdepth 2 -xdev -type f -exec sed -i '/Donate/Id' {} \;
find . -maxdepth 2 -xdev -type f -exec sed -i '/Currier/Id' {} \;
# run other message spec generators
cd /servers/harbinger/harbinger/data-model/tools
echo "writing HL7 message spec"
./generate-hl7-spec.py
echo "writing Bridge message spec"
./generate-bridge-spec.py
