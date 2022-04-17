#!/bin/bash

curl -Ls https://github.com/google/fonts/raw/4e6d978a7432514a9918b07863bb5280e7cc8815/ofl/comfortaa/Comfortaa-Bold.ttf
curl -Ls https://github.com/google/fonts/raw/4e6d978a7432514a9918b07863bb5280e7cc8815/ofl/comfortaa/Comfortaa-Light.ttf
curl -Ls https://github.com/google/fonts/raw/4e6d978a7432514a9918b07863bb5280e7cc8815/ofl/comfortaa/Comfortaa-Regular.ttf
curl -Ls https://github.com/google/fonts/raw/4e6d978a7432514a9918b07863bb5280e7cc8815/ofl/comfortaa/OFL.txt -o ttf-comfortaa-OFL.txt

sudo install -dm 755 "/usr/local/share/fonts"
sudo install -dm 755 "/usr/local/share/fonts/ttf"
sudo install -dm 755 "/usr/local/share/fonts/ttf/Comfortaa"
sudo install -m 644 Comfortaa-Bold.ttf "/usr/local/share/fonts/ttf/Comfortaa/Comfortaa-Bold.ttf"
sudo install -m 644 Comfortaa-Light.ttf "/usr/local/share/fonts/ttf/Comfortaa/Comfortaa-Light.ttf"
sudo install -m 644 Comfortaa-Regular.ttf "/usr/local/share/fonts/ttf/Comfortaa/Comfortaa-Regular.ttf"
sudo install -Dm644 ttf-comfortaa-OFL.txt "/usr/share/licenses/ttf-comfortaa/LICENSE"

fc-cache

rm Comfortaa-* ttf-comfortaa-OFL.txt
