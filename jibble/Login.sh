#!/usr/bin/env bash

response=$(curl --silent --request POST 'https://api.jibble.io/api/v1/functions/logInUser' \
--header 'Content-Type: application/json' \
--data-raw '{
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "username":"'$1'",
  "password":"'$2'"
}')

session_token=$(echo $response | jq '.result.sessionToken')
user_id=$(echo $response | jq '.result.objectId')

data=($session_token $user_id)

echo ${data[@]}

