#Jonathan Bourbonnais - 2019
#This script search for a keyword in a specified file.

$pathToFile = "C:\Path\to\File"
$keyword = "MY_WORD"

Get-ChildItem -Path $pathToFile -recurse | Select-String -pattern $keyword | group path | select name, lastwritetime
