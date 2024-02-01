sqlcmd -E -S .\INSERTGT -d Tools -Q "EXECUTE dbo.DatabaseIntegrityCheck @Databases = 'SYSTEM_DATABASES', @LogToTable = 'Y';" -b -o B:\OLA\Logs\DatabaseIntegrityCheckSystemDatabases.txt
