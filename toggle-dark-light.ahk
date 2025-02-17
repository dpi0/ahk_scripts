#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; https://stackoverflow.com/questions/32397032/run-a-powershell-command-through-autohotkey-script
; https://helpdeskgeek.com/windows-10/how-to-automatically-toggle-dark-light-modes-on-windows-10/
psScript =
(
    param($flagLightMode)
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value $flagLightMode -Type Dword -Force
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value $flagLightMode -Type Dword -Force
)

; Windows + Shift + d
#+d::
RunWait PowerShell.exe -Command &{%psScript%} '0',, hide
RunWait wsl.exe --exec bash /home/wsl/workspace/infrastructure/homedirs/common/bin/background dark,, hide
return

; Windows + Shift + l
#+l::
RunWait PowerShell.exe -Command &{%psScript%} '1',, hide
RunWait wsl.exe --exec bash /home/wsl/workspace/infrastructure/homedirs/common/bin/background light,, hide
return

; New toggle hotkey: Windows + t
#t::
    ; Read current theme mode from registry
    RegRead, currentMode, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize, AppsUseLightTheme
    if (currentMode = 1)  ; if currently light mode...
    {
        ; Switch to dark mode (value 0)
        RunWait PowerShell.exe -Command &{%psScript%} '0',, hide
        RunWait wsl.exe --exec bash /home/wsl/workspace/infrastructure/homedirs/common/bin/background dark,, hide
    }
    else  ; Otherwise (assumed dark mode), switch to light mode (value 1)
    {
        RunWait PowerShell.exe -Command &{%psScript%} '1',, hide
        RunWait wsl.exe --exec bash /home/wsl/workspace/infrastructure/homedirs/common/bin/background light,, hide
    }
return