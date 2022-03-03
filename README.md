# AutoSaver

Auto saves a window of your choosing once it has been focused for a certain amount of time. 



# Getting Started
## Prerequisites
* [AutoHotkey](https://www.autohotkey.com/download/?)

## Hotkeys
* Alt + C to Change the target window to the focused window.
* Alt + X to Exit the script.


## Usage
* Edit the global variables in AutoSaver.ahk to your preferences
    
    * **targetWindowTitle** - This can be hardcoded, alternatively you can use the hotkey combo Alt + C to set the target window to the current active window.
    * **saveFrequency** - Seconds between auto saves. The target window must be focused for this amount of time, when a different window takes focus the time pauses until the target window is refocused.
    * **idleThreshold** - Milliseconds needed of no mouse and keyboard input before the script sends Ctrl + S to try and avoid interfering with your work.  

* Double click AutoSaver.ahk file to start the script  
* If you haven't hardcoded a targetWindowTitle or if you need to change the targetWindowTitle, then focus the new target window and press Alt + C.
* **Note**: If you rename a file after setting it as the target file, use Alt + C again to update the targetWindowTitle. e.g. setting the target file to "Untitled - Notepad" and then saving the notepad file will stop the auto save as "Untitled - Notepad" stops being the active window.

