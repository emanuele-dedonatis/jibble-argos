#!/usr/bin/env bash

user=$(cat ~/.config/argos/jibble/user.txt)
password=$(cat ~/.config/argos/jibble/password.txt)
login_data=($(~/.config/argos/jibble/Login.sh $user $password))

session_token="${login_data[0]}"
user_id="${login_data[1]}"

company_id=$(~/.config/argos/jibble/Company.sh $session_token $user_id)
person_data=($(~/.config/argos/jibble/Person.sh $session_token $company_id))

last_action=${person_data[0]}
team_member_id=${person_data[1]}

total=$(~/.config/argos/jibble/Total.sh $session_token $team_member_id)

if [ $last_action -eq 1 ]; then
	echo "$total|iconName=user-available"
	# echo "---"
	# echo "jibble OUT | bash='~/.config/argos/jibble/JibbleOut.sh "$session_token"' terminal=false"
elif [ $last_action -eq 2 ]; then
	echo "$total|iconName=media-record"
	# echo "---"
	# echo "jibble IN | bash='~/.config/argos/jibble/JibbleIn.sh "$session_token"' terminal=false"
else
	echo "|iconName=user-idle"
fi
