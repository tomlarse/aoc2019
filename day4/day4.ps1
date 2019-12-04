function Test-Password {
    [CmdletBinding()]
    param (
        [ValidateLength(6, 6)]
        [parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string]$PassToTest
    )

    process {
        $lastnum = $null
        $TwoAdjacent = $false
        for ($i = 0;$i -lt 6; $i++) {
            if ($null -ne $lastnum) {
                if ($PassToTest[$i] -eq $lastnum) {
                    $TwoAdjacent = $true
                } elseif ($PassToTest[$i] -lt $lastnum) {
                    return $false
                }
            }
            $lastnum = $PassToTest[$i]
        }
        if ($TwoAdjacent) {
            $true
        } else {
            $false
        }
    }
}

# Solve part 1
# $t=0
# 134792..675810 |% {if (Test-Password $_) {$t++}}
# $t