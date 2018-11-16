/usr/local/pgsql/bin/psql -U postgres postgres -x -c "SELECT pid,datname,usename,client_addr,waiting,query_start,state,query from pg_stat_activity where state!='idle'"
