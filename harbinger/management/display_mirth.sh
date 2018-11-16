/usr/local/pgsql/bin/psql -U mirth mirthdb -c "SELECT c.name, received, filtered,  sent ,error , queued  from channel c, channel_statistics cs where cs.channel_id = c.id"
