#!/bin/bash -l

if [ ! -f ".nvmrc" ] && [ -z "$NODE_VERSION" ]; then
    echo "NODE_VERSION is undefined"
    exit 1
fi

nvm install $NODE_VERSION --latest-npm
nvm use $NODE_VERSION
nvm alias default `nvm current`
nvm cache clear
