$path = "\\path\to\file"

"{0:N2} MB" -f ((Get-ChildItem $path -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB)
