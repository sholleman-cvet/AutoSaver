SendMode, Input ; https://www.autohotkey.com/docs/commands/SendMode.htm
SetTitleMatchMode, 3 ; https://www.autohotkey.com/docs/commands/SetTitleMatchMode.htm

; globals
targetWindowTitle = "" ; Name of window to auto save. If hardcoding a value, know difference between := and = operators. See https://www.autohotkey.com/docs/Variables.htm#Intro
saveFrequency := 300 ; Seconds between auto saves
idleThreshold := 300 ; Miliseconds keyboard/mouse need to be idle for the script to send ctrl + s to save 
secondsSinceSave := 0 ; Seconds since last save, don't change this value

While (true) {	
	While (WinActive(targetWindowTitle)) {
		If ((secondsSinceSave >= saveFrequency) && (A_TimeIdlePhysical > idleThreshold)) {
			SendInput, ^s
			secondsSinceSave := 0
		}
		Sleep, 1000
		secondsSinceSave += 1
	}
	Sleep, 1000
}

; alt + c will make the current active window the new target window for auto save
!c::
WinGetTitle, targetWindowTitle, A 
return

; alt + x to exit script
!x::ExitApp



