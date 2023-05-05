<# Powershell

# Script Name:                  Ops Challenge - Day 09
# Author:                       Adrian Mundo
# Date of latest revision:      20230504
#Purpose: Create a Powershell script that performs these operations on separate lines. The overall script is not designed to operate holistically, but rather act as a reference for how to execute various interesting operations with the process family of Powershell commandlets. Clearly indicate with comments each component below.
Output all events from the System event log that occurred in the last 24 hours to a file on your desktop named last_24.txt.
Output all “error” type events from the System event log to a file on your desktop named errors.txt.
Print to the screen all events with ID of 16 from the System event log.
Print to the screen the most recent 20 entries from the System event log.’
Print to the screen all sources of the 500 most recent entries in the System event log. Ensure that the full lines are displayed (get rid of the … and show the entire text).
#>

$desktopPath = [Environment]::GetFolderPath("Desktop")
$oneDayLog = Get-EventLog -Logname System -After (GET-Date).AddDays(-1)
$sysErrorLog =  Get-EventLog -Logname System -EntryType Error
$printEventID16 = Get-EventLog -Logname System -InstanceId 16
$top20Events = Get-EventLog -Logname System -Newest 20
$eventSources500 = Get-EventLog -Logname System -Newest 500 | Group-Object -Property Source -NoElement 

Write-Output "`n`nPrinting System events in last 24 Hours to last_24.txt `n" 
Out-File -FilePath $desktopPath\last_24.txt -InputObject $oneDayLog

Write-Output "Printing System errors to errors.txt `n" 
Out-File -FilePath $desktopPath\error.txt -InputObject $sysErrorLog

Write-Output "Printing System events with Event ID 16 `n" 
$printEventID16

Write-Output "`n`n"

Write-Output "Printing Latest 20 System events `n" 
$top20Events

Write-Output "Printing Latest 500 System events Sources `n" 
$eventSources500