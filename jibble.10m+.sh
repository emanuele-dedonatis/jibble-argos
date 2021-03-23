#!/usr/bin/env bash

user=$(cat ~/.config/argos/jibble/user.txt)
password=$(cat ~/.config/argos/jibble/password.txt)
sessionToken=$(~/.config/argos/jibble/Login.sh $user $password)
lastAction=$(~/.config/argos/jibble/LastAction.sh $sessionToken)
teamMemberId=$(~/.config/argos/jibble/TeamMemberId.sh $sessionToken)
total=$(~/.config/argos/jibble/Total.sh $sessionToken $teamMemberId)

if [ ${lastAction} = 1 ]; then
	echo "$total|iconName=user-available"
	echo "---"
	echo "jibble OUT | bash='~/.config/argos/jibble/JibbleOut.sh "$sessionToken"' terminal=false"
elif [ ${lastAction} = 2 ]; then
	echo "$total|iconName=media-record"
	echo "---"
	echo "jibble IN | bash='~/.config/argos/jibble/JibbleIn.sh "$sessionToken"' terminal=false"
else
	echo "|iconName=user-idle"
fi
