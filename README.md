# Syonyk's PineBook Pro Utility Scripts

This is a small collection of utility scripts for PineBook Pro status reporting.

## pbp-cpu.sh
pbp-cpu.sh exists to perform several utility functions on the CPUs.

```sudo ./pbp-cpu.sh all``` : Turn all 6 CPU cores on (big and LITTLE)

```sudo ./pbp-cpu.sh little``` : Turn only the 4 LITTLE cores on.

```sudo ./pbp-cpu.sh big``` : Turn on only the 2 big cores (this might be useful if you want to run KVM with hardware acceleration)

```./pbp-cpu.sh status``` : Show the core status

```sudo ./pbp-cpu.sh gov schedutil``` : Set all 6 cores to the schedutil governor.

If you want to see the avaiable CPU governors, you can get them out of the cpu0 listing:

```cat cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors```

You probably won't need much more than powersave, performance, and schedutil on a modern enough kernel.


## pbp-status.sh

Shows CPU frequency, online/offline status (the 0/1 after the CPU number), current frequency, current governor, the two temperature zones, and power stats (if you're on the battery - you only get voltage if charging).

You might want to do something like ```watch -n 1 ./pbp-status.sh```

```
CPU0: 0 Freq: 408 MHz	(schedutil)
CPU1: 0 Freq: 408 MHz	(schedutil)
CPU2: 0 Freq: 408 MHz	(schedutil)
CPU3: 0 Freq: 408 MHz	(schedutil)
CPU4: 1 Freq: 2000 MHz	(schedutil)
CPU5: 1 Freq: 2100 MHz	(schedutil)

Temp 0: 40
Temp 1: 40

Voltage: 4151 mV
Current: 978 mA
Power:   4059 mW
```
