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
nmcli device modify eth0 ipv4.method manual ipv4.addresses 10.152.152.11/18 ipv4.gateway 10.152.152.10 ipv4.dns 10.152.152.10
