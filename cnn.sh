#!/bin/bash
set -e
curl -s --retry-all-errors --retry 3 --retry-delay 5 -X GET "https://search.api.cnn.io/content?q&from=0&size=6&page=1&sort=newest&types=article&section="  -H  "accept: application/json" -o /tmp/cnn.json
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
# echo $DIR
# echo -e $(date)  - CNN update >> ${DIR}/cnn.log
exit



# https://search.api.cnn.io/content?q=&from=0&sort=newest&type=article&section=us,buisness,politics,sports,entertainment,health,science,world&size=8
# "https://search.api.cnn.io/content?q=&from=0&sort=newest&type=article&category=us,business,politics,markets,world,health,sports&size=8"
# https://search.api.cnn.io/content?q&from=0&size=10&page=1&sort=newest&types=article&section=
# https://www.cnn.com/search?q=&from=0&size=10&page=1&sort=newest&types=article&section=


# https://search.api.cnn.io/content?q=*&from=0&size=2&page=1&sort=newest&types=article&category=business
