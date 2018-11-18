#!/bin/bash

# Copyright (C) CampusIoT,  - All Rights Reserved
# Written by CampusIoT Dev Team, 2016-2018

if ! [ -x "$(command -v npm)" ]; then
  echo 'npm is not installed. Installing npm ...'
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get install -y nodejs npm
  nodejs --version
  npm --version
fi

if ! [ -x "$(command -v password-generator)" ]; then
  echo 'password-generator is not installed. Installing password-generator ...'
  sudo npm install password-generator -g
fi

if ! [ -x "$(command -v mosquitto_passwd)" ]; then
  echo 'mosquitto_passwd is not installed. Installing mosquitto ...'
  sudo apt update
  sudo apt install -y mosquitto mosquitto-clients
  sudo service mosquitto stop
  sudo service mosquitto status
fi

plainpasswdcsv=plain_passwd.csv
passwordfile=passwd

mv $passwordfile ${passwordfile}.BAK
touch $passwordfile
rm -f ${plainpasswdcsv}.RENEW
touch ${plainpasswdcsv}.RENEW

OLDIFS=$IFS
IFS=","
while read username password
 do
  renew_password=$(password-generator -l 24 -p "[\w]")
  echo "$username,$renew_password" >> ${plainpasswdcsv}.RENEW
  mosquitto_passwd -b $passwordfile $username $renew_password
 done < $plainpasswdcsv
IFS=$OLDIFS
