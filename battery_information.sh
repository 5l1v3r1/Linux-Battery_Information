#!/bin/bash
OUTPUT="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage")"

SUBSTRING=$(echo "${OUTPUT}" | cut -d '%' -f 1)

a=$SUBSTRING

b="${a##    percentage:          }"

while true
do
	export DISPLAY=:0.0
	if [ $b = 95 ]
	then
		/usr/bin/notify-send --urgency=critical --icon=battery "Battery Information" "Battery is Fully Charged, Unplug The Charger"
	fi
	sleep 2m
	logger "script started"
done

