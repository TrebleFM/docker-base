FROM buildpack-deps:stretch

# Update and install some tools useful for debugging in production
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        apt-utils \
        && \
    dpkg --configure -a && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        build-essential \
        procps \
        sysstat \
        htop \
        net-tools \
        dnsutils \
        tcpdump \
        python-pip \
        python-dev \
        python-openssl \
        gnupg \
        dirmngr \
        && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install awscli

# Pre-setup some Golang
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && \
    chmod -R 777 "$GOPATH"

# Pre-setup some Nginx
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 && \
    echo "deb http://nginx.org/packages/mainline/debian/ stretch nginx" >> /etc/apt/sources.list

# Pre-setup some Node
RUN mkdir -p /usr/src/app && \
    chmod -R 777 /usr/src/app

# Install nvm
ENV NVM_VERSION 0.33.2
ENV NVM_DIR /usr/local/nvm
RUN curl -o- "https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh" | NVM_DIR=$NVM_DIR bash

# Copy install scripts to root
COPY install*.sh /

# HACK - Load extra env vars
RUN rm -f /bin/sh
COPY sh.sh /bin/sh

# Automatically update packages in child images
ONBUILD RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade awscli
