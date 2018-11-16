#!/bin/bash
PREBUILT="/tmp/prebuilt-dmel-tables"
CURRENT="/tmp/current-dmel-tables"
grep CREATE\ TABLE /servers/harbinger/harbinger/data-model/harbinger-partitions.sql | grep data_manager_message_logs_ | cut -d' ' -f3 > $PREBUILT
pg_dump -O -s -x -n public -U postgres harbinger | grep CREATE\ TABLE | grep data_manager_message_logs_ | cut -d' ' -f3 > $CURRENT
total=$(wc -l $CURRENT)
WORKLIST=$(grep -vxF -f $PREBUILT $CURRENT)
for table in $WORKLIST
do
    IDX=$(echo $table | cut -d'_' -f5)
    SQL1="CREATE INDEX dmml_$IDX"
    SQL2="_eli_idx ON $table USING btree (data_manager_error_log_id);"
    SQL="$SQL1$SQL2"
    echo "creating index $IDX out of $total"
    psql -e -U harbinger -c "$SQL"
done
