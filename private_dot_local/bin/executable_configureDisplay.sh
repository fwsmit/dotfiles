#!/bin/sh

usage(){
	echo "Usage: $(basename $0) [-h] [-s] [-c]
	-s: Turn on laptop display
	Otherwise turn on external display
	-c: Start compositor
	Otherwise turn off compositor"
}

SMALLDISPLAY=false
COMPOSITOR=false

while getopts 'hsc' c
do
	case $c in
		h) usage; exit ;;
		s) SMALLDISPLAY=true ;;
		c) COMPOSITOR=true ;;
	esac
done

shift $((OPTIND-1))

if [ $COMPOSITOR = true ]
then
	# start compositor
	picom --config ~/.config/picom/picom.conf &
else
	# kill compositor, this is recommended when turning on the external screen as it may cause problems otherwise
	killall picom
fi

if [ $SMALLDISPLAY = false ]
then
	# turn on big display
	xrandr --output HDMI-1-0 --left-of eDP-1 --auto
	#turn off laptop display
	xrandr --output eDP-1 --off
else
	#turn on laptop display
	xrandr --output eDP-1 --left-of HDMI-1-0 --auto
	# turn off external display
	xrandr --output HDMI-1-0 --off
fi
