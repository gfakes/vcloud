#!/bin/bash
cd /servers/harbinger/harbinger/data-model/migrations/3.5.2-3.5.3
psql -X -v ON_ERROR_STOP=1 -e -f 3.5.2-3.5.3.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
./3.5.2-3.5.3.py
if [ $? != 0 ]; then
    exit 2
else
    psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -c "UPDATE public.configuration_variables SET configuration_value='3.5.3', updated_at=now() WHERE configuration_key='data-model-version';"
fi
