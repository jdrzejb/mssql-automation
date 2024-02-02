# Variables
$taskName = "DB Integrity Checks" # Name of the scheduled task
$description = "This task runs a CMD script daily" # Description of the task
$scriptPath1 = "B:\OLA\Scripts\DatabaseIntegrityCheckSystemDatabases.cmd" # Path to the CMD script to run
$scriptPath2 = "B:\OLA\Scripts\DatabaseIntegrityCheckUserDatabases.cmd" # Path to the CMD script to run
$triggerTime = "5:30AM" # Time to run the task (24-hour format)

# Create the trigger for the task
$trigger = New-ScheduledTaskTrigger -Daily -At $triggerTime

# Create the action for the task
$action = New-ScheduledTaskAction -Execute "$scriptPath1"
$action = New-ScheduledTaskAction -Execute "$scriptPath2"

# Set the principal (run with highest privileges)
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Description $description -Principal $principal

# Output
Write-Host "Scheduled task '$taskName' created to run '$scriptPath' daily at $triggerTime"
