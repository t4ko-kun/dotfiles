#!/bin/sh

# Occupied Disk Space
hdd() {
	hdd="$(df -h /home | grep /dev | awk '{print $3 " / " $5}')"
	echo -e "$hdd"
}

# System Memory Usage
mem() {
	mem="$()"
	echo -e "$mem"
}

# CPU Usage
cpu() {
	cpu="$()"
	echo -e "$cpu"
}

# CPU Temperature
temp() {
	temp="$(sysctl -n hw.acpi.thermal.tz0.temperature | sed 's/C/°C/')"
	echo -e "$temp"
}

# Volume
vol() {
	vol="$(mixer vol | awk 'BEGIN { FS = "[ \t]*|[:]" }{ print $7 }')"
	echo -e "$vol%"
}

# Installed Packages
pkgs() {
	pkgs="$(pkg stat | grep 'Installed packages:' | awk '{printf $3}')"
	echo -e "$pkgs"
}

# Number of available package upgrades
upgrades() {
	upgrades="$(pkg upgrade -n | grep 'Number of packages to be upgraded:' | awk '{printf $7}')"
	if [ -z $upgrades ]
	then
		upgrades=0
	fi
	echo -e "$upgrades"
}

# SSID of connected network
ssid() {
	ssid="$(ifconfig | grep 'ssid' | awk '{print $2}')"
	echo -e "$ssid"
}

## Weather forecast
weather() {
	wthr="$(sed 20q ~/.config/weather.txt | grep value | awk '{print $2 $3}' | sed 's/"//g')"
	echo "$wthr"
}

# Battery status and charge
bat() {
	ac="$(apm -a)"
	bat_status="$(apm -b)"
	bat_charge="$(apm -l)"
	
	if [ $ac == 1 & $bat_status == 3 ]
	then
		echo -e "+@fn=1; +@fn=0;$bat_charge%"
		exit
	elif [ $ac == 1 ]
	then
		echo -e "+@fn=1; +@fn=0;"
		exit
	fi

	case "$bat_status" in
		# high
		"0") echo -e "+@fn=1; +@fn=0;$(bat_charge)"
		;;
		# low
		"1") echo -e "+@fn=1; +@fn=0;$(bat_charge)"
		;;
		# critical
		"2") echo -e "+@fn=1; +@fn=0;$(bat_charge)"
		;;
	esac
}

SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while :; do     
	#This bar has icons and requires font-awesome package to be installed and declared as a secondary font in spectrwm.config
    # echo "+@fn=1; +@fn=0;$(cpu) |  +@fn=1; +@fn=0;$(mem) |  +@fn=1;+@fn=0;$(pkgs) |  +@fn=1;+@fn=0;$(upgrades) |   +@fn=1;+@fn=0;$(hdd) | NETWORK  +@fn=1;+@fn=0;$(ssid) |  +@fn=1;+@fn=0;$(vol) | $(weather) $(temp)"
	echo "+@fn=1; +@fn=0;$(vol) | +@fn=1; +@fn=0;$(upgrades) | +@fn=1; +@fn=0;$(ssid) | +@fn=1; +@fn=0;$(mem) | +@fn=1;龍 +@fn=0;$(cpu) | +@fn=1; +@fn=0;$(temp) | $(bat)"
	sleep $SLEEP_SEC
done
