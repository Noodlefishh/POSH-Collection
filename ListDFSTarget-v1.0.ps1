############################################################################
#### THIS SCRIPT HELP YOU FIND ALL DFS SERVER TARGET INTO ANY NAMESPACE ####
############################################################################

$namespaces = get-dfsnroot 
$cible = @()
Foreach ($namespace in $namespaces) {
$path = $namespace.path + "\*"
$folders= get-dfsnfolder -path $path | get-dfsnfoldertarget

$cible += $folders
}

$dfs = $cible | where-object{$_.targetpath -like "*Enter-you server-name*"}
$dfs | export-csv "Enter a path to export the .csv" -Encoding UTF8

