#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# System exit manager
#
# Requires:
#   - nsl (custom)
#   - lok (custom)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#-----------------------------

USAGE="Usage: exit-manager.sh [ACTION]

Action
  -             Enter interactive mode
  l, lock       Lock screen
  s, suspend    Suspend system
  r, reboot     Reboot system
  S, shutdown   Shutdown system
  e, exit       Exit WM
  h, help       Print this guide"
print_usage() { echo "$USAGE"; }

if [ -z "$1" ]; then
	if action="$(nsl lock suspend reboot shutdown exit)"; then
		exit-manager.sh "$action"
		exit "$?"
	else
		exit 1
	fi
fi

case "$1" in
l | lock) screen-locker.sh ;;
e | exit) i3-msg exit ;;
r | reboot) systemctl reboot ;;
S | shutdown) systemctl poweroff ;;
s | suspend) lok && systemctl suspend ;;
h | help | *) print_usage ;;
esac
