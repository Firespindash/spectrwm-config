#!/bin/bash

pkgs=$(checkupdates | wc -l)

[ $pkgs -gt 0 ] &&
	sudo -u $USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus \
	notify-send "Update" "There are $pkgs packages to update." --icon=system-software-update ||
	exit 0
