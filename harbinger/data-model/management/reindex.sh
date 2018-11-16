#!/bin/bash
source /servers/harbinger/harbinger/deployment/utils.sh
start_log
REINDEX_SQL="/tmp/reindex-core.sql"
echo "generating reindex script at $REINDEX_SQL" >> $LOGFILE
TABLES=$(grep CREATE\ TABLE /servers/harbinger/harbinger/data-model/harbinger-schema.sql | cut -d' ' -f3)
echo "\\timing on" > $REINDEX_SQL
for table in $TABLES
do
    echo "REINDEX TABLE $table;" >> $REINDEX_SQL
done
echo "VACUUM VERBOSE ANALYZE;" >> $REINDEX_SQL
echo "script generated, reindexing now" >> $LOGFILE
psql -e -f $REINDEX_SQL -U postgres harbinger | tee /tmp/reindex.log
echo "reindexing details in /tmp/reindex.log" >> $LOGFILE
end_log
