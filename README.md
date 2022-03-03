# AutoSaver

AutoSaves a window of your choice as often as you'd like. 

## Hotkeys
* Alt + C to Change the target window to the focused window.
* Alt + X to Exit the script.

## Startup
* [Download AHK](https://www.autohotkey.com/download/?)
* Edit the global variables to your preferences
    
    * **targetWindowTitle** - This can be hardcoded, alternatively you can use the hotkey combo Alt + C to set the window on startup.
    * **saveFrequency** - Number of seconds between auto saves.
    * **idleThreshold** - Number of milliseconds needed of no mouse and keyboard input before the script sends Ctrl + S to save the window. This prevents the hotkey from interfering with your work.

* Double click AutoSaver.ahk file to start the script
* Press Alt + C to start auto saving the current window if no targetWindowTitle is  hardcoded.
