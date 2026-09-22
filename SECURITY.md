# Security & Privacy

## What these scripts do

The launcher scripts in this repository are simple Windows VBS scripts.

They:

- read the Windows `%APPDATA%` location;
- launch the user's local `LegendsOfIdleon.exe`;
- provide a separate `--user-data-dir` for each account;
- wait 5 seconds between launches when using the "Both Accounts" launcher.

## What these launcher scripts do not do

The launcher scripts contain no code that:

- sends Steam IDs or IdleOn account IDs to the author;
- uploads passwords or saved credentials;
- uploads cookies or session data;
- contacts an external server;
- downloads additional software;
- secretly executes additional code;
- deletes user files;
- modifies the Windows Registry.

The source code is publicly visible on GitHub so anyone can inspect it before running it.

## Important distinction

These scripts only control how the game is launched.

They do **not** control the internal behavior of Legends of IdleOn, Steam, Windows, or any other software.

Once the game is running, the game itself may communicate with its own servers and process data required by the game.

This project does not claim that the game itself makes no network connections or collects no data.

## User privacy

Never upload your personal IdleOn profile folders to this repository.

Do not upload:

- `%APPDATA%\IdleOn-Account1`
- `%APPDATA%\IdleOn-Account2`
- cookies
- session files
- local-storage files
- saved credentials
- Steam login information
- access tokens or passwords

## Verify before running

Users can inspect the complete VBS source code directly on GitHub.

For additional verification, users can calculate a SHA-256 hash of a downloaded launcher with PowerShell:

```powershell
Get-FileHash ".\IdleOn - Main Account.vbs" -Algorithm SHA256
Get-FileHash ".\IdleOn - Second Account.vbs" -Algorithm SHA256
Get-FileHash ".\IdleOn - Both Accounts.vbs" -Algorithm SHA256
Get-FileHash ".\IdleOn - Account Template.vbs" -Algorithm SHA256

```

A hash identifies the exact file contents at the time it was calculated. If the file changes, its hash changes.

## Public repository safety

The repository should contain only generic launcher scripts and documentation.

Never upload local profile data or other private files just because they are needed on your own PC.

## Reporting a concern

Please open a GitHub issue describing the specific file and behavior you are concerned about.

Do not post passwords, access tokens, cookies, or other sensitive information in a public issue.

## Disclaimer

This project is provided "as is" under the repository license.

Users should review scripts before running them and should keep backups of important local data.

This project is not affiliated with Valve, Steam, or the developers/publishers of Legends of IdleOn.
