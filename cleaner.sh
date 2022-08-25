#!/usr/bin/env bash
newline='\n'
date >> /var/log/cleaner.log
echo "$filesmsg$newline$spacemsg" >> /var/log/cleaner.log
echo "=============================================================================================================================">>/var/log/cleaner.log

spacemsg=$(bleachbit -p apt.autoremove apt.clean bash.history google_chrome.dom google_chrome.session google_chrome.cache google_chrome.history google_chrome.vacuum journald.clean kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs| grep -i 'recovered:')
filesmsg=$(bleachbit -p apt.autoremove apt.clean bash.history google_chrome.dom google_chrome.session google_chrome.cache google_chrome.history google_chrome.vacuum journald.clean kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs| grep -i 'deleted:')
bleachbit -c apt.autoremove apt.clean bash.history google_chrome.dom google_chrome.session google_chrome.cache google_chrome.history google_chrome.vacuum journald.clean kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs

notify-send.sh "$(echo $filesmsg$newline$spacemsg)" --expire-time=10000 --default-action="kate /var/log/cleaner.log"--hint=string:desktop-entry:org.bleachbit.BleachBit.desktop --app-name="Bleachbit" --urgency=normal --icon=utilities-system-monitor

