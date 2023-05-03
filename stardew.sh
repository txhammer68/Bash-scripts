#!/bin/bash
# set -e
while /bin/true; do qdbus org.freedesktop.ScreenSaver /ScreenSaver SimulateUserActivity ; sleep 5m; done &
appID=$!
qdbus org.kde.KWin /Compositor suspend > /dev/null
wine "/home/matt/.wine/drive_c/Stardew-Valley-Repack-Games.com/Stardew Valley/Stardew Valley.exe" > /dev/null
kill -9 $! > /dev/null
qdbus org.kde.KWin /Compositor resume > /dev/null
kill -9 $appID > /dev/null
ps -ef| grep stardew.sh | awk '{print $2}' | xargs kill -9 > /dev/null
wineserver -k
exit
