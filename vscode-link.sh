#!/bin/sh

WORKSPACE="$(cd "${1:-$PWD}" && pwd -P)"
if [ -n "$VSCODELINK_HOST" ]; then
    HOSTNAME="$VSCODELINK_HOST"
else
    HOSTNAME="$(/bin/hostname)"
fi
URL="vscode://vscode-remote/ssh-remote+$HOSTNAME$WORKSPACE?windowId=_blank"
echo $URL