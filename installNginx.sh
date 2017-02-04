#!/bin/bash

apt-get update
apt-get install --no-install-recommends --no-install-suggests -y \
    nginx \
    nginx-module-xslt \
    nginx-module-geoip \
    nginx-module-image-filter \
    nginx-module-perl \
    nginx-module-njs \
    gettext-base
rm -rf /var/lib/apt/lists/*
