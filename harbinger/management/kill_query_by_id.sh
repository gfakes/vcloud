#!/bin/bash

if ! [[ "$1" ]]; then
echo "Usage: $0 <procpid>"
exit
fi

if [[ $1 =~ ^[0-9]+$ ]] && [[ $1 -gt 0 ]]; then
/usr/local/pgsql/bin/psql -U postgres postgres -c "SELECT pg_cancel_backend($1) "
else
echo "Usage: $0 <procpid>"
exit
fi


