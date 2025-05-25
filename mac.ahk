#Requires AutoHotkey v2.0
#SingleInstance

; Set default send mode to more reliable input mode
SendMode "Input"

; Add DLL function definitions at the top
#DllLoad "user32.dll"

; -------------------------
; Mac-style Shortcut Remaps
; -------------------------     

; All hotkeys below are DISABLED when a window with 'Dev-Mac-Mini' in its title is active (e.g., Jump Desktop remote session)
#HotIf !WinActive("Dev-Mac-Mini")

; Test shortcut to verify script is running (Win+P shows a message)
; #p::MsgBox "✅ Mac-style hotkeys enabled on Windows"

; Show Start menu
#!d::Send "^{Escape}"
#Space::Send "^{Escape}"  ; Alternative shortcut for Start menu

; Window Management
^!Left::  ; Snap to left half
{
    SetKeyDelay 50
    SendEvent "{LWin Down}"
    SendEvent "{Left}"
    SendEvent "{LWin Up}"
}

^!Right::  ; Snap to right half
{
    SetKeyDelay 50
    SendEvent "{LWin Down}"
    SendEvent "{Right}"
    SendEvent "{LWin Up}"
}

^!Enter::  ; Toggle maximize
{
    activeWindow := WinExist("A")
    if WinGetMinMax(activeWindow) = 1  ; If maximized
        WinRestore activeWindow        ; Restore window
    else
        WinMaximize activeWindow      ; Maximize window
}

; New Tab
#t::^t

; Various Rider shortcuts
Hotkey "#+NumpadAdd", (*) => Send("^+{NumpadAdd}")

; Copy / Paste / Cut
#c::^c  ; Use native Windows shortcut
#+c::^+c  ; Copy with formatting
#v::^v
#x::^x

; Undo / Redo
#z::^z
#+z::^y

; Select All / Save / Find / Refresh
#a::^a
#s::^s
#f::^f

; Refresh (Win+R for single refresh, double Win+R for double refresh)
#r::^r

; Close window (Cmd+W or Cmd+Q)
#w::^w  ; Close tab instead of window
#q::!F4

; Map Win+L to Ctrl+L
#l::^l

; Map Command+Left Click to Ctrl+Left Click
#LButton::Send "{Ctrl down}{LButton down}{LButton up}{Ctrl up}"

; Reverse scroll wheel direction (natural scrolling like macOS)
; WheelDown::Send "{WheelUp}"
; WheelUp::Send "{WheelDown}"

; Word/line navigation (Cmd + Arrows)
#Left::^Left
#Right::^Right
#Up::^Up
#Down::^Down

; Word navigation with Alt (Option) key
!Left::^Left
!Right::^Right
!+Left::^+Left  ; Select word by word to the left
!+Right::^+Right  ; Select word by word to the right

; Home/End keys to match macOS behavior
+Home::Send "+{Home}"  ; Select to beginning of line
+End::Send "+{End}"     ; Select to end of line

; App switcher: Hold Win + Tap Tab to cycle, release Win to select
#Tab::
{
    Send("{Alt down}{Tab}")
    Loop
    {
        if not GetKeyState("LWin", "P")
            break
        Sleep(10)
    }
    Send("{Alt up}")
}

; Reverse app switcher with Shift
#+Tab::
{
    Send("{Alt down}{Shift down}{Tab}")
    Loop
    {
        if not GetKeyState("LWin", "P")
            break
        Sleep(10)
    }
    Send("{Shift up}{Alt up}")
}

; Switch windows in same app (Cmd + `)
#SC029::Send "^{Tab}"  ; SC029 is the scan code for the backtick/grave accent key

; Screenshot area selection (like Cmd+Shift+5)
#+5::Send "#+s"  ; Windows key + Shift + S is Windows' built-in screenshot tool

#HotIf  ; End context sensitivity
