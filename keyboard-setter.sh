#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# Easily set custom keyboard
# variants
#
# requirements:
#   - xorg-setxkbmap
#   - nsl (custom)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#-----------------------------

USAGE="USAGE: keyboard-setter.sh [KB]

KB
  -         Enter interactive mode
  us        US altgr-intl, default
  mx        Spanish, latam
  h, help   Print this guide"
print_usage() { echo "$USAGE"; }

mx_kb() { setxkbmap latam -option 'ctrl:nocaps'; }
us_kb() { setxkbmap us -variant altgr-intl -option 'ctrl:nocaps'; }

if [ -z "$1" ]; then
	if kb="$(nsl us mx)"; then
		keyboard-setter.sh "$kb"
		exit "$?"
	else
		exit 1
	fi
fi

case "$1" in
us) us_kb ;;
mx) mx_kb ;;
h | help | *) print_usage ;;
esac
