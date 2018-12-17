#!/bin/bash
NOW=$(date +"%Y%m%d")
echo Saving data/mqtt-logger/msg-$NOW.log.gz

docker-compose stop mqtt-logger

mv data/mqtt-logger/msg.log data/mqtt-logger/msg-$NOW.log
touch data/mqtt-logger/msg.log

docker-compose start mqtt-logger

gzip data/mqtt-logger/msg-$NOW.log
