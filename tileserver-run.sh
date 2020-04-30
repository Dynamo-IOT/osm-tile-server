#!/bin/bash

docker run --rm -d \
    -p 80:80 \
    -v osm-database:/var/lib/postgresql/12/main \
    -v osm-tiles:/var/lib/mod_tile \
    -e THREADS=8 \
    osm-tile-server \
    run
