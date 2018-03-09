#!/bin/bash
    # ls /sys/class/hwmon/ -al
    in0=$(cat /sys/class/hwmon/hwmon1/in0_input)
    cpu0=$(cat /sys/class/hwmon/hwmon0/device/hwmon/hwmon0/temp2_input|cut -c1,2)
    cpu1=$(cat /sys/class/hwmon/hwmon0/device/hwmon/hwmon0/temp3_input|cut -c1,2)
    cpu2=$(cat /sys/class/hwmon/hwmon0/device/hwmon/hwmon0/temp4_input|cut -c1,2)
    cpu3=$(cat /sys/class/hwmon/hwmon0/device/hwmon/hwmon0/temp5_input|cut -c1,2)
    fan1=$(cat /sys/class/hwmon/hwmon1/pwm1)
    fan3=$(cat /sys/class/hwmon/hwmon1/pwm3)
    fan4=$(cat /sys/class/hwmon/hwmon1/pwm4)
    fan5=$(cat /sys/class/hwmon/hwmon1/pwm5)
    FAN1=$(cat /sys/class/hwmon/hwmon1/fan1_input)
    FAN3=$(cat /sys/class/hwmon/hwmon1/fan3_input)
    FAN4=$(cat /sys/class/hwmon/hwmon1/fan4_input)
    FAN5=$(cat /sys/class/hwmon/hwmon1/fan5_input)
    hdd=$(sudo hddtemp /dev/sdb | cut -c31-32)
    echo 
    echo "CPU  : $cpu0/$cpu1/$cpu2/$cpu3 °C @ $(echo "scale=4; $in0/1000"|bc -l) volts"
    echo "HSF  : $FAN5/$FAN4 RPM [$fan5/$fan4] (120mm/80mm)"
    echo "Top  : $FAN3 RPM [$fan3]"
    echo "Rear : $FAN1 RPM [$fan1]"
    echo "HDD  : $hdd °C"
