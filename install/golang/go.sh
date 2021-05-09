#!/bin/bash

# Variables
VERSION=1.16.4
OS=linux
ARCH=amd64
SHA256=7154e88f5a8047aad4b80ebace58a059e36e7e2e4eb3b383127a28c711b4ff59

# Download
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz

# Checksum
CHECKSUM_DOWNLOADED_FILE=$(sha256sum go$VERSION.$OS-$ARCH.tar.gz | awk '{print $1}')

if [ ! "$CHECKSUM_DOWNLOADED_FILE" == "$SHA256" ]; then
    echo 
    echo "Checksum does not match... please check your downloaded file!"
    echo
fi

# Extract
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# Update PATH
export PATH="$PATH:/usr/local/go/bin"
sudo cp update-go-path.sh /etc/profile.d/

# Show version
go version

# Remove instalation file
rm go$VERSION.$OS-$ARCH.tar.gz


exit 0
