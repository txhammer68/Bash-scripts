#!/bin/bash
set -e
curl -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.weather.com/v3/wx/observations/current?language=en-US&apiKey=71f92ea9dd2f4790b92ea9dd2f779061&geocode=29.668,-95.069&units=e&format=json" -H  "accept: application/json" -o /tmp/current.json
curl  -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.weather.com/v3/wx/forecast/daily/5day?language=en-US&apiKey=71f92ea9dd2f4790b92ea9dd2f779061&geocode=29.668,-95.069&units=e&format=json" -H  "accept: application/json" -o /tmp/forecast.json
curl -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://api.weather.com/v3/alerts/headlines?geocode=29.668,-95.068&format=json&language=en-US&apiKey=71f92ea9dd2f4790b92ea9dd2f779061" -H  "accept: application/json" -o /tmp/warnings.json
cd /tmp
jq -n 'reduce inputs as $s (.; (.[input_filename|rtrimstr(".json")]) += $s)' current.json forecast.json warnings.json >/tmp/weather.json
rm current.json
rm forecast.json
rm warnings.json
exit


# 71f92ea9dd2f4790b92ea9dd2f779061
# 71f92ea9dd2f4790b92ea9dd2f779061

# URL=https://api.weather.com/v3/aggcommon/v3-wx-observations-current;v3-wx-forecast-daily-15day;v3alertsHeadlines;v3-location-point;v3-wx-forecast-hourly-12hour?format=json&geocode=#Latitude#,#Longitude#&units=#Units#&language=#Language#&apiKey=#APIKey#
