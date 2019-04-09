Get-ADGroup -Filter {name -like 'Enter a keywork for the AD group*'} | 

ForEach-Object {
    Get-ADGroupMember $_.name | 
ForEach-Object {
    Get-ADPrincipalGroupMembership $_.samaccountname | Where-Object {($_.name -like ("Enter a first keywork*")) -or ($_.name -like ("Enter a second keyword*"))  }
}

} | Export-Csv -Path C:\path-to-file\file.csv 
