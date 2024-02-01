sqlcmd -E -S .\INSERTGT -d Tools -Q "EXECUTE dbo.DatabaseIntegrityCheck @Databases = 'USER_DATABASES', @LogToTable = 'Y';" -b -o B:\OLA\Logs\DatabaseIntegrityCheckUserDatabases.txt
