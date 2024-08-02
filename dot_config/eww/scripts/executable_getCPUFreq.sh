#!/usr/bin/env bash

total_freq=0
num_cores=0

for cpu in /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_cur_freq; do
    freq=$(cat "$cpu")
    total_freq=$((total_freq + freq))
    num_cores=$((num_cores + 1))
done

echo $(((total_freq / num_cores) / 1000))
