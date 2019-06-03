#!/bin/bash

set -ex

if [[ -f "kali.passwd" ]]; then
  HDD_UUID="$(VBoxManage showvminfo 'kali-linux' | grep 'SATA.*UUID' | sed 's/^.*UUID: \(.*\))/\1/' 2>/dev/null)"

  if [[ ! -z "${HDD_UUID}" ]]; then
    VBoxManage controlvm "kali-linux" poweroff hard && sleep 10 || true

    VBoxManage encryptmedium  "${HDD_UUID}" --newpassword "kali.passwd" --newpasswordid "kali" --cipher "AES-XTS256-PLAIN64" || true
    shred -u -f kali.passwd || rm -f kali.passwd

    VBoxManage startvm "kali-linux" || true
  fi
fi
