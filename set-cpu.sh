#!/bin/bash
cpufreq-set -r -g ondemand
cpufreq-set -c0 -d 1600000
cpufreq-set -c1 -d 1600000
cpufreq-set -c2 -d 1600000
cpufreq-set -c3 -d 1600000
cpufreq-set -c0 -u 4200000
cpufreq-set -c1 -u 4200000
cpufreq-set -c2 -u 4200000
cpufreq-set -c3 -u 4200000
