#!/bin/bash

sudo pacman -S --needed --noconfirm gtk3 gobject-introspection-runtime

git clone https://github.com/phuhl/linux_notification_center.git && cd linux_notification_center/ || exit

link=$(curl -Ls -w %{url_effective} -o /dev/null https://github.com/phuhl/linux_notification_center/releases/latest)
curl -Ls https://github.com/phuhl/linux_notification_center/releases/download/$(basename $link)/deadd-notification-center -o deadd-notification-center

mkdir -p .out

mv deadd-notification-center .out/

sudo make install

notify-send 'Notification system installed.'

cd .. && rm -rf linux_notification_center/ 
