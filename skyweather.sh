#!/bin/bash
set -e
curl  -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.darksky.net/forecast/522dc5d7c682775779e3e83d68fd0161/29.6915,-95.0474?exclude=minutely,flags" -H  "accept: application/json" -o /tmp/weather.json
exit
