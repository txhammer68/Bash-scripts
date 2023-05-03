#!/bin/bash
# root kit hunter
rkhunter --update
rkhunter --quiet --summary --report-warnings-only --noappend-log --unlock --check  --tmpdir /Data/temp > /var/log/rkhunter.log
