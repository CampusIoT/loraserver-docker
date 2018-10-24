
COMP=mosquitto
TAG=latest
IMAGES_DIR=~/docker-images/

mkdir -p $IMAGES_DIR

#for not running docker, use save:
docker save campusiot/$COMP:$TAG | gzip > $IMAGES_DIR/$COMP.$TAG.tgz

#for running or paused docker, use export:
docker export campusiot/$COMP:$TAG | gzip > $IMAGES_DIR/$COMP.$TAG.tgz

#load
gunzip -c $IMAGES_DIR/$COMP.$TAG.tgz | docker load
