#!/usr/bin/env bash

response=$(curl --silent --request GET 'https://api.jibble.io/api/v1/classes/Person' \
--header 'Content-Type: application/json' \
--data-raw '{
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_SessionToken":'$1',
  "where":{
    "company":{
      "__type":"Pointer",
      "className":"Company",
      "objectId":'$2'
    }
  },
  "include":"position",
  "limit":1
}')

last_action=$(echo $response | jq '.results[0].lastAction')
team_member_id=$(echo $response | jq '.results[0].objectId')

data=($last_action $team_member_id)

echo ${data[@]}
