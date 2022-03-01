#!/bin/sh

usage(){
	echo "Usage: $(basename $0) [-h] [-s] [-c]
	-s: Turn on laptop display
	Otherwise turn on external display
	-c: Start compositor
	Otherwise turn off compositor
        -w: Use wayland method"
}

SMALLDISPLAY=false
COMPOSITOR=false
USEWAYLAND=false

while getopts 'hscw' c
do
	case $c in
		h) usage; exit ;;
		s) SMALLDISPLAY=true ;;
		c) COMPOSITOR=true ;;
                w) USEWAYLAND=true ;;
	esac
done

shift $((OPTIND-1))

# if [ $COMPOSITOR = true ]
# then
	# # start compositor
	# picom --config ~/.config/picom/picom.conf &
# else
	# # kill compositor, this is recommended when turning on the external screen as it may cause problems otherwise
	# killall picom
# fi

# nvidia default
# EXT_MON="HDMI-1-0"

# nouveau default
EXT_MON="HDMI-1-4"

# set the right display name for nvidia/nouveau driver
pacman -Q nvidia && EXT_MON="HDMI-1-0" || EXT_MON="HDMI-1-4"

if [ $USEWAYLAND = false ]
then
        if [ $SMALLDISPLAY = false ]
        then
                # # turn on big display
                # xrandr --output HDMI-1-0 --left-of eDP-1 --auto
                # #turn off laptop display
                # xrandr --output eDP-1 --off

                xrandr --output "$EXT_MON" --auto --output eDP-1 --off
        else
                #turn on laptop display
                xrandr --output eDP-1 --left-of "$EXT_MON" --auto
                # turn off external display
                xrandr --output "$EXT_MON" --off
        fi
else
        drm_info
fi
