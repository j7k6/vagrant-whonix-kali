# VirtualBox Environment for Kali Linux with Whonix Gateway

## Requirements
- VirtualBox
- Vagrant

## Build Vagrant Boxes
```
cd packer/
export PACKER_LOG=1
export WHONIX_OVA=~/Downloads/Whonix-CLI-14.0.1.4.4.ova

packer build whonix.json
packer build kali.json
```

## Run Vagrant Boxes
```bash
vagrant up
```

