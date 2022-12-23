#!/bin/bash

# bar = 1 (spectrwm bar)
# bar = 2 (polybar)

mod=Super_L   # Mod4
[ $(ps -aux | grep polybar | wc -l) -ge 2 ] && bar=2 || bar=1

reload () {
    xdotool key $mod+q
}

gen () {
[ "$1" ] || exit
[ "$1" == "spectr" ] && { enable=1; comment="# "; }
[ "$1" == "polybar" ] && { enable=0; comment=""; }

    cat << EOF > ~/.config/spectrwm/spectrwm.conf
# NOTE: all rgb color values in this file are in hex! see XQueryColor for examples

workspace_limit		= 4
focus_mode			= default
focus_close			= previous
# focus_close_wrap	= 1
# focus_default		= last
spawn_position		= next
# workspace_clamp	= 1
warp_focus			= 1
# warp_pointer		= 1

# Window Decoration
border_width		= 0
color_focus			= red
# color_focus_maximized	= yellow
# color_unfocus		= rgb:88/88/88
# color_unfocus_maximized	= rgb:88/88/00
region_padding	= 10
tile_gap		= 10

# Region containment
boundary_width 		= 50

# Remove window border when bar is disabled and there is only one window in workspace
# disable_border		= 1

# Bar Settings
bar_enabled			= $enable
# bar_enabled_ws[1]	= 1
bar_border_width	= 0
# bar_border[1]		= rgb:40/fd/40
# bar_border_unfocus[1]	= rgb:00/40/40
bar_color[1] = rgb:11/12/12
#bar_color_selected[1]	= rgb:00/80/80
bar_font_color[1] = rgb:b0/b9/ac
# bar_font_color_selected	= black
bar_font			= xos4 Terminus:pixelsize=18:antialias=true
# bar_font_pua		= Typicons:pixelsize=14:antialias=true
bar_action			= .config/spectrwm/scripts/baraction.sh
# bar_action_expand	= 0
bar_justify			= center
# bar_format		= +N:+I +S <+D>+4<%a %b %d %R %Z %Y+8<+A+4<+V
bar_format			= +|L %a %b %d %R %Y +|C +L +|R +A
workspace_indicator	= listcurrent,listactive,listall,markcurrent
# bar_at_bottom		= 1
# stack_enabled		= 1
# clock_enabled		= 1
# clock_format		= %a %b %d %R %Z %Y
# iconic_enabled	= 0
# maximize_hide_bar	= 0
# window_class_enabled	= 0
# window_instance_enabled	= 0
# window_name_enabled	= 0
# verbose_layout		= 1
# urgent_enabled		= 1
# urgent_collapse	= 0

# Dialog box size ratio when using TRANSSZ quirk; 0.3 < dialog_ratio <= 1.0
dialog_ratio		= 0.6

# Split a non-RandR dual head setup into one region per monitor
# (non-standard driver-based multihead is not seen by spectrwm)
# region		= screen[1]:1280x1024+0+0
# region		= screen[1]:1920x989+0+32

# Launch applications in a workspace of choice
autorun			= ws[1]:alacritty
autorun			= ws[1]:.config/spectrwm/scripts/autostart
autorun			= ws[1]:.config/spectrwm/scripts/wal-spectrwm
${comment}autorun			= ws[1]:.config/polybar/launch.sh
autorun			= ws[1]:bin/update-notif.sh
autorun			= ws[1]:xclip
# autorun		= ws[2]:xombrero http://www.openbsd.org

# Customize workspace layout at start
# layout		= ws[1]:4:0:0:0:vertical
# layout		= ws[2]:0:0:0:0:horizontal
# layout		= ws[3]:0:0:0:0:fullscreen
# layout		= ws[4]:4:0:0:0:vertical_flip
# layout		= ws[5]:0:0:0:0:horizontal_flip

# Set workspace name at start
# name			= ws[1]:IRC
# name			= ws[2]:Email
# name			= ws[3]:Browse
# name			= ws[10]:Music

# Mod key, (Windows key is Mod4) (Apple key on OSX is Mod2)
modkey = Mod4

# This allows you to include pre-defined key bindings for your keyboard layout.
keyboard_mapping = /dev/null

# PROGRAMS

# Change the default programs here
program[lock]		= xlock
program[term]		= alacritty
program[browser]	= falkon
program[vplayer]	= mpv
program[fmanager]	= thunar
program[geditor]	= gedit
program[iviewer]	= qview

program[menu]		= dmenu_run \$dmenu_bottom -fn \$bar_font -nb \$bar_color -nf \$bar_font_color -sb \$bar_color_selected -sf \$bar_font_color_selected
program[search]		= dmenu \$dmenu_bottom -i -fn \$bar_font -nb \$bar_color -nf \$bar_font_color -sb \$bar_color_selected -sf \$bar_font_color_selected
program[name_workspace]	= dmenu \$dmenu_bottom -p Workspace -fn \$bar_font -nb \$bar_color -nf \$bar_font_color -sb \$bar_color_selected -sf \$bar_font_color_selected

# To disable validation of the above, free the respective binding(s):
# bind[]		= MOD+Shift+Delete	# disable lock
# bind[]		= MOD+Shift+Return	# disable term
# bind[]		= MOD+p			# disable menu

# Optional default programs that will only be validated if you override:
# program[screenshot_all]	= screenshot.sh full	# optional
# program[screenshot_wind]	= screenshot.sh window	# optional
# program[initscr]	= initscreen.sh			# optional

# EXAMPLE: Define 'firefox' action and bind to key.
# program[firefox]	= firefox http://spectrwm.org/
# bind[firefox]		= MOD+Shift+b

bind[fmanager]		= MOD+Control+f
bind[term]			= MOD+Control+t
bind[vplayer]		= MOD+Control+v
bind[geditor]		= MOD+Control+e
bind[browser]		= MOD+Control+w
bind[iviewer]		= MOD+Control+i

program[timeshift]	= timeshift-gtk
bind[timeshift]		= MOD+Shift+t

program[switchbar]	= bin/switch-bar.sh
bind[switchbar]		= MOD+Shift+b

program[webdev_layout]	= bin/webdevLayout.sh
bind[webdev_layout]		= MOD+Control+d

# QUIRKS
# Default quirks, remove with: quirk[class:name] = NONE
# quirk[MPlayer:xv]			= FLOAT + FULLSCREEN + FOCUSPREV
# quirk[OpenOffice.org 2.4:VCLSalFrame]	= FLOAT
# quirk[OpenOffice.org 3.0:VCLSalFrame]	= FLOAT
# quirk[OpenOffice.org 3.1:VCLSalFrame]	= FLOAT
# quirk[Firefox-bin:firefox-bin]		= TRANSSZ
# quirk[Firefox:Dialog]			= FLOAT
# quirk[Gimp:gimp]			= FLOAT + ANYWHERE
# quirk[XTerm:xterm]			= XTERM_FONTADJ
# quirk[xine:Xine Window]			= FLOAT + ANYWHERE
# quirk[Xitk:Xitk Combo]			= FLOAT + ANYWHERE
# quirk[xine:xine Panel]			= FLOAT + ANYWHERE
# quirk[Xitk:Xine Window]			= FLOAT + ANYWHERE
# quirk[xine:xine Video Fullscreen Window] = FULLSCREEN + FLOAT
# quirk[pcb:pcb]				= FLOAT
# Key bindings for United States (us) keyboards
# unbind with: bind[] = <keys>

quirk[qView:qView]				= FLOAT
quirk[Mpv:mpv]	     			= FLOAT
quirk[Alacritty:Alacritty]		= FLOAT

bind[bar_toggle]	= MOD+b
bind[button2]		= MOD+v
bind[cycle_layout]	= MOD+space
bind[flip_layout]	= MOD+Shift+backslash
bind[float_toggle]	= MOD+t
bind[focus_main]	= MOD+m
bind[focus_next]	= MOD+j
bind[focus_next]	= MOD+Tab
bind[focus_prev]	= MOD+k
bind[focus_prev]	= MOD+Shift+Tab
bind[focus_urgent]	= MOD+u
bind[height_grow]	= MOD+Shift+equal
bind[height_shrink]	= MOD+Shift+minus
bind[iconify]		= MOD+w
bind[initscr]		= MOD+Shift+i
bind[lock]			= MOD+Shift+Delete
bind[master_add]	= MOD+comma
bind[master_del]	= MOD+period
bind[master_grow]	= MOD+l
bind[master_shrink]	= MOD+h
bind[maximize_toggle]	= MOD+e
bind[menu]			= MOD+p
bind[move]			= MOD+Control+z
bind[move_down]		= MOD+Shift+bracketright
bind[move_left]		= MOD+bracketleft
bind[move_right]	= MOD+bracketright
bind[move_up]		= MOD+Shift+bracketleft
bind[mvrg_1]		= MOD+Shift+KP_End
bind[mvrg_2]		= MOD+Shift+KP_Down
bind[mvrg_3]		= MOD+Shift+KP_Next
bind[mvrg_4]		= MOD+Shift+KP_Left
bind[mvrg_5]		= MOD+Shift+KP_Begin
bind[mvrg_6]		= MOD+Shift+KP_Right
bind[mvrg_7]		= MOD+Shift+KP_Home
bind[mvrg_8]		= MOD+Shift+KP_Up
bind[mvrg_9]		= MOD+Shift+KP_Prior
bind[mvws_1]		= MOD+Shift+1
bind[mvws_2]		= MOD+Shift+2
bind[mvws_3]		= MOD+Shift+3
bind[mvws_4]		= MOD+Shift+4
bind[mvws_5]		= MOD+Shift+5
bind[mvws_6]		= MOD+Shift+6
bind[mvws_7]		= MOD+Shift+7
bind[mvws_8]		= MOD+Shift+8
bind[mvws_9]		= MOD+Shift+9
bind[mvws_10]		= MOD+Shift+0
bind[mvws_11]		= MOD+Shift+F1
bind[mvws_12]		= MOD+Shift+F2
bind[mvws_13]		= MOD+Shift+F3
bind[mvws_14]		= MOD+Shift+F4
bind[mvws_15]		= MOD+Shift+F5
bind[mvws_16]		= MOD+Shift+F6
bind[mvws_17]		= MOD+Shift+F7
bind[mvws_18]		= MOD+Shift+F8
bind[mvws_19]		= MOD+Shift+F9
bind[mvws_20]		= MOD+Shift+F10
bind[mvws_21]		= MOD+Shift+F11
bind[mvws_22]		= MOD+Shift+F12
bind[name_workspace]	= MOD+Shift+slash
bind[quit]			= MOD+Shift+q
bind[raise_toggle]	= MOD+Shift+r
bind[resize]		= MOD+Control+x
bind[restart]		= MOD+q
bind[rg_1]		= MOD+KP_End
bind[rg_2]		= MOD+KP_Down
bind[rg_3]		= MOD+KP_Next
bind[rg_4]		= MOD+KP_Left
bind[rg_5]		= MOD+KP_Begin
bind[rg_6]		= MOD+KP_Right
bind[rg_7]		= MOD+KP_Home
bind[rg_8]		= MOD+KP_Up
bind[rg_9]		= MOD+KP_Prior
bind[rg_next]		= MOD+Shift+Right
bind[rg_prev]		= MOD+Shift+Left
bind[screenshot_all]	= MOD+s
bind[screenshot_wind]	= MOD+Shift+s
bind[search_win]	= MOD+f
bind[search_workspace]	= MOD+slash
bind[stack_dec]		= MOD+Shift+period
bind[stack_inc]		= MOD+Shift+comma
bind[stack_reset]	= MOD+Shift+space
bind[swap_main]		= MOD+Return
bind[swap_next]		= MOD+Shift+j
bind[swap_prev]		= MOD+Shift+k
bind[uniconify]		= MOD+Shift+w
bind[version]		= MOD+Shift+v
bind[width_grow]	= MOD+equal
bind[width_shrink]	= MOD+minus
bind[wind_del]		= MOD+x
bind[wind_kill]		= MOD+Shift+x
bind[ws_1]		= MOD+1
bind[ws_2]		= MOD+2
bind[ws_3]		= MOD+3
bind[ws_4]		= MOD+4
bind[ws_5]		= MOD+5
bind[ws_6]		= MOD+6
bind[ws_7]		= MOD+7
bind[ws_8]		= MOD+8
bind[ws_9]		= MOD+9
bind[ws_10]		= MOD+0
bind[ws_11]		= MOD+F1
bind[ws_12]		= MOD+F2
bind[ws_13]		= MOD+F3
bind[ws_14]		= MOD+F4
bind[ws_15]		= MOD+F5
bind[ws_16]		= MOD+F6
bind[ws_17]		= MOD+F7
bind[ws_18]		= MOD+F8
bind[ws_19]		= MOD+F9
bind[ws_20]		= MOD+F10
bind[ws_21]		= MOD+F11
bind[ws_22]		= MOD+F12
bind[ws_next]		= MOD+Right
bind[ws_next_all]	= MOD+Up
bind[ws_next_move]	= MOD+Shift+Up
bind[ws_prev]		= MOD+Left
bind[ws_prev_all]	= MOD+Down
bind[ws_prev_move]	= MOD+Shift+Down
bind[ws_prior]		= MOD+a
EOF
}

if [ $bar == 1 ]
then
    source .config/polybar/launch.sh &
    gen polybar
fi
if [ $bar == 2 ]
then
    killall polybar
    gen spectr
fi

sleep 0.5
xdotool key $mod+b
reload
sleep 0.5
# only way to change raise_toggle, lol
xdotool key Super_L+Shift+r
