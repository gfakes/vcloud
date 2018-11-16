#!/bin/bash
DROPS=$(pg_dump -O -s -x -n public -U postgres harbinger | grep CREATE\ RULE\ app_tracking | cut -d' ' -f3)
TEMP=$(pg_dump -O -s -x -n public -U postgres harbinger | grep -A3 CREATE\ RULE\ app_tracking | tr -d '\n')
IFS='--' read -r -a CREATES <<< "$TEMP"
for rule in $DROPS
do
    psql -X -e -U harbinger -c "drop rule $rule on app_tracking;"
done
for rule in "${CREATES[@]}"
do
    if [[ "$rule" != $'' ]] ; then
	TMP=$(echo $rule | cut -d' ' -f1-21)
	psql -X -e -U harbinger -c  "$TMP VALUES (NEW.*);"
    fi
done
psql -X -e -U harbinger harbinger -c "UPDATE public.configuration_variables SET configuration_value='3.5.1', updated_at=now() WHERE configuration_key='data-model-version';"
