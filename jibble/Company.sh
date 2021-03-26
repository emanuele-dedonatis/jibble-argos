#!/usr/bin/env bash

response=$(curl --silent --request POST 'https://api.jibble.io/api/v1/functions/fetchRelatedCompanies' \
--header 'Content-Type: application/json' \
--data-raw '{
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_SessionToken":'$1',
  "userId":'$2'
}')

company_id=$(echo $response | jq '.result.team_member[0].objectId')

echo $company_id
