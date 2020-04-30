#!/bin/bash

wget http://download.geofabrik.de/south-america-latest.osm.pbf -O data.osm.pbf

time docker run \
    -v $(pwd)/data.osm.pbf:/data.osm.pbf \
    -v osm-database:/var/lib/postgresql/12/main \
    -v osm-tiles:/var/lib/mod_tile \
    -e THREADS=16
    osm-tile-server \
    import
