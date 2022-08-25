#!/bin/bash
wallpaperdir="$HOME/Pictures/wallpapers/vistas"
files=($wallpaperdir/*)
randompic=`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`
echo "$randompic"
# cp "$randompic" /tmp/wallpaper.png
# ln -sf $randompic $HOME/Pictures/wallpapers/test/wallpaper.png
# randompic=`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`
# cp $randompic /tmp/slides/wallpaper1.png
# ln -sf $randompic $HOME/Pictures/wallpapers/test/wallpaper1.png
# plasma-apply-wallpaperimage $randompic >/dev/null
# kwriteconfig5 --file "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc" --group 'Containments' --group '40' --group 'Wallpaper' --group 'org.kde.image' --group 'General' --key 'Image' "$randompic"
# kwriteconfig5 --file ~/.config/kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image "$randompic"
# does not update wallpaper with timer/systemd
# problem is lockscreen wallpaper no way to sync with desktop wallpaper
# lockscreen timer is diff than desktop timer
# qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();var img=$randompic;print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", img)}';

# scenario tested
# cp $randompic /tmp/wallpaper.png
# plasma-apply-wallpaperimage /tmp/wallpaper.png  *** WORKS ***
# kwriteconfig5 desktop wallpaper *** DOES NOT WORK ***
# kwriteconfig5 lockscreen set image to /tmp/slides/wallpaper.png  *** DOES NOT WORK ***
# lockscreen does not update when changed...
