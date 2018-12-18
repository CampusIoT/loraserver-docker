# Sécurisation du déploiement du service CampusIoT

## Firewall Backend
Ports non-filtrés Anywhere (VPN + IPTables) :
* 80/TCP (HTTP)
* 443/TCP (HTTPS) --> SSL Certificat + username/strong_password + JWT
* 2222/TCP (SSH) --> Clé SSH par gateway
* 8443/TCP (MQTTS)--> SSL Certificat + username/strong_password
* 9443/TCP (WSS) --> SSL Certificat + username/strong_password

Ports non-filtrés depuis le réseau de l'université :
* 22/TCP (SSH) --> Clé SSH de l'admin du backend
* 1700/UDP --> Déprécié

## Firewall Gateway (IPTables)
Ports non-filtrés depuis les instances du backend
* 22/TCP (SSH) --> Clé SSH de l'admin du gateway (un par gateway)

## VLAN gateways
Un VLAN par site
* Grenoble
* Lautaret
* Valence (EN COURS)

## TODOLIST
* Fail2Ban (MQTTS, WSS, HTTPS)
* SSO (Keycloack)
* OneTimePassword
* OpenVPN pour les gateways
* Filtrage GeoIP
* DDoS : [HTTP Flood](https://www.incapsula.com/ddos/attack-glossary/http-flood.html) ...
