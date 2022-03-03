; This script auto saves your work for you.
; It counts how many seconds the target window is active/focused and will save your work 
; when that number reaches the seconds you set in the saveFrequency variable,
; however it will wait until you have stopped interacting with your mouse 
; and keyboard for the miliseconds you set in idleThreshold variable
; before sending ctrl + s to avoid interfering with your work.

SendMode, Input ; https://www.autohotkey.com/docs/commands/SendMode.htm
SetTitleMatchMode, 3 ; https://www.autohotkey.com/docs/commands/SetTitleMatchMode.htm

targetWindowTitle = "" ; name of window to auto save. Hardcode it or use the hotkey below to set this to the current window
saveFrequency := 10 ; seconds between auto saves
idleThreshold := 300 ; miliseconds keyboard/mouse need to be idle for the script to send ctrl + s to save 
secondsSinceSave := 0 ; seconds since last save, don't change this value

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



