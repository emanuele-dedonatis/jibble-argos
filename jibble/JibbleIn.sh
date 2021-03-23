curl --location --request POST 'https://api.jibble.io/api/v1/classes/TimeEntry' \
--header 'Content-Type: application/json' \
--data-raw '{
  "date":{
    "__type":"Date",
    "iso":"2020-04-24T11:51:22.663Z"
  },
  "meta":{
    "app":"web",
    "appVer":"1.37.0.09b1711"
  },
  "action":1,
  "person":{
    "__type":"Pointer",
    "className":"Person",
    "objectId":"3yRMv6keMHhtJDsU"
  },
  "notes":null,
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_ClientVersion":"js2.7.1",
  "_InstallationId":"0133685a-c9fc-8e0c-0787-5ea6ba00adfd",
  "_SessionToken":"'$1'"
}'
