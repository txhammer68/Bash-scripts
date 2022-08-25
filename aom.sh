set -e
while /bin/true; do qdbus org.freedesktop.ScreenSaver /ScreenSaver SimulateUserActivity > /dev/null; sleep 1m; done &
xrandr -s "1280x1024_60.00"
qdbus org.kde.KWin /Compositor suspend
env WINEPREFIX="/home/matt/.wine" wine '/Data/Games/AOM/AutoHotkey.exe' &
env WINEPREFIX="/home/matt/.wine" wine '/Data/.wine/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology/aomx.exe'
kill $!
qdbus org.kde.KWin /Compositor resume
xrandr -s "1920x1080_60.00"
sleep 2s
ps -ef| grep aom.sh | awk '{print $2}' | xargs kill -9
exit
