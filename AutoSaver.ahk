SendMode, Input 
SetTitleMatchMode, 3 

IniRead, targetWindowTitle, AutoSaver.ini, Config, targetWindowTitle, %A_SPACE%
IniRead, saveFrequency, AutoSaver.ini, Config, saveFrequency, 300
IniRead, idleThreshold, AutoSaver.ini, Config, idleThreshold, 300
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

!c:: ; alt + c will make the current active window the new target window for auto save
WinGetTitle, targetWindowTitle, A 
MsgBox, Target Window: %targetWindowTitle% 
return

!x:: ; alt + x to exit script
ExitApp