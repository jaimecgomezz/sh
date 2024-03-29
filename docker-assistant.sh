#!/usr/bin/env sh

#-----------------------------
# @jaimecgomezz
#
# Easily run common docker
# commands
#
# requirements:
#   - nsl (custom)
#------------------- protected
export PNAME="${PNAME:-$(ps --no-headers -o comm $PPID)}"
#-----------------------------

USAGE="USAGE: docker-assistant.sh [ACTION]

Action
  -         Enter interactive mode
  l, list   List all containers
  s, stop   Stop all containers
  h, help   Print this guide"
print_usage() { echo "$USAGE"; }

stop_containers() { docker ps | awk '{ print $1 }' | tail -n +2 | xargs docker stop 2>/dev/null; }
list_containers() { docker ps --format "table {{.Image}}\t{{.State}}"; }

if [ -z "$1" ]; then
	if action="$(nsl list stop)"; then
		docker-assistant.sh "$action"
		exit "$?"
	else
		exit 1
	fi
fi

case "$1" in
s | stop) stop_containers ;;
l | list) list_containers ;;
h | help | *) print_usage ;;
esac
