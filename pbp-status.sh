#!/bin/bash

# Script by Syonyk: https://syonyk.blogspot.com/
# Do what you wish with it.  Patches welcome at:
# https://github.com/syonyk/pinebookpro

# These probably won't have to change at any point...
CPUSTAT_BASE="/sys/devices/system/cpu"
TEMP_BASE="/sys/class/thermal"
BAT_BASE="/sys/class/power_supply/cw2015-battery"

# Get the CPU frequencies and status. F is frequency, O is online.

C0F=$(<$CPUSTAT_BASE/cpu0/cpufreq/scaling_cur_freq)
C0O=$(<$CPUSTAT_BASE/cpu0/online)
C0G=$(<$CPUSTAT_BASE/cpu0/cpufreq/scaling_governor)
C1F=$(<$CPUSTAT_BASE/cpu1/cpufreq/scaling_cur_freq)
C1O=$(<$CPUSTAT_BASE/cpu1/online)
C1G=$(<$CPUSTAT_BASE/cpu1/cpufreq/scaling_governor)
C2F=$(<$CPUSTAT_BASE/cpu2/cpufreq/scaling_cur_freq)
C2O=$(<$CPUSTAT_BASE/cpu2/online)
C2G=$(<$CPUSTAT_BASE/cpu2/cpufreq/scaling_governor)
C3F=$(<$CPUSTAT_BASE/cpu3/cpufreq/scaling_cur_freq)
C3O=$(<$CPUSTAT_BASE/cpu3/online)
C3G=$(<$CPUSTAT_BASE/cpu3/cpufreq/scaling_governor)
C4F=$(<$CPUSTAT_BASE/cpu4/cpufreq/scaling_cur_freq)
C4O=$(<$CPUSTAT_BASE/cpu4/online)
C4G=$(<$CPUSTAT_BASE/cpu4/cpufreq/scaling_governor)
C5F=$(<$CPUSTAT_BASE/cpu5/cpufreq/scaling_cur_freq)
C5O=$(<$CPUSTAT_BASE/cpu5/online)
C5G=$(<$CPUSTAT_BASE/cpu5/cpufreq/scaling_governor)

# Hack off the kHz from the CPUs.
let C0F=$C0F/1000
let C1F=$C1F/1000
let C2F=$C2F/1000
let C3F=$C3F/1000
let C4F=$C4F/1000
let C5F=$C5F/1000

echo  -e "CPU0: ${C0O} Freq: ${C0F} MHz\t(${C0G})"
echo  -e "CPU1: ${C1O} Freq: ${C1F} MHz\t(${C1G})"
echo  -e "CPU2: ${C2O} Freq: ${C2F} MHz\t(${C2G})"
echo  -e "CPU3: ${C3O} Freq: ${C3F} MHz\t(${C3G})"
echo  -e "CPU4: ${C4O} Freq: ${C4F} MHz\t(${C4G})"
echo  -e "CPU5: ${C5O} Freq: ${C5F} MHz\t(${C5G})"
echo

# Thermal: Grab zone 0/1
T0=$(<$TEMP_BASE/thermal_zone0/temp)
T1=$(<$TEMP_BASE/thermal_zone1/temp)

let T0=$T0/1000
let T1=$T1/1000

echo "Temp 0: ${T0}"
echo "Temp 1: ${T1}"
echo

# Battery stats
BV=$(<$BAT_BASE/voltage_now)
BC=$(<$BAT_BASE/current_now)

let BV=$BV/1000
let BC=$BC/1000
let BW=($BC*$BV)/1000

echo "Voltage: ${BV} mV"
echo "Current: ${BC} mA"
echo "Power:   ${BW} mW"
