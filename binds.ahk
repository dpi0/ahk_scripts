SetNumlockState, AlwaysOn
; Capslock to Esc
F10:: Esc 

^+g:: Run, "firefox" -P guest
#z:: Run taskmgr.exe
#Left:: #^Left
#Right:: #^Right
;#b::ShowBatteryLevel()
#+q::DisplayWindowTitle()
!+F4::CloseAllWindows()
#^w::ToggleWindowOnTop()
#u:: run %A_ScriptDir%\url_shortener.ahk
#h::ToggleHiddenFiles()
#y::ToggleFileExtensions("HideFileExt", "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced")

#e::OpenProgram("ahk_class CabinetWClass", "explorer.exe")
#s::OpenProgram("1.5a", "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Everything 1.5a.lnk")

;::gh::github
;::rd::reddit
;::tt::tutorial

;!x::OpenWebsite("https://www.google.com/search?q=" Clipboard)

!End::DllCall("PowrProf\SetSuspendState", "Int", 1, "Int", 0, "Int", 0) ; Hibernate
#^End::shutdown, 1 ; Shutdown
#+End::shutdown, 2 ; Restart
#End::DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0) ; Sleep

Numpad0:: !Tab
;----------------------------------------------------------------------------
Numpad1:: Send {Volume_Down}
Numpad2:: Send {Media_Play_Pause}
Numpad3:: Send {Volume_Up}
Numpad4:: Send {Media_Prev}
Numpad6:: Send {Media_Next} 
Numpad7:: #^Left
Numpad8:: #Tab
Numpad9:: #^Right
NumpadAdd:: Run "S:\windows-apps\nirsoft-apps\nircmd\nircmd.exe" changebrightness +5
NumpadEnter:: Run "S:\windows-apps\nirsoft-apps\nircmd\nircmd.exe" changebrightness -5

; NOTE: if want to use application specific binds, then always put them at the bottom of this file (until i find a better solution)