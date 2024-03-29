#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# Easily edit config files
#
# Requires:
#   - slc (custom script)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#-----------------------------

USAGE="USAGE: configs-editor.sh [CONFIG]

CONFIG
  i3,nvim,bash,kitty,zathura,dunst,rofi"
print_usage() { echo "$USAGE"; }

options="i3
nvim
bash
kitty
zathura
dunst
rofi"

_ecfg() {
	file="$1"
	directory="${2:-$HOME}"

	kitty -e nvim -c "cd $directory" -c "e $file"
}

if config="$(echo "$options" | slc)"; then
	case "$config" in
	bash) _ecfg ".bashrc" ;;
	i3) _ecfg "config" "$HOME/.config/i3" ;;
	nvim) _ecfg "init.lua" "$HOME/.config/nvim" ;;
	dunst) _ecfg "dunstrc" "$HOME/.config/dunst" ;;
	rofi) _ecfg "config.rasi" "$HOME/.config/rofi" ;;
	kitty) _ecfg "kitty.conf" "$HOME/.config/kitty" ;;
	zathura) _ecfg "zathurarc" "$HOME/.config/zathura" ;;
	*) exit 1 ;;
	esac
else
	exit 1
fi
