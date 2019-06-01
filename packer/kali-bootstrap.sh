#!/bin/bash

set -ex

export DEBIAN_FRONTEND="noninteractive"

adduser --gecos '' --disabled-password vagrant
echo 'vagrant:vagrant' | chpasswd
usermod -aG sudo vagrant
sed -i 's/^%sudo.*/%sudo ALL=NOPASSWD:ALL/' /etc/sudoers
mkdir -p /home/vagrant/.ssh
curl -fsSL https://raw.github.com/hashicorp/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
systemctl enable --now ssh
