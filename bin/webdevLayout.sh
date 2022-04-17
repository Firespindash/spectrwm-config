#!/bin/bash

# Author: Firespindash
# Date: Nov 15th, 2020
# License: MIT

alacritty &
sleep 0.3
wmctrl -r Alacritty -e "0,160,190,500,750"
