#!/bin/bash
newline='\n'
spacemsg=$(bleachbit -p firefox.backup firefox.cache firefox.crash_reports firefox.url_history firefox.vacuum firefox.dom bash.history journald.clean kde.recent_documents kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs | grep -i 'recovered:') > /dev/null
filesmsg=$(bleachbit -p firefox.backup firefox.cache firefox.crash_reports firefox.url_history firefox.vacuum firefox.dom bash.history journald.clean kde.recent_documents kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs | grep -i 'deleted:') > /dev/null
bleachbit -c firefox.backup firefox.cache firefox.crash_reports firefox.url_history firefox.vacuum firefox.dom bash.history journald.clean kde.recent_documents kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.trash thumbnails.cache x11.debug_logs > /dev/null
# notify-send.sh "$(echo $filesmsg$newline$spacemsg)" --expire-time=10000 --default-action="kate /var/log/cleaner.log"--hint=string:desktop-entry:org.bleachbit.BleachBit.desktop --app-name="Bleachbit" --urgency=normal --icon=utilities-system-monitor
date1=$(date) > /dev/null
echo $date1 >> /var/log/cleaner.log
echo -e "$filesmsg$newline$spacemsg" >> /var/log/cleaner.log
echo "=====================================================================================================================================">>/var/log/cleaner.log
apt autoremove
cat /dev/null > /home/matt/.Xauthority
cat /dev/null > /home/matt/.bash_history
# echo -e $filesmsg$newline$spacemsg


