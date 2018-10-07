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
* pgdump (cron)
* nginx with letsencryt
* nodered plugins

## Run the composition
docker-compose -f docker-compose.yml -f extension.yml up

## Stop the composition
docker-compose -f docker-compose.yml -f extension.yml down
