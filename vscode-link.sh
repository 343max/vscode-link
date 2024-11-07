#!/bin/sh

WORKSPACE="$(cd "${1:-$PWD}" && pwd -P)"
if [ -n "$VSCODELINK_HOST" ]; then
    HOSTNAME="$VSCODELINK_HOST"
else
    HOSTNAME="$(/bin/hostname)"
fi

if [ -n "$VSCODELINK_PROTOCOL" ]; then
    PROTOCOL="$VSCODELINK_PROTOCOL"
else
    PROTOCOL="vscode"
fi

URL="$PROTOCOL://vscode-remote/ssh-remote+$HOSTNAME$WORKSPACE?windowId=_blank"
ENCODED="$(echo -n $URL | base64 -w 0)"

printf "\033]1337;SetUserVar=%s=%s\007" open_url $ENCODED
echo $URL
