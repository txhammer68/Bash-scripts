#!/bin/bash
# Halt the script on any errors.
# report system log errors to notifications system tray
# journalctl -k -p 2 /usr/lib/systemd/systemd --since today
set -e
newline='\n'
critical_errors=$(journalctl -p 2 --since today | wc -l)
errors=$(journalctl -p 3 --since today | wc -l)
warnings=$(journalctl -p 4 --since today | wc -l)
no_errors=2  # journal shows 2 lines for no errors; account for that to show no warnings

if [ $critical_errors = $no_errors ]; then
    critical_errors=No
 else critical_errors=$(journalctl -p 2 --since today | wc -l); # journal shows 2 lines when no entries change to show no errors
fi;

if [ $errors = $no_errors ]; then
    errors=No
 else errors=$(journalctl -p 3 --since today | wc -l);          # journal shows 2 lines when no entries change to show no errors
fi;

if [ $warnings = $no_errors ]; then
    warnings=No
 else warnings=$(journalctl -p 4 --since today | wc -l);           # journal shows 2 lines when no entries change to show no errors
fi;
message=$critical_errors"  Critical Errors"$newline$errors"  Errors$newline"$warnings"  Warnings"
echo  $message
/home/matt/.local/bin/notify-send.sh "$(echo  $message)" --expire-time=7000 --default-action=ksystemlog --hint=string:desktop-entry:org.kde.ksystemlog --app-name="System Log" --urgency=normal --icon=utilities-system-monitor
ps -ef| grep log-notify.sh | awk '{print $2}' | xargs kill -9

