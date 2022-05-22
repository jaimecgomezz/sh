#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# Easily access man pages in
# their PDF format
#
# Requires:
#   - slc (custom)
#   - zathura (pdf support)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#-----------------------------

USAGE="Usage: xpl [PAGE]

Page
  [Page]    Any valid man page
  h, help   Print this help"
print_usage() { echo "$USAGE"; }

explain_page() { echo "$1" | sed 's/\ \+-.*//' | xargs man -Tpdf 2>/dev/null | zathura -; }

if [ -z "$1" ]; then
	if page="$(man -k . | slc -filter "^" -matching "regex")"; then
		xpl "$page"
		exit 0
	else
		exit 1
	fi
fi

case "$1" in
h | help) print_usage ;;
*) explain_page "$1" & ;;
esac
