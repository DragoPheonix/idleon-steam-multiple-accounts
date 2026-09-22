Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account3""", 1, False
