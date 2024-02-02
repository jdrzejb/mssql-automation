sqlcmd -E -S .\INSERTGT -d master -Q "EXECUTE dbo.DatabaseIntegrityCheck @Databases = 'USER_DATABASES', @LogToTable = 'Y';" -b -o B:\OLA\Logs\DatabaseIntegrityCheckUserDatabases.txt
