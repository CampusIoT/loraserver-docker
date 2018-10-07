# Additional containers for loraserver.io

## Containers
* pgadmin
* influxdb
* telegraf
* nodered
* grafana
* chronograf
* kapacitor

# TODO List
* pgdump (cron) see https://github.com/istepanov/docker-pg_dump
* nginx with letsencryt
* nodered plugins
* fail2ban
* glpi (with mysql)

## Run the composition
docker-compose -f docker-compose.yml -f extension.yml up

## Stop the composition
docker-compose -f docker-compose.yml -f extension.yml down
