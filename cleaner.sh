#!/bin/bash
# Halt the script on any errors.
set -e
newline='\n'
spacemsg=$(bleachbit -p google_chrome.cache google_chrome.history google_chrome.vacuum journald.clean kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs| grep -i 'recovered:')
filesmsg=$(bleachbit -p google_chrome.cache google_chrome.history google_chrome.vacuum journald.clean kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs| grep -i 'deleted:')
bleachbit -c google_chrome.cache google_chrome.history google_chrome.vacuum journald.clean kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs
/home/matt//bin/notify-send.sh "$(echo $filesmsg$newline$spacemsg)" --expire-time=10000 --hint=string:desktop-entry:org.kde.ksystemlog --app-name="Bleachbit Info" --urgency=normal --icon=utilities-system-monitor
