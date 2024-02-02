sqlcmd -E -S .\INSERTGT -d master -Q "EXECUTE dbo.IndexOptimize @Databases = 'USER_DATABASES', @LogToTable = 'Y';" -b -o B:\OLA\Logs\IndexOptimizeUserDatabases.txt
