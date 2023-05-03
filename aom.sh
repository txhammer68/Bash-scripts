#!/bin/bash
# set -e
while /bin/true; do qdbus org.freedesktop.ScreenSaver /ScreenSaver SimulateUserActivity ; sleep 5m; done &
appID=$!
# feh -x -q -F /home/matt/Pictures/Misc/aom.png &
# imageID=$!
# xrandr --newmode "1600x900"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync > /dev/null
# xrandr --addmode HDMI-1 "1600x900" > /dev/null
xrandr -s "1280x1024x75.0" > /dev/null
qdbus org.kde.KWin /Compositor suspend > /dev/null
wine "/home/Data/Games/AOM/AutoHotkey.exe" & > /dev/null
# kill -9 $imageID
wine "/home/matt/.wine/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology/aomx.exe" > /dev/null
kill -9 $! > /dev/null
qdbus org.kde.KWin /Compositor resume > /dev/null
xrandr -s "1920x1080x60.00" > /dev/null
sleep 2s > /dev/null
# ps -ef| grep AutoHotkey.exe | awk '{print $2}' | xargs kill -9
kill -9 $appID > /dev/null
ps -ef| grep aom.sh | awk '{print $2}' | xargs kill -9 > /dev/null
wineserver -k
exit
