#!/bin/bash

# load new servicetools schema
cd /servers/harbinger/harbinger/data-model
psql -X -v ON_ERROR_STOP=1 -e -U harbinger harbinger -f servicetools-schema.sql
if [ $? != 0 ]; then
    exit 2
fi

# recreate roharbinger with access to servicetools schema
cd /servers/harbinger/harbinger/data-model/deployment
psql -X -v ON_ERROR_STOP=1 -e -U postgres harbinger -f recreate-ro.sql
if [ $? != 0 ]; then
    exit 2
fi

# fix function name
cd /servers/harbinger/harbinger/data-model/migrations/3.5.6-3.6.0
psql -X -v ON_ERROR_STOP=1 -e -f 3.5.6-3.6.0.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
