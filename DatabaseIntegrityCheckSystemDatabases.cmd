sqlcmd -E -S .\INSERTGT -d master -Q "EXECUTE dbo.DatabaseIntegrityCheck @Databases = 'SYSTEM_DATABASES', @LogToTable = 'Y';" -b -o B:\OLA\Logs\DatabaseIntegrityCheckSystemDatabases.txt
