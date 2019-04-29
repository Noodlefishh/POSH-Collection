#Get the role older for all opf the five FSMO roles

Import-Module ActiveDirectory

$domain = "yourdomain.com"

Get-ADForest $domain | Format-List SchemaMaster,DomainNamingMaster
Get-ADDomain $domain | Format-List PDCEMulator,RIDMaster,InfrastructureMaster