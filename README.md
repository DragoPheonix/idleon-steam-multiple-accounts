# Legends of IdleOn — Multiple Accounts on One Windows PC

Run multiple **Legends of IdleOn** accounts on the same Windows user and the same Steam installation by giving each account its own application profile.

This repository contains ready-to-copy Windows Script Host (VBS) launchers and a complete setup guide.

> **Important:** This guide is written with placeholders on purpose. It contains no personal names, usernames, email addresses, computer names, drive letters, or private account information.

## What this setup does

Normally, starting the game more than once can cause both instances to use the same local application profile.

This setup starts each instance with a different Chromium/Electron-style profile directory using:

`--user-data-dir=...`

For example:

- Account 1 → `%APPDATA%\IdleOn-Account1`
- Account 2 → `%APPDATA%\IdleOn-Account2`
- Account 3 → `%APPDATA%\IdleOn-Account3`

Each profile keeps its own local cookies, session data, and other profile information.

The game itself is still installed **only once**. Both accounts use the same game executable.

## Requirements

You need:

1. Windows 10 or Windows 11.
2. The Steam version of Legends of IdleOn.
3. Permission to run `.vbs` files with Windows Script Host.
4. Enough system resources to run more than one game instance.

## Folder layout

You do **not** need to create these folders inside the Steam game directory.

The account profiles are stored in the Windows user AppData folder:

`%APPDATA%\IdleOn-Account1`

`%APPDATA%\IdleOn-Account2`

Additional accounts can use:

`%APPDATA%\IdleOn-Account3`

`%APPDATA%\IdleOn-Account4`

and so on.

## Step 1 — Find the Legends of IdleOn executable

Open Steam.

Go to:

**Library → Legends of IdleOn → Manage → Browse local files**

Find:

`LegendsOfIdleon.exe`

Right-click the file and choose **Copy as path**.

You will need that path in the VBS files.

For example, the path might look like:

`C:\SteamLibrary\steamapps\common\Legends of Idleon\LegendsOfIdleon.exe`

Your path will probably be different.

## Step 2 — Create the account profile folders

Open **PowerShell**.

Copy and paste this:

```powershell
New-Item -ItemType Directory -Force -Path "$env:APPDATA\IdleOn-Account1"
New-Item -ItemType Directory -Force -Path "$env:APPDATA\IdleOn-Account2"
```

To create more accounts, add more lines. For example:

```powershell
New-Item -ItemType Directory -Force -Path "$env:APPDATA\IdleOn-Account3"
New-Item -ItemType Directory -Force -Path "$env:APPDATA\IdleOn-Account4"
```

You can also allow the game to create a profile folder automatically when the launcher is first used.

## Step 3 — Configure the launcher files

Open the VBS launcher in Notepad or Notepad++.

At the top you will see:

```vbscript
Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
```

Replace only the path between the quotation marks with the real path to your `LegendsOfIdleon.exe`.

Do this for each launcher.

### Account 1

The complete file should look like this:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account1""", 1, False
```

Save it as:

`IdleOn - Main Account.vbs`

### Account 2

The complete file should look like this:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account2""", 1, False
```

Save it as:

`IdleOn - Second Account.vbs`

### Start both accounts

The complete file should look like this:

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

The `5000` means **5 seconds**. It gives the first instance time to start before the second one launches.

If the first instance needs more time on a particular PC, change:

```vbscript
WScript.Sleep 5000
```

to, for example:

```vbscript
WScript.Sleep 8000
```

## Step 4 — Save the files correctly

When saving with Notepad:

1. Choose **File → Save As**.
2. Set **Save as type** to **All Files**.
3. Make sure the filename ends with `.vbs`.
4. Do not save it as `.vbs.txt`.

With Notepad++, choose **Save As** and keep the `.vbs` extension.

You can put the VBS files anywhere, such as:

`C:\IdleOn Launchers\`

They do not have to be inside the Steam folder.

## Step 5 — First login for each account

For the first setup, do one account at a time.

### Account 1

1. Make sure Legends of IdleOn is closed.
2. Double-click `IdleOn - Main Account.vbs`.
3. Log into Account 1.
4. Wait until the account has loaded.
5. Close the game normally.

### Account 2

1. Make sure Legends of IdleOn is closed.
2. Double-click `IdleOn - Second Account.vbs`.
3. Log into Account 2.
4. Wait until the account has loaded.
5. Close the game normally.

The two accounts are now stored in separate application profiles.

## Step 6 — Start both accounts

After both accounts have been configured:

Double-click:

`IdleOn - Both Accounts.vbs`

The launcher will:

1. Start Account 1.
2. Wait 5 seconds.
3. Start Account 2.

Both instances use the same game installation but different profile folders.

## How to add Account 3, 4, 5, etc.

Copy an existing account launcher and change the profile directory.

For Account 3:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account3""", 1, False
```

Save it as:

`IdleOn - Account 3.vbs`

Then create the next one by changing only:

`\IdleOn-Account3`

to:

`\IdleOn-Account4`

and so on.

Each account must have a **different** profile directory.

## Starting several accounts

For example, to start Accounts 1, 2 and 3:

```vbscript
Set WshShell = CreateObject("WScript.Shell")

Exe = "C:\PATH\TO\LegendsOfIdleon.exe"
AppData = WshShell.ExpandEnvironmentStrings("%APPDATA%")

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account1""", 1, False
WScript.Sleep 5000

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account2""", 1, False
WScript.Sleep 5000

WshShell.Run """" & Exe & """" & " --user-data-dir=""" & AppData & "\IdleOn-Account3""", 1, False
```

Add another 5000 ms delay and another launch line for each additional account.

## Moving or renaming the VBS launchers

You can rename the VBS files.

Examples:

- `IdleOn - Account 1.vbs`
- `IdleOn - Farming.vbs`
- `IdleOn - Account 2.vbs`

You can also move them to another folder.

The important part is that:

- the `.vbs` extension remains;
- the `Exe` path still points to the real game executable;
- each account keeps a unique `--user-data-dir`.

Moving a launcher does **not** move the account profile. The profile stays under `%APPDATA%`.

## Steam game updates

There is only one game installation.

For example:

```text
Steam
└── Legends of IdleOn
    └── LegendsOfIdleon.exe
```

All account launchers point to that same executable.

Therefore, when Steam updates Legends of IdleOn, it updates the shared installation once. You do not need a separate copy of the game for every account.

Do **not** delete the account profile folders just because Steam updated the game.

## Backing up your account profiles

Your account profile folders may contain important local session/application data.

To back them up, press:

**Win + R**

and enter:

```text
%APPDATA%
```

Then copy:

`IdleOn-Account1`

`IdleOn-Account2`

and any other account folders you created to a backup location.

Restore them by putting the folders back into the same `%APPDATA%` location.

**Never upload these private profile folders to GitHub.**

## Important: do not upload private account data

This repository is only for launcher scripts and documentation.

Do not put any of these in a public GitHub repository:

- `%APPDATA%\IdleOn-Account1`
- `%APPDATA%\IdleOn-Account2`
- cookies
- local-storage files
- session files
- saved credentials
- screenshots containing private information
- Steam login information

The included `.gitignore` helps prevent common accidental uploads, but always check files before publishing.

## Troubleshooting

### The launcher opens nothing

Check the `Exe` line.

It must point to the real file:

`LegendsOfIdleon.exe`

Do not point it to the Steam shortcut.

### A command window appears

The provided VBS launchers use Windows Script Host and do not intentionally open a Command Prompt window.

Make sure you saved them as `.vbs`, not `.bat` or `.cmd`.

### Both launches use the same account

Check the `--user-data-dir` values.

They must be different, for example:

`IdleOn-Account1`

and `IdleOn-Account2`

Do not use the same profile directory for two running instances.

### The second account starts too early

Increase:

```vbscript
WScript.Sleep 5000
```

to:

```vbscript
WScript.Sleep 8000
```

or another suitable value.

### Windows asks what program should open the VBS file

Windows Script Host is normally associated with `.vbs` files.

Check that `wscript.exe` is available at:

`C:\Windows\System32\wscript.exe`

Do not open unknown scripts from untrusted sources.

## Optional: create desktop shortcuts

Once a `.vbs` launcher works, you can create a normal Windows shortcut to the `.vbs` file.

Right-click the VBS file → **Show more options → Send to → Desktop (create shortcut)**.

You can then rename the shortcut to something easy to recognize.

## Important limitations

This method relies on the game accepting the `--user-data-dir` argument and keeping useful account/session data inside that profile.

The exact behavior can change after a game or runtime update.

Steam Cloud behavior is separate from this profile-isolation method. Do not assume that every file stored in `%APPDATA%` is synchronized by Steam Cloud. Keep backups of local profiles when needed.

This project is a community setup guide and is not affiliated with Valve, Steam, or the developers/publishers of Legends of IdleOn.

## Repository files

- `README.md` — complete setup guide
- `IdleOn - Main Account.vbs` — starts Account 1
- `IdleOn - Second Account.vbs` — starts Account 2
- `IdleOn - Both Accounts.vbs` — starts Accounts 1 and 2
- `IdleOn - Account Template.vbs` — template for additional accounts
- `.gitignore` — helps avoid committing local files
- `LICENSE.txt` — project license

## Quick start

The shortest path is:

1. Find `LegendsOfIdleon.exe`.
2. Put that path into the three launcher files.
3. Save the files as `.vbs`.
4. Run Account 1 once and log in.
5. Run Account 2 once and log in.
6. Use `IdleOn - Both Accounts.vbs` to start both.
