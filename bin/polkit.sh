#!/bin/bash

# Author: Firespindash
# Date: Oct 20th, 2020
# Version: 1.2

# A script to start polkit in a minimun environment like spectrwm

PID=$(ps -aux | grep /usr/lib/polkit-1/polkitd | awk 'NR==1{ print $2 }')

[ "$1" == "-k" ] && kill -9 "$PID" || /usr/lib/polkit-1/polkitd &
