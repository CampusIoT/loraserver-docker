#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server


install_ufw(){
  sudo apt-get update
  sudo apt-get install ufw -y
}

set_ufw_machine() {

  SERVER=$1

  sudo ufw disable

  sudo ufw status

  sudo ufw default deny incoming
  # SSH
  sudo ufw allow from $SERVER

  sudo ufw allow ssh

  # Docker container bridges
  sudo ufw allow from 172.17.0.0/16
  # Local IPv6 address
  sudo ufw allow from fe80::1

  # HTTP port
  # Web (80 --> 8080)
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  sudo ufw allow 8883/tcp

  #
  sudo ufw allow 1700/udp


  # Plain MQTT
  #sudo ufw allow 1883/tcp
  # MQTT over TLS/SSL
  sudo ufw allow 8883/tcp
  # Plain WebSockets configuration
  #sudo ufw allow 9001/tcp
  # WebSockets over TLS/SSL
  sudo ufw allow 9883/tcp


  sudo ufw enable

  sudo ufw status numbered
}


list() {
	echo "Machines: ${MACHINES[@]}"
 }

 commands() {

 if [ $# -lt 1 ] ; then  usage ; exit 1 ; fi

 local COMMAND=$1

 case "$COMMAND" in
 	list)
 		if [ $# -ne 1 ] ; then  usage ; exit 1 ; fi
 			list
 				;;
 	set_ufw_machine)
 		if [ $# -ne 2 ] ; then  usage ; exit 1 ; fi
 		HOST="$2"
 		set_ufw_machine ${HOST}
 	  ;;
 	h|help)
 		usage
 		;;
 	*)
 		usage
 		exit 1
 	  ;;
 	esac
 	exit 0
 }

# commands $*


usage() {
    echo "Usage: $0 [cmd] [parameter]"
    echo "	list                       				: list machines and containers."
    echo "	set_ufw_machine MACHINE           : set ufw on the machine."
}


name_to_ipaddress(){
  ping -q -c 1 -t 1 $1 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//"
}

IP_SERVER_1=$(name_to_ipaddress server-1)
IP_SERVER_2=$(name_to_ipaddress server-2)


set_ufw_server_1() {
  set_ufw_machine IP_SERVER_2
}

set_ufw_server_2() {
  set_ufw_machine IP_SERVER_1
}

if [[ $(hostname) == "server-1" ]]
then
  echo set_ufw_server_1
elif [[ $(hostname) == "server-2" ]]
then
  echo set_ufw_server_2
else
  echo "Not a server"
  exit 1
fi
