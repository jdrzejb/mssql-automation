sqlcmd -E -S .\INSERTGT -d Tools -Q "EXECUTE dbo.IndexOptimize @Databases = 'USER_DATABASES', @LogToTable = 'Y';" -b -o B:\OLA\Logs\IndexOptimizeUserDatabases.txt
