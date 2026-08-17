#!/bin/sh

WORKSPACE="$(cd "${1:-$PWD}" && pwd -P)"
if [ -n "$VSCODELINK_HOST" ]; then
    HOSTNAME="$VSCODELINK_HOST"
elif [ -n "$SSH_CONNECTION" ]; then
    HOSTNAME="$(echo "$SSH_CONNECTION" | awk '{print $3}')"
else
    HOSTNAME="$(/bin/hostname)"
fi

if [ -n "$VSCODELINK_PROTOCOL" ]; then
    PROTOCOL="$VSCODELINK_PROTOCOL"
else
    PROTOCOL="vscode"
fi

URL="$PROTOCOL://vscode-remote/ssh-remote+$USER@$HOSTNAME$WORKSPACE?windowId=_blank"
ENCODED="$(echo -n $URL | base64 -w 0)"

printf "\033]1337;SetUserVar=%s=%s\007" open_url $ENCODED
printf '\033]8;;%s\033\\%s\033]8;;\033\\\n' "$URL" "$URL"
