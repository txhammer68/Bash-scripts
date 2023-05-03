#!/bin/bash
version=`plasmashell -v | cut -c 13-`
title="[General]\n"
name="Name=Plasma OS\n"
logo="LogoPath=/home/matt/Pictures/Misc/icons/intel.png\n"
web="Website=https://github.com/txhammer68\n"
version="Version=$version\n"
var="Variant=digitech edition\n"
echo -e "$title$name$logo$web$version$var" > /home/matt/.config/kcm-about-distrorc
