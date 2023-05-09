<# Powershell

# Script Name:                  Ops Challenge - Day 12
# Author:                       Adrian Mundo
# Date of latest revision:      20230509
#Purpose: Write a Powershell script that returns the IPv4 address of the computer.
Use Select-String cmdlet to only return the IPv4 address string and no other extraneous information.
#>

# Declaration of variables
$desktopPath = [Environment]::GetFolderPath("Desktop")
$netReportFile = "network_report.txt"
$ipconfAll = ipconfig /all

# Declaration of functions
function netReport {
    Out-File -FilePath $desktopPath\$netReportFile -InputObject $ipconfAll 
    Select-String -Path $desktopPath\$netReportFile -Pattern "IPv4"

    Write-Output "`n`n`n********Deleting Network_Report.txt**************`n`n`n"
    Start-Sleep 2
    Remove-Item $desktopPath\$netReportFile
}
# Main

netReport





# End
