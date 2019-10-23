#Created by Jonathan Bourbonnais - 2019
#This script create a CSV report for all the disabled accounts in Active Directory
#1 - Export all user from active directory unfiltered
#2 - Send all users Active Directory informations into users.csv file
#3 - Compare all user in the list and export the disabled account into accountDisabled.csv

$allUsers = "C:\temp\users.csv"
$resultDisabledAccount = "C:\temp\AccountDisabled.csv"

Write-Host "Working...Fetching all users from AD Database ..." -ForegroundColor Green
Get-ADUser -Filter * | Export-Csv -Path $allUsers 
Write-Host "User list fetched and located in $allUsers" -ForegroundColor Green

$userList = Import-Csv $allUsers | Select-Object Name, SamAccountName, UserPrincipalName

ForEach($users in $userList){

    Get-ADUser $users.SamAccountName  | Where-Object {$_.Enabled -eq $false} | Select-Object Name | Export-Csv $resultDisabledAccount -Append

}
