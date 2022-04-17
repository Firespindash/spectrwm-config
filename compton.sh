#!/bin/bash

sudo pacman -S --needed --noconfirm asciidoc mesa

git clone https://github.com/tryone144/compton.git && cd compton/ || exit

make
make docs
sudo make install

cd .. && rm -rfv compton/
