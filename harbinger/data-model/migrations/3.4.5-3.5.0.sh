#!/bin/bash
cd /servers/harbinger/harbinger/data-model/migrations/3.4.5-3.5.0
psql -e -f pre.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
./3.4.5-3.5.0.py
if [ $? != 0 ]; then
    exit 2
fi
psql -e -f post.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
