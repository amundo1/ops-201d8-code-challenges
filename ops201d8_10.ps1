<# Powershell

# Script Name:                  Ops Challenge - Day 10
# Author:                       Adrian Mundo
# Date of latest revision:      20230505
#Purpose: Create a Powershell script that performs these operations on separate lines. The overall script is not designed to operate holistically, but rather act as a reference for how to execute various interesting operations with the process family of Powershell commandlets. Clearly indicate with comments each component below.
Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Start a browser process (such as Google Chrome or MS Edge) and have it open https://owasp.org/www-project-top-ten/.
Start the process Notepad ten times using a for loop.
Close all instances of the Notepad.
Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Google Chrome or MS Edge.
#>
# Declaration of variables
#$desktopPath = [Environment]::GetFolderPath("Desktop")
$i = 0
$procid=""
$startProc = "notepad.exe"
$stopProc = "notepad"
$cpuTimeProc = Get-Process | Sort-Object CPU -Descending
$procIDProc =  Get-Process | Sort-Object Id -Descending
$wkSetTop5Proc = Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 
$procIDbyName = Get-Process


# Declaration of functions
function opennotepad10times {
    for ($i=0; $i -lt 10; $i++)
{
    Start-Process $startProc
}
}



# Main
Write-Output "`n`n`n*******************************Processes Ordered by CPU time Highest to Lowest*****************************`n`n"
$cpuTimeProc
Write-Output "`n`n*******************************Done*****************************`n`n"

Write-Output "`n`n`n*******************************Processes Ordered by Process ID; Highest to Lowest*****************************`n`n"
$procIDProc
Write-Output "`n`n*******************************Done*****************************`n`n"

Write-Output "`n`n`n*******************************Processes Ordered by Top 5 Working Set; Highest to Lowest*****************************`n`n"
$wkSetTop5Proc
Write-Output "`n`n*******************************Done*****************************`n`n"

Write-Output "`n`n`n*******************************Start Google Chrome and Navigate to  https://owasp.org/www-project-top-ten/ *****************************`n`n"
[system.Diagnostics.Process]::Start("chrome","https://owasp.org/www-project-top-ten/")

Write-Output "`n`n`n*******************************Start Notepad*****************************`n`n"
opennotepad10times

Start-Sleep -Seconds 5

Write-Output "`n`n`n*******************************Stop Notepad*****************************`n`n"
Stop-Process -Name $stopProc -Force

Start-Sleep -Seconds 5

Write-Output "`n`n`n*******************************Kill Process by PID*****************************`n`n"
Start-Process $startProc

Start-Sleep -Seconds 5
$procIDbyName
Start-Sleep -Seconds 5

$procid = Read-Host "`n`nType the PID to Kill: "
$procid = [int]$procid
Stop-Process -id $procid -Force




# End