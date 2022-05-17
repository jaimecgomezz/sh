#!/usr/bin/env sh

##############################
# @jaimecgomezz
#
# Easily access man pages in
# their PDF format
#
# Requires:
#   - fzf
#   - man
#   - zathura (pdf support)
##############################

USAGE="Usage: xpl [PAGE]
PAGE
  h, help   Print this help
  *         Any valid man page"
print_usage() { echo "$USAGE"; }

explain_page() { echo "$1" | sed 's/\ \+-.*//' | xargs man -Tpdf 2>/dev/null | zathura -; }

if [ -z "$1" ]; then
	if page="$(man -k . | fzf -e +m --cycle -q "^" --prompt="man ")"; then
		xpl "$page"
		exit 0
	else
		exit 1
	fi
fi

PAGE="$1"

case "$PAGE" in
h | help) print_usage ;;
*) explain_page "$PAGE" & ;;
esac
