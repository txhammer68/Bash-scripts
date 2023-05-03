#!/bin/bash
set -e
curl -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.weather.com/v3/wx/observations/current?language=en-US&apiKey=d7adbfe03bf54ea0adbfe03bf5fea065&geocode=29.668,-95.069&units=e&format=json" -H  "accept: application/json" -o /tmp/weather.json >/dev/null
curl  -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.weather.com/v3/wx/forecast/daily/5day?language=en-US&apiKey=d7adbfe03bf54ea0adbfe03bf5fea065&geocode=29.668,-95.069&units=e&format=json" -H  "accept: application/json" -o /tmp/forecast.json >/dev/null
curl -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.weather.com/v3/alerts/headlines?geocode=29.668,-95.068&format=json&language=en-US&apiKey=d7adbfe03bf54ea0adbfe03bf5fea065" -H  "accept: application/json" -o /tmp/warnings.json >/dev/null
exit
