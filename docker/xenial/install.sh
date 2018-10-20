#!/bin/bash

source /scripts/utils.sh

container=qucs
container_image=searchathing/qucs
container_data=/nas/data/qucs

exdir="$(executing_dir)"

net=build
#net=

#ip="$ip_qucs_srv"
ip=

cpus="3"
memory="3g"

#-----------------

ipargs=
if [ "$ip" != "" ]; then ipargs=--ip="$ip"; fi

netargs=
if [ "$net" != "" ]; then netargs=--network="$net"; fi

dk-rm-if-exists "$container"

docker run \
	-d \
	-ti \
	--name="$container" \
	--hostname="$container" \
	$ipargs \
	$netargs \
	--restart="unless-stopped" \
	--cpus="$cpus" \
	--memory="$memory" \
	-e DISPLAY="$DISPLAY" \
	-e QT_X11_NO_MITSHM=1 \
	-e QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb \
	--workdir="$container_data" \
	-v=/tmp/.X11-unix:/tmp/.X11-unix \
	-v=$container_data:$container_data \
	"$container_image"
