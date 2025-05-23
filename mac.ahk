#Requires AutoHotkey v2.0
#SingleInstance

; Set default send mode to more reliable input mode
SendMode "Input"

; -------------------------
; Mac-style Shortcut Remaps
; -------------------------     

; Test shortcut to verify script is running (Win+P shows a message)
#p::MsgBox "✅ Mac-style hotkeys enabled on Windows"

; Show Start menu
^!d::Send "^{Escape}"
#Space::Send "^{Escape}"  ; Alternative shortcut for Start menu

; Window Management
^!Left::  ; Snap to left half
{
    activeWindow := WinExist("A")
    if WinGetMinMax(activeWindow) = 1  ; If maximized
        WinRestore activeWindow        ; Restore before moving
    MonitorGetWorkArea(, &left, &top, &right, &bottom)
    width := (right - left) // 2
    WinMove left, top, width, bottom - top, activeWindow
}

^!Right::  ; Snap to right half
{
    activeWindow := WinExist("A")
    if WinGetMinMax(activeWindow) = 1  ; If maximized
        WinRestore activeWindow        ; Restore before moving
    MonitorGetWorkArea(, &left, &top, &right, &bottom)
    width := (right - left) // 2
    WinMove left + width, top, width, bottom - top, activeWindow
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
#r::^r  ; Refresh (Cmd+R)

; Close window (Cmd+W or Cmd+Q)
#w::!F4
#q::!F4

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
