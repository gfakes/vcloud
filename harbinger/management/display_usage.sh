/usr/local/pgsql/bin/psql -U harbinger harbinger -P footer=off -c "SELECT count(id),application_name from app_tracking where created_at > (now() - interval '7 days') group by application_name order by count desc"
/usr/local/pgsql/bin/psql -U harbinger harbinger -P footer=off -c "SELECT count(id),platform,browser_name,browser_version from app_tracking where created_at > (now() - interval '7 days') group by platform,browser_name,browser_version order by count desc"