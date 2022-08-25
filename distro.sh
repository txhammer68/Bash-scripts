#!/bin/bash
# Halt the script on any errors.
set -e
# OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
OS=$(awk '/DISTRIB_DESCRIPTION=/' /etc/*-release | sed 's/DISTRIB_DESCRIPTION=//' )  #| tr '[:upper:]' '[:lower:]')
x="OS_VER=$OS"
echo $x
export release="$x"
