#!/bin/bash

sudo pacman -S --noconfirm --needed xlockmore alacritty falkon mpv thunar gedit \
			gedit-plugins pacman-contrib polkit-qt5 xclip xdotool xwallpaper wmctrl python-pip

yay -S --noconfirm --needed alttab-git polybar qview timeshift-bin ttf-material-design-icons

sourceIt () { echo $1; source $1; }; sourceIt ./compton.sh
sourceIt ./deadd-notification-center.sh
sourceIt ./ttf-comfortaa.sh; sourceIt ./wallpaper.sh

[ -f ~/.bashrc ] && cp -v ~/.bashrc ~/.bashrc.bak
[ -f ~/.profile ] && cp -v ~/.profile ~/.profile.bak
[ -f ~/.config/fontconfig/fonts.conf ] && \
	cp -v ~/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf.bak || \
	mkdir ~/.config/fontconfig/
[ -d ~/.config/alacritty/ ] && cp -rv ~/.config/alacritty ~/.config/alacritty.bak
	
\cp -v bashrc ~/.bashrc
\cp -v profile ~/.profile
\cp -v fonts.conf ~/.config/fontconfig/

\cp -rv alacritty/ ~/.config/
cp -rv bin/ ~/

monitor=$(xrandr | grep primary | cut -d ' ' -f 1)
sed -i "s/HDMI-0/$monitor/g" spectrwm/scripts/autostart
[ "$monitor" != "HDMI-0" ] && sed -i "s/HDMI-0/$monitor/g" polybar/config.ini

cp -v compton.conf ~/.config/
cp -rv spectrwm/ ~/.config/

sudo pip install pywal

git clone https://github.com/D35P4C1T0/pywal-spectrwm.git

mv -v pywal-spectrwm/ ~/.config/spectrwm/ 

wal -i "~/.config/spectrwm/wallpaper.jpg"

cp -rv polybar/ ~/.config/
