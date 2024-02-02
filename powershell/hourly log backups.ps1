# Variables
$taskName = "DB Backups - log every 15 minutes" # Name of the scheduled task
$description = "This task saves log every 15 minutes" # Description of the task
$scriptPath = "B:\OLA\Scripts\DatabaseBackupUserDatabasesLog.cmd" # Path to the CMD script to run
$startTime = (Get-Date).AddMinutes(15) # Time to start the task, starting 15 minutes from now

# Create the trigger for the task
$trigger = New-ScheduledTaskTrigger -Once -At $startTime -RepetitionInterval (New-TimeSpan -Minutes 15) -RepetitionDuration ([timespan]::MaxValue)

# Create the action for the task
$action = New-ScheduledTaskAction -Execute "$scriptPath"

# Set the principal (run with highest privileges)
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Description $description -Principal $principal

# Output
Write-Host "Scheduled task '$taskName' created to run '$scriptPath' every 15 minutes, starting at $startTime"
