Migrate User Accounts From Old Server to A New Server

On a server, there are already many users and their home dir. For some reason, there was a fatal case in the server.
If you want to upgrade, it's not possible because there are many dependency issues. As a result, we must create a new VM and migrated all users and each user's data.

Requirements:
1. UID and GID must be identical with the old server.
2. If point 1 is not fulfilled, the UID and GID must be changed to avoid ownership issues.
3. Migrated users are non-system accounts.

Script:
move.sh => running on old serevr
migration.sh => running on new server
