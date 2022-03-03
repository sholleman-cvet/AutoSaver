SendMode, Input 
SetTitleMatchMode, 3 
SetWorkingDir, A_ScriptDir

; Globals
IniRead, targetWindowTitle, AutoSaver.ini, Config, targetWindowTitle, %A_SPACE%
IniRead, saveFrequency, AutoSaver.ini, Config, saveFrequency, 300
IniRead, idleThreshold, AutoSaver.ini, Config, idleThreshold, 300
secondsSinceSave := 0 ; Seconds since last save, don't change this value

; Hotkeys
; Alt + C will make the current active window the new target window for auto save
!c:: 
WinGetTitle, targetWindowTitle, A 
MsgBox, Target Window: %targetWindowTitle% 
Return

; Alt + X to exit script
!x:: 
ExitApp

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

