# VirtualBox Environment for Kali Linux with Whonix Gateway

## Requirements
- VirtualBox
- Vagrant

## (Optional) Build Vagrant Boxes
```
cd packer
export PACKER_LOG=1

export WHONIX_OVA=~/Downloads/Whonix-CLI-14.0.1.4.4.ova
packer build whonix.json

export KALI_OVA=~/Downloads/kali-linux-2019.2-vbox-amd64.ova
packer build kali.json
```

## Run Vagrant Boxes

1. (Optional) Enable Kali VM Encryption:
   ```bash
   echo "<PASSWORD>" > kali.passwd
   ```

2. Run:
   ```bash
   vagrant up
   ```
