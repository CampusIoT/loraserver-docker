#!/bin/bash

# Copyright (C) CampusIoT,  - All Rights Reserved
# Written by CampusIoT Dev Team, 2016-2018

plainpasswdcsv=plain_passwd.csv
aclfile=acl

rm -f $aclfile
echo "# ACL for CampusIoT" > $aclfile

OLDIFS=$IFS
IFS=","
while read username password
do
  if [ $username -eq "0" ]
  then
    echo "" >> $aclfile
    echo "user 0" >> $aclfile
    echo "topic readwrite application/#" >> $aclfile

    echo "" >> $aclfile
    echo "user monitor" >> $aclfile
    echo "topic read application/#" >> $aclfile

    echo "" >> $aclfile
    echo "user networkserver" >> $aclfile
    echo "topic write application/#" >> $aclfile

  else
    echo "" >> $aclfile
    echo "user ${username}" >> $aclfile
    echo "topic read application/${username}/#" >> $aclfile
  fi
done < $plainpasswdcsv
IFS=$OLDIFS
