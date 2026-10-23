# Optional: opens Policy Check Monitor in Microsoft Edge every weekday at 9:00 AM,
# so the day's check runs without you remembering to start it.
# Run once:   right-click this file > Run with PowerShell
# Remove:     Unregister-ScheduledTask -TaskName "Policy Check Monitor" -Confirm:$false

$app = Join-Path $PSScriptRoot 'Policy Check Monitor.html'
if (-not (Test-Path -LiteralPath $app)) { Write-Host "Cannot find $app - keep this script next to the app."; exit 1 }
$url = ([Uri]$app).AbsoluteUri

$action  = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument "/c start msedge `"$url`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday,Tuesday,Wednesday,Thursday,Friday -At 9:00AM
Register-ScheduledTask -TaskName 'Policy Check Monitor' -Action $action -Trigger $trigger -Description 'Opens Policy Check Monitor each weekday morning' -Force | Out-Null
Write-Host "Done. Policy Check Monitor will open every weekday at 9:00 AM."
