#!/bin/bash

echo "$(pacman -Qqe | wc -l) pkgs"
