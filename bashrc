# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacman='sudo pacman'
alias shutdown='shutdown -h now'
PS1='[\u@\h \W]\$ '

shopt -s expand_aliases

# Remove duplicates from bash history
export HISTCONTROL=ignoreboth:erasedups

wal -Rnq
# Enabling alttab here, because of .xprofile bug
switcher=$(pgrep -U 1000 "^alttab")
if [ -z $switcher ]; then
    nohup alttab -font "xft:Terminus:pixelsize=18" -i 96x96 -frame "#475846" -bg "#111212" -fg "#b0b9ac" >& /dev/null &
fi
