#!/bin/bash

if [ -z "$NODE_VERSION" ]; then
  echo "NODE_VERSION is undefined"
  exit 1
fi

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
nvm use default
nvm cache clear

npm -g install npm
npm -g upgrade
