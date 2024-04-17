#!/bin/sh

WORKSPACE="$(cd "${1:-$PWD}" && pwd -P)"
HOSTNAME="$(/bin/hostname)"
URL="vscode://vscode-remote/ssh-remote+$HOSTNAME$WORKSPACE?windowId=_blank"
echo $URL