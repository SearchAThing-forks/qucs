#!/bin/bash

source /scripts/utils.sh

container_image=searchathing/qucs

exdir="$(executing_dir)"

docker build $args $* -t $container_image -f "$exdir"/Dockerfile "$exdir"/.
