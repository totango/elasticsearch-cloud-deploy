#!/bin/bash

sudo apt-get update
sudo rm /boot/grub/menu.lst

sudo apt-get upgrade -y
sudo apt-get install -y software-properties-common git python-dev htop ntp jq apt-transport-https

if [[ $PACKER_BUILD_NAME == "aws" ]]; then
      sudo -E apt-get install -y awscli
fi

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic
