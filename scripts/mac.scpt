#!/usr/bin/env osascript
global frontApp, frontAppName, windowTitle
set windowTitle to ""
set processId to 0
tell application "System Events"
	set frontApp to first application process whose frontmost is true
	set frontAppName to name of frontApp
	set processId to unix id of frontApp
	tell process frontAppName
		tell (1st window whose value of attribute "AXMain" is true)
			set windowTitle to value of attribute "AXTitle"
		end tell
	end tell
end tell
return {frontAppName,windowTitle,processId}
