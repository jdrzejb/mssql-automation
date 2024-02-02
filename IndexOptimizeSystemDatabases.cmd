sqlcmd -E -S .\INSERTGT -d master -Q "EXECUTE dbo.IndexOptimize @Databases = 'master,msdb', @MSShippedObjects = 'Y', @LogToTable = 'Y';" -b -o B:\OLA\Logs\IndexOptimizeSystemDatabases.txt
