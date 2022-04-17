#!/bin/bash

ans=$(echo -e "logout\nreboot\nshutdown" | dmenu -sb "#46593B")

if [ "$ans" ]; then
	[ "$ans" == "logout" ] && killall spectrwm
	[ "$ans" == "reboot" ] && reboot
	[ "$ans" == "shutdown" ] && shutdown -h now
fi
