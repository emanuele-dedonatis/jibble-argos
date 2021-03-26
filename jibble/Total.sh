#!/usr/bin/env bash

response=$(curl --silent --request POST 'https://api.jibble.io/api/v1/functions/startTeamMemberReport' \
--header 'Content-Type: application/json' \
--data-raw '{
  "from": "'$(date -dlast-monday +%Y-%m-%d)'",
  "teamMemberId":'$2',
  "to": "'$(date -dnext-sunday +%Y-%m-%d)'",
  "tz": "Europe/Madrid",
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_SessionToken":'$1'
}')
jobId=$( jq -r  '.result.jobId' <<< "${response}")

done=false
i=0
while [  "$done" != "true" -a "$i" -lt 5 ]
do
  sleep 1
  response=$(curl --silent --request POST 'https://api.jibble.io/api/v1/functions/fetchReportResult' \
  --header 'Content-Type: application/json' \
  --data-raw '{
    "jobId":"'$jobId'",
    "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
    "_SessionToken":'$1'
  }')
  done=$( jq -r  '.result.done' <<< "${response}")
  i=$((i+1))
done
totals=($( jq -r  '.result.data.totals' <<< "${response}"  | tr -d '[]," '))

echo "$(date -d@${totals[0]} -u +%H:%M) $(date -d@${totals[1]} -u +%H:%M) $(date -d@${totals[2]} -u +%H:%M) $(date -d@${totals[3]} -u +%H:%M) $(date -d@${totals[4]} -u +%H:%M)"