#!/usr/bin/env bash

response=$(curl --location --request POST 'https://api.jibble.io/api/v1/classes/Person' \
--header 'Content-Type: application/json' \
--data-raw '{
  "where":{
    "company":{
      "__type":"Pointer",
      "className":"Company",
      "objectId":"RPrDPR2o2uZQNMJP"
    }
  },
  "include":"position",
  "limit":1,
  "_method":"GET",
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_ClientVersion":"js2.7.1",
  "_InstallationId":"0133685a-c9fc-8e0c-0787-5ea6ba00adfd",
  "_SessionToken":'$1'
}')

echo $response | jq '.results[0].lastAction'
