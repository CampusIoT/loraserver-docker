# Additional containers for loraserver.io

## Containers
* mosquitto (with authentication and ACL)
* mqtt-logger (for raw message logging)
* pgbackup (cron) see https://github.com/istepanov/docker-pg_dump
* pgadmin
* telegraf
* influxdb
* gateway-manager

# TODO List
* nginx with letsencrypt (multi servers)
* nodered (with plugins and flow)
* grafana
* chronograf
* kapacitor
* (periodical) rsync (of the ./backups dir) see https://hub.docker.com/r/apnar/rsync-server/
* fail2ban (for appserver, rabbitmq, grafana, nodered, lora-gateway-bridge...)
* glpi (with mysql)
* rabbitmq
* rabbitmq authentication backend (spring)
* keycloak (for OAuth2.0 authentication)
* openvpn (for gateways)
* ttnmapper (dataviz)
* prometheus (for lora-gateway-bridge metrics)

## Run the composition
```bash
docker-compose -f docker-compose.yml -f extension.yml up
docker-compose -f glpi.yml up
docker-compose -f mediawiki.yml up
docker run --rm -ti --name=ctop   -v /var/run/docker.sock:/var/run/docker.sock   quay.io/vektorlab/ctop:latest
```
## Update a service
TODO

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
open https://grafana.campusiot.imag.fr
```

## Destroy the composition
```bash
docker-compose -f mediawiki.yml down
docker-compose -f glpi.yml down
docker-compose -f docker-compose.yml -f extension.yml down
```

# Backups
Databases dumps are in the directory ./backups/

TODO rsync of the directory ./backups/

# Security
Firewall : see ./set_firewall.sh

Fail2Ban : TODO

Rate Limiting: TODO

Certs: TODO
