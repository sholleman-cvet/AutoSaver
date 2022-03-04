SendMode, Input 
SetTitleMatchMode, 3 
SetWorkingDir, A_ScriptDir

; Globals
IniRead, targetWindowTitle, AutoSaver.ini, Config, targetWindowTitle, %A_SPACE%
IniRead, saveFrequency, AutoSaver.ini, Config, saveFrequency, 300
IniRead, idleThreshold, AutoSaver.ini, Config, idleThreshold, 300
secondsSinceSave := 0 ; Seconds since last save, don't change this value

While (true) {	
	While (WinActive(targetWindowTitle)) {
		Sleep, 1000
		secondsSinceSave += 1
		If ((secondsSinceSave >= saveFrequency) && (A_TimeIdlePhysical > idleThreshold)) {
			SendInput, ^s
			secondsSinceSave := 0
		}
	}
	Sleep, 100
}

; Hotkeys
; Alt + C will make the current active window the new target window for auto save
!c:: 
WinGetTitle, targetWindowTitle, A 
MsgBox, Target Window: %targetWindowTitle% 
Return

; Alt + V shows values of each variable
!v::
MsgBox,
(LTrim
	Target Window: %targetWindowTitle%
	Seconds Since Save: %secondsSinceSave%
	Save Frequency: %saveFrequency%
	Idle Threshold: %idleThreshold%
)
Return

; Alt + X to exit script
!x:: 
ExitApp