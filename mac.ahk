#Requires AutoHotkey v2.0
#SingleInstance

; -------------------------
; Mac-style Shortcut Remaps
; -------------------------     

; Variables to track key state
startMenuSuppressed := false

; Block Windows key from opening Start menu while preserving Win+Tab
~LWin::
{
    startMenuSuppressed := true
    SetTimer () => startMenuSuppressed := false, -300
    if GetKeyState("Tab")
        return
    Send "{Escape}"
}
~RWin::
{
    startMenuSuppressed := true
    SetTimer () => startMenuSuppressed := false, -300
    if GetKeyState("Tab")
        return
    Send "{Escape}"
}

; Show Start menu
^!d::Send "^{Escape}"

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
#c::^c
#v::^v
#x::^x

; Undo / Redo
#z::^z
#+z::^y

; Select All / Save / Find
#a::^a
#s::^s
#f::^f

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

; Switch windows in same app (Cmd + `) → Alt + Esc
#`::!Esc

; Optional: show message that script is running
#p::MsgBox "✅ Mac-style hotkeys enabled on Windows"
