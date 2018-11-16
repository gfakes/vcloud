/usr/local/pgsql/bin/psql -U postgres postgres -x -c "SELECT procpid,datname,usename,client_addr,waiting,query_start,current_query from pg_stat_activity where current_query <> '<IDLE>'"
