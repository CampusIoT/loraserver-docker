#!/bin/bash

# Copyright (C) CampusIoT,  - All Rights Reserved
# Written by CampusIoT Dev Team, 2016-2018

sudo apt update
sudo apt install -y mosquitto mosquitto-clients
sudo service mosquitto stop
sudo service mosquitto status


plainpasswdcsv=plain_passwd.csv
passwordfile=passwd

rm -f $passwordfile
touch $passwordfile

OLDIFS=$IFS
IFS=","
while read username password
 do
  mosquitto_passwd -b $passwordfile $username $password
 done < $plainpasswdcsv
IFS=$OLDIFS
