#!/bin/bash
# set -e
while /bin/true; do qdbus org.freedesktop.ScreenSaver /ScreenSaver SimulateUserActivity ; sleep 5m; done &
appID=$!
# feh -x -q -F /home/matt/Pictures/Misc/aom.png &
# imageID=$!
# xrandr --newmode "1600x900"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync > /dev/null
# xrandr --addmode HDMI-1 "1600x900" > /dev/null
# xrandr -s 1280x1024 > /dev/null
kscreen-doctor output.HDMI-A-3.mode.1280x1024@75
qdbus org.kde.KWin /Compositor suspend > /dev/null
cd /home/data/.wine/
wine "/home/data/Games/AOM/AutoHotkey.exe" & > /dev/null
# kill -9 $imageID
WINEARCH=win64 WINEPREFIX=/home/matt/.wine/ wine "/home/matt/.wine/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology/aomx.exe" > /dev/null
kill -9 $! > /dev/null
qdbus org.kde.KWin /Compositor resume > /dev/null
# xrandr -s "1920x1080x60.00" > /dev/null
kscreen-doctor output.HDMI-A-3.mode.1920x1080@60
sleep 2s > /dev/null
# ps -ef| grep AutoHotkey.exe | awk '{print $2}' | xargs kill -9
kill -9 $appID > /dev/null
ps -ef| grep aom.sh | awk '{print $2}' | xargs kill -9 > /dev/null
wineserver -k
exit


# /home/matt/Downloads/wine-8.9/bin/wine  "/home/matt/.wine/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology/aomx.exe"
