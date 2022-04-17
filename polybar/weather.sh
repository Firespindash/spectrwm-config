#!/bin/sh

curl -s wttr.in/?format="%l:+%t" > /home/$USER/.config/polybar/temp.txt

cat /home/$USER/.config/polybar/temp.txt
