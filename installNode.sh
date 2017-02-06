#!/bin/bash

if [ ! -f ".nvmrc" ] && [ -z "$NODE_VERSION" ]; then
  echo "NODE_VERSION is undefined"
  exit 1
fi

nvm install $NODE_VERSION
nvm use $NODE_VERSION
nvm alias default `nvm current`
nvm cache clear

npm -g install npm
npm -g upgrade
