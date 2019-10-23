#This scripts gets file encoding
#Just change the path to your file.
function Get-FileEncoding {
    [CmdletBinding()]
    param (
        [Alias("PSPath")]
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [String]$Path
        ,
        [Parameter(Mandatory = $False)]
        [System.Text.Encoding]$DefaultEncoding = [System.Text.Encoding]::Default
    )
    
    process {
        [Byte[]]$bom = Get-Content -Encoding Byte -ReadCount 4 -TotalCount 4 -Path $Path
        
        $encoding_found = $false
        
        foreach ($encoding in [System.Text.Encoding]::GetEncodings().GetEncoding()) {
            $preamble = $encoding.GetPreamble()
            if ($preamble) {
                foreach ($i in 0..$preamble.Length) {
                    if ($preamble[$i] -ne $bom[$i]) {
                        break
                    } elseif ($i -eq $preamble.Length) {
                        $encoding_found = $encoding
                    }
                }
            }
        }
        
        if (!$encoding_found) {
            $encoding_found = $DefaultEncoding
        }
    
        $encoding_found
    }
}
Get-FileEncoding -Path "\\path\to\your\file"
