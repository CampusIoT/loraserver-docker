# Sécurisation du déploiement du service CampusIoT

## Firewall Backend
Ports non-filtrés Anywhere (VPN + IPTables) :
* 80/TCP
* 443/TCP --> SSL Certificat
* 2222/TCP --> Clé SSH par gateway
* 8443/TCP --> SSL Certificat
* 9443/TCP --> SSL Certificat

Ports non-filtrés depuis le réseau de l'université :
* 22/TCP --> Clé SSH de l'admin du backend
* 1700/UDP --> Déprécié

## Firewall Gateway (IPTables)
Ports non-filtrés depuis les instances du backend
* 22/TCP --> Clé SSH de l'admin du gateway (un par gateway)

## VLAN gateways
Un VLAN par site
* Grenoble
* Lautaret
* Valence

## TODOLIST
* Fail2Ban
* SSO (Keycloack)
* OneTimePassword
* OpenVPN pour les gateways
