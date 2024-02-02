sqlcmd -E -S .\INSERTGT -d master -Q "DELETE FROM dbo.CommandLog WHERE StartTime < DATEADD(dd, -30, GETDATE());" -b -o B:\OLA\Logs\CommandLogCleanup.txt
