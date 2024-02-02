# Variables
$taskName = "DB maintenance weekly" # Name of the scheduled task
$description = "This task runs a DB optimization script daily" # Description of the task
$scriptPath1 = "B:\OLA\Scripts\DeleteBackupHistory.cmd" # Path to the CMD script to run
$scriptPath2 = "B:\OLA\Scripts\PurgeJobHistory.cmd" # Path to the CMD script to run
$scriptPath3 = "B:\OLA\Scripts\OutputFileCleanup.cmd" # Path to the CMD script to run
$scriptPath4 = "B:\OLA\Scripts\CommandLogCleanup.cmd" # Path to the CMD script to run
$triggerTime = "6:15AM" # Time to run the task (24-hour format)

# Create the trigger for the task
$trigger = New-ScheduledTaskTrigger -Weekly -At $triggerTime

# Create the action for the task
$action1 = New-ScheduledTaskAction -Execute "$scriptPath1"
$action2 = New-ScheduledTaskAction -Execute "$scriptPath2"
$action3 = New-ScheduledTaskAction -Execute "$scriptPath3"
$action4 = New-ScheduledTaskAction -Execute "$scriptPath4"

# Set the principal (run with highest privileges)
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action1, $action2, $action3, $action4 -Description $description -Principal $principal

# Output
Write-Host "Scheduled task '$taskName' created to run '$scriptPath' daily at $triggerTime"
