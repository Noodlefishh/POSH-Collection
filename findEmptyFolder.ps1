#This script find all empty files on a local Windows System.

Get-ChildItem -recurse | 
Where-Object { $_.PSIsContainer } |   
Where-Object { $_.GetFiles().Count -eq 0 } |   
Where-Object { $_.GetDirectories().Count -eq 0 } |   
ForEach-Object { $_.FullName }    