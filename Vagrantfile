# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "whonix" do |whonix|
    whonix.vm.box = "whonix-gateway"
    whonix.vm.network :private_network, auto_config: false, virtualbox__intnet: "Whonix", adapter: 2
    whonix.vm.network :forwarded_port, guest: 22, host: 2200, id: "ssh", disabled: true
    whonix.vm.network :forwarded_port, guest: 22, host: 2219
    whonix.vm.synced_folder ".", "/vagrant", disabled: true

    whonix.vm.provider "virtualbox" do |vb|
      vb.name = "whonix-gateway"
      vb.memory = 256
      vb.cpus = 1
    end

    whonix.vm.provision :shell, path: "provision.sh"
  end

  config.vm.define "kali" do |kali|
    kali.vm.box = "kali-linux"
    kali.vm.network :private_network, auto_config: false, virtualbox__intnet: "Whonix", adapter: 1
    kali.vm.network :forwarded_port, guest: 22, host: 2200, id: "ssh", disabled: true
    kali.vm.synced_folder ".", "/vagrant", disabled: true
    kali.ssh.host = "10.152.152.11"
    kali.ssh.proxy_command = "ssh vagrant@127.0.0.1 -p 2219 " \
      "-o StrictHostKeyChecking=no " \
      "-o UserKnownHostsFile=/dev/null " \
      "-i " + File.join(Dir.pwd(), ".vagrant/machines/whonix/virtualbox/private_key") + " nc -q0 %h %p"

    kali.vm.provider "virtualbox" do |vb|
      vb.name = "kali-linux"
      vb.memory = 4096
      vb.cpus = 2
      vb.gui = true
    end

    kali.trigger.after :up do |trigger|
      trigger.run = {
        path: "kali-encrypt.sh"
      }
    end

    kali.vm.provision :shell, path: "provision.sh"
  end
end
