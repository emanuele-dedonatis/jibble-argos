#!/usr/bin/env bash

response=$(curl --location --request POST 'https://api.jibble.io/api/v1/functions/logInUser' \
--header 'Content-Type: application/json' \
--data-raw '{
  "username":"'$1'",
  "password":"'$2'",
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_ClientVersion":"js2.7.1",
  "_InstallationId":"0133685a-c9fc-8e0c-0787-5ea6ba00adfd"
}')

echo $response | jq '.result.sessionToken'
