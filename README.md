# VirtualBox Environment for Kali Linux with Whonix Gateway

## Requirements
- VirtualBox
- Vagrant

## Build Vagrant Boxes
```
cd packer/whonix
export PACKER_LOG=1
export WHONIX_OVA=~/Downloads/Whonix-CLI-14.0.1.4.4.ova
packer build whonix.json

---

cd packer/whonix
export PACKER_LOG=1
export KALI_OVA=~/Downloads/kali-linux-2019.2-vbox-amd64.ova
packer build kali.json
```

## Run Vagrant Boxes
```bash
vagrant up
```
