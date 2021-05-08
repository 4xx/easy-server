#!/bin/bash

# Debian only

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io

# Update the Debian Repo
sudo apt-get update %% sudo apt-get -y upgrade

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add Docker repository for Ubuntu
sudo add-apt-repository \
   "deb https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Update the Ubuntu Repo (again)
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Create a docker group
sudo groupadd docker

# Add current user to group
sudo usermod -aG docker $USER

exit 0

