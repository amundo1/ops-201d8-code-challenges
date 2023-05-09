<# Powershell

# Script Name:                  Ops Challenge - Day 11
# Author:                       Adrian Mundo
# Date of latest revision:      20230508
#Purpose: Write a Powershell script that automates the configuration of a new Windows 10 endpoint. Your script should perform the following:

Enable File and Printer Sharing
Allow ICMP traffic
Enable Remote management
Remove bloatware
Enable Hyper-V
Disable SMBv1, an insecure protocol
#>

# Define Variables

$enfilePrintShare = Set-NetFirewallRule -DisplayGroup "File And Printer Sharing" -Enabled True
$allowICMP = netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4
$enRemoteMan = reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
$removeBloatware = iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))
$enHyperV = Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
$disSMBV1 = Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force 

# Define Functions

# MAIN



Write-output "`n`n`n**********************Enabling File and Printer Sharing**********************`n`n`n"
$enfilePrintShare
Start-Sleep 2

Write-Output "`n`n`nVerify File and Printer Sharing is enabled below`n`n`n"

Get-netfirewallrule -DisplayGroup "File And Printer Sharing"

Write-output "`n`n`n**********************Enabling ICMP**********************`n`n`n"
$allowICMP
Start-Sleep 2

Write-Output "`n`n`nVerify ICMP is enabled below`n`n`n"

Get-netfirewallrule -DisplayName "Allow incoming ping requests IPv4"

Write-output "`n`n`n**********************Enable Remote Manager**********************`n`n`n"
$enRemoteMan
Start-Sleep 2

#Write-Output "`n`n`nVerify Remote Manager is enabled below`n`n`n"

Write-output "`n`n`n**********************remove Bloatware**********************`n`n`n"
$removeBloatware

Write-output "`n`n`n**********************Enable Hyper-V**********************`n`n`n"
$enHyperV 


Write-output "`n`n`n**********************Disable SMBv1**********************`n`n`n"
$disSMBV1

Write-output "`n`n`n**********************Complete**********************`n`n`n"

#END
