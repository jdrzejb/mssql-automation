sqlcmd -E -S .\INSERTGT -d Tools -Q "EXECUTE dbo.DatabaseBackup @Databases = 'USER_DATABASES', @Directory = 'B:\SQL Backups', @BackupType = 'LOG', @Verify = 'Y', @CleanupTime = NULL, @CheckSum = 'Y', @LogToTable = 'Y';" -b -o B:\OLA\Logs\DatabaseBackupUserDatabasesLog.txt