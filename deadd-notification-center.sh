#!/bin/bash

sudo pacman -S --needed gtk3 gobject-introspection-runtime cairo pango stack

git clone https://github.com/phuhl/linux_notification_center.git && cd linux_notification_center/ || exit

make
sudo make install

sudo pacman -Rcns stack
cd .. && rm -rfv linux_notification_center/ 
