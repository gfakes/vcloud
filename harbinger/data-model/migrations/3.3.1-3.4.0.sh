#!/bin/bash
cd /servers/harbinger/harbinger/data-model/deployment
psql -e -f recreate-ro.sql -U postgres harbinger
if [ $? != 0 ]; then
    exit 2
fi
cd /servers/harbinger/harbinger/data-model/migrations/3.3.1-3.4.0
psql -e -f pre.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
psql -e -f app_tracking-partitions.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
cd /servers/harbinger/harbinger/data-model/default-data
psql -e -f documentation.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
cd /servers/harbinger/harbinger/data-model/migrations/3.3.1-3.4.0
./3.3.1-3.4.0.py
if [ $? != 0 ]; then
    exit 2
fi
psql -e -f post.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
