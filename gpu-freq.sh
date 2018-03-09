#! /bin/bash 
# use su for all

# display info for intel gpu
clear
echo gt_act_freq_mhz & cat /sys/class/drm/card0/gt_act_freq_mhz
echo gt_cur_freq_mhz & cat /sys/class/drm/card0/gt_cur_freq_mhz
echo gt_max_freq_mhz & cat /sys/class/drm/card0/gt_max_freq_mhz
echo gt_min_freq_mhz & cat /sys/class/drm/card0/gt_min_freq_mhz
echo gt_RP0_freq_mhz & cat /sys/class/drm/card0/gt_RP0_freq_mhz
echo gt_RP1_freq_mhz & cat /sys/class/drm/card0/gt_RP1_freq_mhz
echo gt_RPn_freq_mhz & cat /sys/class/drm/card0/gt_RPn_freq_mhz

# kernel settings
# cat /sys/kernel/debug/dri/0/i915_frequency_info
echo kernel i915_max_freq & cat /sys/kernel/debug/dri/0/i915_max_freq
echo kernel i915_min_freq & cat /sys/kernel/debug/dri/0/i915_min_freq

