# Contributing

Thank you for contributing to this project.

This repository provides simple Windows VBS launchers and documentation for running multiple Legends of IdleOn accounts with separate application profiles.

## Before contributing

Please keep contributions:

- Generic and reusable for other users.
- Free of personal paths, usernames, email addresses, Steam IDs, IdleOn account IDs, and other private information.
- Limited to launcher scripts, documentation, examples, and other files that are safe for a public repository.

Never upload your personal IdleOn profile folders, cookies, session files, local-storage files, saved credentials, Steam login information, access tokens, or passwords.

## Adding another account

To add Account 3, 4, 5, or another account:

1. Copy `IdleOn - Account Template.vbs`.
2. Change the profile directory to a new unique folder, such as:
   `%APPDATA%\IdleOn-Account4`
3. Rename the launcher so users can identify the account easily.
4. Do not put a real user-specific executable path into the repository.
5. Test the launcher locally before submitting the change.

Each account must use a different `--user-data-dir`.

## Changing the launchers

Keep launcher scripts simple and transparent.

A launcher should only contain the code needed to:

- create the Windows Script Host shell object;
- read `%APPDATA%`;
- launch the user's local `LegendsOfIdleon.exe`;
- provide the selected `--user-data-dir`;
- optionally wait between launches when starting multiple accounts.

Do not add code that:

- uploads data;
- sends personal or account information to a third party;
- downloads or installs software;
- runs hidden commands;
- collects passwords or credentials;
- modifies the Windows Registry;
- deletes user files.

## Documentation changes

When changing documentation:

- Use generic examples.
- Use placeholder executable paths such as `C:\PATH\TO\LegendsOfIdleon.exe`.
- Keep setup instructions consistent with the launcher files.
- Clearly warn users not to publish private account data.

## Testing

Before submitting a launcher change:

1. Check that the VBS file has a `.vbs` extension.
2. Verify that the `Exe` variable uses a placeholder path in the repository.
3. Verify that the `--user-data-dir` is unique.
4. Test the launcher on your own Windows PC.
5. Confirm that no personal data was included in the commit.

## Pull requests

Please describe:

- What you changed.
- Why the change is useful.
- Which files were changed.
- How you tested it.

Keep pull requests focused on one improvement when practical.

## Issues

When reporting a problem, include:

- Windows version;
- what launcher you used;
- what happened;
- any relevant error message;
- steps to reproduce.

Do not include passwords, cookies, access tokens, Steam login information, or personal account data.

## License

By contributing, you agree that your contribution is provided under the same license as this project.
