#!/bin/sh

killall -9 polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar mybar
