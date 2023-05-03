#!/bin/bash
cp /Data/projects/system-settings/grub/40_custom /etc/grub.d/ >/dev/null
cp /Data/projects/system-settings/grub/10_linux /etc/grub.d/ >/dev/null
cp /Data/projects/system-settings/grub/30_os-prober /etc/grub.d/ >/dev/null
sudo chmod -x /etc/grub.d/30_uefi-firmware > /dev/null
sudo chmod -x /etc/grub.d/60_memtest86+ > /dev/null
update-grub > /dev/null
sh /home/matt/.local/bin/plasma-ver.sh >/dev/null
sh /home/matt/.local/bin/os-info.sh > /dev/null
exit
