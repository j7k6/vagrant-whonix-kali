#!/bin/bash

set -ex

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get install -y openssh-server netcat
apt-get clean
sed -i 's/GATEWAY_ALLOW_INCOMING_SSH=0/GATEWAY_ALLOW_INCOMING_SSH=1/' /etc/whonix_firewall.d/30_whonix_gateway_default.conf
/usr/bin/whonix_firewall
adduser --gecos '' --disabled-password vagrant
echo 'vagrant:vagrant' | chpasswd
usermod -aG sudo vagrant
sed -i 's/^%sudo.*/%sudo ALL=NOPASSWD:ALL/' /etc/sudoers
mkdir -p /home/vagrant/.ssh
curl -fsSL https://raw.github.com/hashicorp/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
systemctl enable --now ssh
