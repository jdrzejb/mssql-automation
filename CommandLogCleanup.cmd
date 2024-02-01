sqlcmd -E -S .\INSERTGT -d Tools -Q "DELETE FROM dbo.CommandLog WHERE StartTime < DATEADD(dd, -30, GETDATE());" -b -o D:\OLA\Logs\CommandLogCleanup.txt
