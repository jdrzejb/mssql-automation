# Variables
$taskName = "DB Backups - full weekly" # Name of the scheduled task
$description = "This task runs a CMD script weekly" # Description of the task
$scriptPath1 = "B:\OLA\Scripts\DatabaseBackupUserDatabasesFull.cmd" # Path to the CMD script to run
$scriptPath2 = "B:\OLA\Scripts\DatabaseBackupSystemDatabasesFull.cmd" # Path to the CMD script to run

$triggerTime = "4:00AM" # Time to run the task (24-hour format)

# Create the trigger for the task
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday,Wednesday,Friday -At $triggerTime

# Create the action for the task
$action1 = New-ScheduledTaskAction -Execute "$scriptPath1"
$action2 = New-ScheduledTaskAction -Execute "$scriptPath2"

# Set the principal (run with highest privileges)
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action1, $action2 -Description $description -Principal $principal

# Output
Write-Host "Scheduled task '$taskName' created to run '$scriptPath' daily at $triggerTime"
