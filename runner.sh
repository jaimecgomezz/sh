#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# Easily list and run scripts
#
# Requires:
#   - slc (custom)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#------------------------ vars
SCRIPTS="$HOME/sh"
#-----------------------------

USAGE="Usage: rrr

Script
  -         Enter interactive mode
  h, help   Print this help"
print_usage() { echo "$USAGE"; }

options="arandr
block pages
docker
edit configs
keyboard layout
swicth theme
system exit
todo
wallpapers
pick color
explain man
uuid"

_uuid() {
	cuuid="$(uuid)"
	echo "$cuuid" | tr -d '\n' | xclip -selection c
	nfy -t 60000 "$cuuid"
}

if selection="$(echo "$options" | slc)"; then
	case "$selection" in
	"arandr") screens.sh ;;
	"docker") docker-assistant.sh ;;
	"edit configs") configs-editor.sh ;;
	"keyboard layout") keyboard-setter.sh ;;
	"swicth theme") swc ;;
	"system exit") exit-manager.sh ;;
	"todo") tdo ;;
	"wallpapers") wal ;;
	"pick color") xcl ;;
	"explain man") xpl ;;
	"uuid") _uuid ;;
	*) exit 1 ;;
	esac
else
	exit 1
fi
