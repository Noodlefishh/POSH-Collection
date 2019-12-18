#Get computer informations with WMIObject
#Jonathan Bourbonnais - 2019

$computer = Read-Host -Prompt "Enter the computer name :"

$computerModel = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object Model).Model
$serialNumber = (Get-WmiObject -Class Win32_BIOS | Select-Object SerialNumber).SerialNumber

Write-Host "The computer model is : $computerModel"
Write-Host "The serial number is : $serialNumber"

