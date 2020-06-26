#!/bin/bash

# Script by Syonyk: https://syonyk.blogspot.com/
# Do what you wish with it.  Patches welcome at:
# https://github.com/syonyk/pinebookpro

if [ $# -eq 0 ]; then
	echo "Usage: sudo pbp_cpu.sh [all, big, little, status, gov [governor]]"
	exit
fi

if [ $1 = "all" ]; then
	echo "Enabling all cores."
	echo 1 > /sys/devices/system/cpu/cpu0/online
	echo 1 > /sys/devices/system/cpu/cpu1/online
	echo 1 > /sys/devices/system/cpu/cpu2/online
	echo 1 > /sys/devices/system/cpu/cpu3/online
	echo 1 > /sys/devices/system/cpu/cpu4/online
	echo 1 > /sys/devices/system/cpu/cpu5/online
fi

if [ $1 = "big" ]; then
	echo "Enabling only big cores."
	# Online the big cores first, then take the little ones offline.
        echo 1 > /sys/devices/system/cpu/cpu4/online
        echo 1 > /sys/devices/system/cpu/cpu5/online
        echo 0 > /sys/devices/system/cpu/cpu0/online
        echo 0 > /sys/devices/system/cpu/cpu1/online
        echo 0 > /sys/devices/system/cpu/cpu2/online
        echo 0 > /sys/devices/system/cpu/cpu3/online
fi

if [ $1 = "little" ]; then
	echo "Enabling only LITTLE cores."
        echo 1 > /sys/devices/system/cpu/cpu0/online
        echo 1 > /sys/devices/system/cpu/cpu1/online
        echo 1 > /sys/devices/system/cpu/cpu2/online
        echo 1 > /sys/devices/system/cpu/cpu3/online
        echo 0 > /sys/devices/system/cpu/cpu4/online
        echo 0 > /sys/devices/system/cpu/cpu5/online
fi

if [ $1 = "status" ]; then
	echo "Core status:";
	echo -n "cpu0 (LITTLE): "
	cat /sys/devices/system/cpu/cpu0/online
	echo -n "cpu1 (LITTLE): "
	cat /sys/devices/system/cpu/cpu1/online
	echo -n "cpu2 (LITTLE): "
	cat /sys/devices/system/cpu/cpu2/online
	echo -n "cpu3 (LITTLE): "
	cat /sys/devices/system/cpu/cpu3/online
	echo -n "cpu4 (big)   : "
	cat /sys/devices/system/cpu/cpu4/online
	echo -n "cpu5 (big)   : "
	cat /sys/devices/system/cpu/cpu5/online
fi

if [ $1 = "gov" ]; then
	echo "Setting governor ${2}"
        echo $2 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
        echo $2 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
        echo $2 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
        echo $2 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
        echo $2 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
        echo $2 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
fi

