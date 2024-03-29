#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# Easily set predefined xrandr
# configs
#
# Requires:
#   - nsl (custom)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#-----------------------------

USAGE="Usage: screens.sh [CONFIG]

Config
  m, mirror     Mirror main screen
  e, extended   Both displays side by side
  s, secondary  Only secondary screen
  h, help       Print this help"
print_usage() { echo "$USAGE"; }

mirror_config() { xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-1-0 --off --output HDMI-A-1-0 --mode 1920x1080 --pos 0x0 --rotate normal; }
extended_config() { xrandr --output eDP --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-1-0 --off --output HDMI-A-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal; }
secondary_config() { xrandr --output eDP --off --output DisplayPort-1 --off --output DisplayPort-1-0 --off --output HDMI-A-1-0 --mode 1920x1080 --pos 0x0 --rotate normal; }

if [ -z "$1" ]; then
	if config="$(nsl mirror extended secondary)"; then
		screens.sh "$config"
		exit "$?"
	else
		exit 1
	fi
fi

case "$1" in
m | mirror) mirror_config ;;
e | extended) extended_config ;;
s | secondary) secondary_config ;;
h | help | *) print_usage ;;
esac
