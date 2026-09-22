# Fast Setup — Legends of IdleOn Multiple Accounts

This page is the **quick-start version** of the full guide in [README.md](README.md).

Use this when you already know the basics and just want to set up multiple accounts quickly.

> This guide uses placeholders only. Replace `C:\PATH\TO\LegendsOfIdleon.exe` with the real location of your game's executable.

## Before You Use This

> **Important:** This setup has been tested only with the **Google Sign-In** method; other sign-in methods have not been verified and may behave differently.

This project has not verified whether the developers of Legends of IdleOn officially allow or support this multiple-account method. Review the game's current rules and Terms of Service yourself, use the setup at your own risk, and expect compatibility to change after updates.

See the [Google Sign-In testing disclaimer](google-signin-testing-disclaimer.md) for the complete testing limitation.

## What you need

- Windows 10 or Windows 11
- Steam version of Legends of IdleOn
- The full path to `LegendsOfIdleon.exe`

## 1. Find the game EXE

In Steam:

**Library → Legends of IdleOn → Manage → Browse local files**

Find:

`LegendsOfIdleon.exe`

Copy its full path.

Example:

`C:\SteamLibrary\steamapps\common\Legends of IdleOn\LegendsOfIdleon.exe`

Your path will be different.

## 2. Create the account profiles

Open **PowerShell** and copy/paste:

```powershell
New-Item -ItemType Directory -Force -Path "$env:APPDATA\IdleOn-Account1"
New-Item -ItemType Directory -Force -Path "$env:APPDATA\IdleOn-Account2"
```

## 3. Create the two launchers

Open Notepad or Notepad++.

### Account 1

Paste:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account1""", 1, False
```

Save as:

`IdleOn - Account 1.vbs`

### Account 2

Paste:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account2""", 1, False
```

Save as:

`IdleOn - Account 2.vbs`

### Important

In **both files**, replace:

`C:\PATH\TO\LegendsOfIdleon.exe`

with the actual path to your `LegendsOfIdleon.exe`.

Do not change the `--user-data-dir` values.

## 4. Log into each account once

Close Legends of IdleOn completely.

Run:

`IdleOn - Account 1.vbs`

Log into the first account, let it load, then close the game.

Run:

`IdleOn - Account 2.vbs`

Log into the second account, let it load, then close the game.

## 5. Make a one-click launcher for both

Create another VBS file with:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account1""", 1, False

WScript.Sleep 5000

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account2""", 1, False
```

Save it as:

`IdleOn - Both Accounts.vbs`

Double-click this file whenever you want to start both accounts.

## 6. Add more accounts

For Account 3, copy an account launcher and change only:

`IdleOn-Account2`

to:

`IdleOn-Account3`

For Account 4, use:

`IdleOn-Account4`

and continue the same pattern.

Every account needs its **own unique profile folder**.

## 7. If the second account starts too quickly

Change:

```vbscript
WScript.Sleep 5000
```

to:

```vbscript
WScript.Sleep 8000
```

The number is milliseconds, so `5000` = 5 seconds.

## 8. Keep these files safe

Only the launcher scripts belong in this repository.

Never upload your real:

- `%APPDATA%\IdleOn-Account1`
- `%APPDATA%\IdleOn-Account2`
- cookies
- session files
- saved credentials
- Steam login information

## Done

You now have:

```text
IdleOn - Account 1.vbs      → Account 1
IdleOn - Account 2.vbs      → Account 2
IdleOn - Both Accounts.vbs  → Starts both
```

For troubleshooting, backups, Steam updates, moving launchers, and detailed explanations, see the [full README](README.md).
