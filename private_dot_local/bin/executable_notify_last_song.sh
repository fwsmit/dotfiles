#!/bin/sh

/usr/bin/kill -s SIGUSR1 `pidof mpd-notification` || dunstify "mpd-notification is not running"
