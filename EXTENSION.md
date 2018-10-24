# Additional containers for loraserver.io

## Containers
* pgadmin
* influxdb
* telegraf
* nodered (with plugins and flow)
* grafana
* chronograf
* kapacitor
* mqtt-logger
* gateway-manager

# TODO List
* pgdump (cron) see https://github.com/istepanov/docker-pg_dump
* nginx with letsencrypt
* fail2ban
* glpi (with mysql)

## Run the composition
```bash
docker-compose -f docker-compose.yml -f extension.yml up
docker-compose -f glpi.yml up
docker-compose -f mediawiki.yml up
docker run --rm -ti --name=ctop   -v /var/run/docker.sock:/var/run/docker.sock   quay.io/vektorlab/ctop:latest
```

## Open local web UIs
```bash
open https://localhost:8080
open http://localhost:3080
open http://localhost:3000
open http://localhost:2080
open http://localhost:8888
open http://localhost:8083
open http://localhost:80
```

## Open CampusIoT web UIs
```bash
open http://campusiot.imag.fr
open https://lora.campusiot.imag.fr
open https://glpi.campusiot.imag.fr
open https://wiki.campusiot.imag.fr
open https://demo.campusiot.imag.fr
```



## Stop the composition
```bash
docker-compose -f mediawiki.yml down
docker-compose -f glpi.yml down
docker-compose -f docker-compose.yml -f extension.yml down
```
