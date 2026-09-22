Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account1""", 1, False

WScript.Sleep 5000

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account2""", 1, False
