#Get the roles olders for all of the five FSMO roles and wich server are global catalogs

Import-Module ActiveDirectory

$domain = "yourdomain.com"

Get-ADForest $domain | Format-List SchemaMaster,DomainNamingMaster
Get-ADDomain $domain | Format-List PDCEMulator,RIDMaster,InfrastructureMaster
Get-ADForest | format-list -Property GlobalCatalogs 
