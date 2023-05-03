#!/bin/bash

## find files modified within last 7 days and scan for virus/malware
## --max-filesize=100k --max-filesize=0 --max-scansize=0
## options --follow-dir-symlinks=0 --follow-file-symlinks=0 --cross-fs=no
## other malware scan  apps:  Chkrootkit, rkhunter
DATE= date
echo "========================================================= $DATE ============================================================" > /var/log/clamav.log
## date > /var/log/clamav.log
 clam_msg=$(find / -mtime -7 -type f -print0 | clamscan --log=/var/log/clamav.log --infected --recursive --move=/Data/temp/ --exclude-dir='^/sys|^/dev|^/proc|^/Data/Music/|^/Data/Pictures/|^/Data/Videos/|^/Backup/Music/|^/Backup/Pictures/|^/Data/Downloads/Distros/' /home/matt |grep -A5 "SCAN SUMMARY")

echo "$clam_msg"  >>/var/log/clamav.log
echo "=============================================================================================================================">>/var/log/clamav.log

#clam_msg=$(clamscan  /home/matt/bin/|grep -A5 "SCAN SUMMARY")
clam_files=$(echo "$clam_msg" | grep "Scanned files:")
clam_infected=$(echo "$clam_msg" | grep "Infected files:")
#echo $clam_files
#echo $clam_infected
#echo $clam_msg
newline='\n'
clam_msg=$clam_files$newline$clam_infected
#echo $clam_msg
/home/matt/.local/bin/notify-send.sh "$(echo "$clam_msg")" --expire-time=10000 --hint=string:desktop-entry:clamtk --default-action="kate /var/log/clamav.log" --app-name="Clam AV" --urgency=normal --icon=utilities-system-monitor
