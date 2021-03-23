#!/usr/bin/env bash

response=$(curl --location --request POST 'https://api.jibble.io/api/v1/functions/startTeamMemberReport' \
--header 'Content-Type: application/json' \
--data-raw '{
  "from": "'$(date -dlast-monday +%Y-%m-%d)'",
  "teamMemberId": '$2',
  "to": "'$(date -dnext-sunday +%Y-%m-%d)'",
  "tz": "Europe/Madrid",
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_ClientVersion":"js2.7.1",
  "_InstallationId":"0133685a-c9fc-8e0c-0787-5ea6ba00adfd",
  "_SessionToken":'$1'
}')
jobId=$( jq -r  '.result.jobId' <<< "${response}")

response=$(curl --location --request POST 'https://api.jibble.io/api/v1/functions/fetchReportResult' \
--header 'Content-Type: application/json' \
--data-raw '{
  "jobId":"'$jobId'",
  "_ApplicationId":"EdVXcwrUCkJu2T2mUfAgzemvSDDxYqDLECvx24Wk",
  "_ClientVersion":"js2.7.1",
  "_InstallationId":"0133685a-c9fc-8e0c-0787-5ea6ba00adfd",
  "_SessionToken":'$1'
}')
totals=($( jq -r  '.result.data.totals' <<< "${response}"  | tr -d '[]," '))

$sum
for i in "${totals[@]}"
do
	sum=$(($sum+$i))
done
echo $(date -d@$sum -u +%H:%M)
