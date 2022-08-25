cp /Data/projects/system-settings/grub/40_custom /etc/grub.d/
cp /Data/projects/system-settings/grub/10_linux /etc/grub.d/
cp /Data/projects/system-settings/grub/30_os-prober /etc/grub.d/
sudo chmod -x /etc/grub.d/30_uefi-firmware
sudo chmod -x /etc/grub.d/60_memtest86+
update-grub
exit
