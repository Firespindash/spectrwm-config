#!/bin/bash

sudo pacman -S --needed --noconfirm asciidoc mesa libconfig

git clone https://github.com/tryone144/compton.git && cd compton/ || exit

make
make docs
sudo make install

cd .. && rm -rf compton/
