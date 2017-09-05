#!/bin/bash -l

if [ ! -f ".nvmrc" ] && [ -z "$NODE_VERSION" ]; then
    echo "NODE_VERSION is undefined"
    exit 1
fi

nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default `nvm current`
nvm cache clear

# TODO - npm@5.4.0 is broken, uncomment this once fixed
# https://github.com/npm/npm/issues/18324
# npm -g install npm
# npm -g upgrade
