#!/bin/bash

# Rocket.Chat incoming web-hook URL
url='https://rocket.chat/hooks/...'

## Values received by this script:
# Subject = $1 {ALERT.SUBJECT}
# Message = $2 {ALERT.MESSAGE}

subject="$1"

# create message from subject and message
message="${subject}: $2"

# build JSON
json="{\"text\": \"${message//\"/\\\"}\"}"

# send it as a POST request to the Rocket.Chat incoming web-hook URL
curl -X POST -H 'Content-Type: application/json' --data "$json" $url
