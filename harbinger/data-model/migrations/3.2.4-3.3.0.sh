#!/bin/bash
cd /servers/harbinger/harbinger/data-model/migrations/3.2.4-3.3.0
psql -e -f 3.2.4-3.3.0.sql -U harbinger
if [ $? != 0 ]; then
    exit 2
fi
./3.2.4-3.3.0.py
if [ $? != 0 ]; then
    exit 2
fi
