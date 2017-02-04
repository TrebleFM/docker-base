#!/bin/bash

if [ -z "$GOLANG_VERSION" ]; then
    echo "GOLANG_VERSION is undefined"
    exit 1
fi

# fuck you google, why can't you do this the way Node does
if [ -z "$GOLANG_DOWNLOAD_SHA256" ]; then
    echo "GOLANG_DOWNLOAD_SHA256 is undefined"
    exit 1
fi

curl -fsSL "https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz" -o golang.tar.gz
echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c -
tar -C /usr/local -xzf golang.tar.gz
rm golang.tar.gz
