#!/bin/sh

PATH="/home/max/docker/netdata"
HOSTNAME="$(/bin/hostname)"
URL="vscode://vscode-remote/ssh-remote+$HOSTNAME$PATH?windowId=_blank"
echo $URL