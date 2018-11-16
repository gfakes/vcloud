#!/bin/bash
psql -X -f table-index-stats.sql -U postgres harbinger | tee -a ~/harbingerdb-stats.log
