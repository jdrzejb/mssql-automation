sqlcmd -E -S .\INSERTGT -d Tools -Q "EXECUTE dbo.IndexOptimize @Databases = 'master,msdb', @MSShippedObjects = 'Y', @LogToTable = 'Y';" -b -o B:\OLA\Logs\IndexOptimizeSystemDatabases.txt