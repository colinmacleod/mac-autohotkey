# Mac-Style Shortcuts for Windows

This AutoHotkey v2 script brings macOS-style keyboard shortcuts to Windows, making it easier for Mac users to work in Windows. It's specifically designed for use with a standard Windows/PC keyboard layout, not an Apple keyboard.

## Important Note About Keyboard Layout
This script assumes you're using a standard Windows keyboard where:
- You have a Windows key (which this script uses as the Command/⌘ equivalent)
- You have Alt keys (used as Option/⌥)
- You have a standard Windows keyboard layout

If you're using an Apple keyboard with Windows, this script may not be suitable as the key positions will be different.

## Features

### Basic Mac Shortcuts (using Windows key as ⌘)
- `Win + C`: Copy (maps to Ctrl + C)
- `Win + V`: Paste (maps to Ctrl + V)
- `Win + X`: Cut (maps to Ctrl + X)
- `Win + Z`: Undo (maps to Ctrl + Z)
- `Win + Shift + Z`: Redo (maps to Ctrl + Y)
- `Win + A`: Select All (maps to Ctrl + A)
- `Win + S`: Save (maps to Ctrl + S)
- `Win + F`: Find (maps to Ctrl + F)
- `Win + T`: New Tab (maps to Ctrl + T)

### Text Navigation and Selection
- `Win + Left/Right`: Move cursor to start/end of line (maps to Ctrl + Left/Right)
- `Win + Up/Down`: Move cursor to start/end of document (maps to Ctrl + Up/Down)
- `Alt + Left/Right`: Move cursor by word (maps to Ctrl + Left/Right)
- `Shift + Alt + Left/Right`: Select text by word
- Hold `Shift` with any of the above to select text

### Window Management
- `Ctrl + Alt + Left`: Snap window to left half of screen
- `Ctrl + Alt + Right`: Snap window to right half of screen
- `Ctrl + Alt + Enter`: Toggle window maximize/restore

### App Switching
- `Win + Tab`: App switcher (like macOS Cmd + Tab)
- `Win + Shift + Tab`: Reverse app switcher
- `Win + \``: Switch between windows of the same app

### Additional Features
- `Ctrl + Alt + D`: Show Start menu (similar to showing Dock in macOS)
- Windows key alone won't open Start menu (like Cmd key on Mac)
- Preserves Win + Tab functionality for Windows task view

## Requirements
- Windows 10 or 11
- [AutoHotkey v2](https://www.autohotkey.com/)
- A standard Windows/PC keyboard layout

## Installation
1. Install AutoHotkey v2 from [autohotkey.com](https://www.autohotkey.com/)
2. Download `mac.ahk` from this repository
3. Double-click `mac.ahk` to run the script
4. (Optional) Place a shortcut to the script in your Windows Startup folder to run automatically on boot

## Notes
- The script uses the Windows key as a Command (⌘) key equivalent
- Some shortcuts might conflict with existing Windows shortcuts
- The script preserves important Windows functionality like Win + Tab for task view
- This script is NOT designed for Apple keyboards - it's for Windows/PC keyboards only

## Contributing
Feel free to submit issues or pull requests if you have suggestions for improvements or additional Mac-style shortcuts.

## License
MIT License - feel free to modify and share! 
