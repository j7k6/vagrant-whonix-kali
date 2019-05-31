# VirtualBox Environment for Kali Linux with Whonix Gateway

## Requirements
- VirtualBox
- Vagrant

## Build Vagrant Boxes
```
cd packer/
packer build whonix.json
packer build kali.json
```

## Run Vagrant Boxes
```bash
vagrant up
```

