# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "whonix" do |whonix|
    whonix.vm.box = "j7k6/whonix-gateway"
    whonix.vm.network :private_network, auto_config: false, virtualbox__intnet: "Whonix", adapter: 2
    whonix.vm.network :forwarded_port, guest: 22, host: 2200, id: "ssh", disabled: true
    whonix.vm.network :forwarded_port, guest: 22, host: 2219
    whonix.ssh.username = "root"
    whonix.vm.synced_folder ".", "/vagrant", disabled: true

    whonix.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
    end

    whonix.vm.provision :shell, inline: <<-SCRIPT
      iptables -I INPUT -i eth1 -p udp --dport 67 --sport 68 -j ACCEPT
    SCRIPT
  end

  config.vm.define "kali" do |kali|
    kali.vm.box = "offensive-security/kali-linux"
    kali.vm.network :private_network, virtualbox__intnet: "Whonix", adapter: 1
    kali.vm.network :forwarded_port, guest: 22, host: 2200, id: "ssh", disabled: true
    kali.ssh.host = "10.152.152.11"
    kali.ssh.proxy_command = "ssh root@127.0.0.1 -p 2219 -o StrictHostKeyChecking=no -i " + File.join(Dir.pwd(), '.vagrant/machines/whonix/virtualbox/private_key') + " nc %h %p"
    kali.vm.synced_folder ".", "/vagrant", disabled: true

    kali.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
      vb.gui = true
    end

    kali.vm.provision :shell, inline: <<-SCRIPT
      sudo nmcli connection modify 'Wired connection 1' \
        ipv4.method manual \
        ipv4.addresses 10.152.152.11 \
        ipv4.gateway 10.152.152.10 \
        ipv4.dns 10.152.152.10
    SCRIPT
  end
end
