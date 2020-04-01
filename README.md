# VirtualBox Environment for Kali Linux with Whonix Gateway

## Requirements

- VirtualBox
- Vagrant

## (Optional) Build Vagrant Boxes

```bash
cd packer
export PACKER_LOG=1

export WHONIX_OVA=~/Downloads/Whonix-CLI-15.0.0.9.4.ova
packer build whonix.json

export KALI_OVA=~/Downloads/kali-linux-2020.1-vbox-amd64.ova
packer build kali.json
```

## (Optional) Upload Vagrant Boxes

```bash
vagrant cloud auth login --token "<CLOUD_TOKEN>"
vagrant cloud publish --force --release j7k6/whonix-gateway 15.0.0.9.4 virtualbox whonix-gateway.box
vagrant cloud publish --force --release j7k6/kali-linux 2020.1.0 virtualbox kali-linux.box
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
