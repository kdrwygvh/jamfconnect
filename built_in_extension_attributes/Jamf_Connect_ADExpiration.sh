#!/bin/bash
# Displays the value of the ADExpiration attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

ADExpiration=$(/usr/libexec/PlistBuddy -c "Print :ADExpiration" $jamfConnectStateLocation || echo "Does not exist")
echo "ADExpiration"
echo "<result>$ADExpiration</result>"
