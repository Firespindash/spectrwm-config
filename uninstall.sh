#!/bin/bash

echo "ATTENTION: This is a dangerous script, you will have to choose the apps to remove."
sleep 3
echo "It is strongly recommended that you know what each app does."
sleep 3

sudo pacman -Rcns xlockmore alacritty falkon mpv thunar gedit gedit-plugins \
			  pacman-contrib polkit-qt5 xclip xdotool xwallpaper wmctrl

yay -Rcns alttab-git polybar qview timeshift-bin ttf-material-design-icons

git clone https://github.com/tryone144/compton.git && cd compton/ || exit
sudo make uninstall

sudo pacman -Rcns asciidoc mesa

git clone https://github.com/phuhl/linux_notification_center.git && cd linux_notification_center/ || exit
sudo make uninstall

sudo pacman -Rcns gtk3 gobject-introspection-runtime cairo pango stack

rm -rfv /usr/local/share/fonts
rm -v /usr/share/licenses/ttf-comfortaa/LICENSE

[ -f ~/.bashrc.bak ] && cp -v ~/.bashrc.bak ~/.bashrc
[ -f ~/.profile.bak ] && cp -v ~/.profile.bak ~/.profile

rm -rfv ~/bin ~/.config/spectrwm ~/.config/polybar

echo "You should have xterm installed, if you want to do things with x11, depending on the thing."