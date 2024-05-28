#!/bin/bash
# newline='\n'
# spacemsg=$(bleachbit -p apt.autoclean apt.autoremove apt.clean firefox.backup firefox.cache firefox.crash_reports firefox.session_restore firefox.url_history firefox.vacuum firefox.dom bash.history journald.clean kde.recent_documents kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.cache system.clipboard system.memory system.recent_documents system.tmp system.trash thumbnails.cache x11.debug_logs | grep -i 'recovered:') > /dev/null
# filesmsg=$(bleachbit -c apt.autoclean apt.autoremove apt.clean firefox.backup firefox.cache firefox.crash_reports firefox.session_restore firefox.url_history firefox.vacuum firefox.dom bash.history journald.clean kde.recent_documents kde.cache kde.tmp system.cache system.clipboard system.rotated_logs system.tmp system.cache system.clipboard system.memory system.recent_documents system.tmp system.trash thumbnails.cache x11.debug_logs) > /dev/null
# notify-send.sh "$(echo $filesmsg$newline$spacemsg)" --expire-time=10000 --default-action="kate /var/log/cleaner.log"--hint=string:desktop-entry:org.bleachbit.BleachBit.desktop --app-name="Bleachbit" --urgency=normal --icon=utilities-system-monitor
# date1=$(date) > /dev/null
# echo $date1 >> /var/log/cleaner.log
# echo -e "$filesmsg$newline$spacemsg" >> /var/log/cleaner.log
# echo "=====================================================================================================================================">>/var/log/cleaner.log
# cat autoremove
bleachbit -c firefox.backup firefox.cache firefox.crash_reports firefox.session_restore firefox.url_history firefox.vacuum firefox.dom bash.history journald.clean kde.recent_documents kde.cache kde.tmp system.cache system.clipboard system.clipboard system.recent_documents system.trash thumbnails.cache x11.debug_logs
cat /dev/null > /home/matt/.Xauthority
cat /dev/null > /home/matt/.bash_history
# echo -e $filesmsg$newline$spacemsg
