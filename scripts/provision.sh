#!/bin/bash

set -ex

export DEBIAN_FRONTEND="noninteractive"

sudo rm /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh
