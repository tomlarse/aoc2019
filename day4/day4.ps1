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

function Test-Password2 {
    [CmdletBinding()]
    param (
        [ValidateLength(6, 6)]
        [parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string]$PassToTest
    )

    process {
        $lastnum = $null
        $TwoAdjacent = $false
        $TwoAdjacentInt = $null
        for ($i = 0; $i -lt 6; $i++) {
            if ($null -ne $lastnum) {
                if ($PassToTest[$i] -lt $lastnum) {
                    return $false
                }
                if ($PassToTest[$i] -eq $lastnum -and $PassToTest[$i] -ne $TwoAdjacentInt) {
                    $TwoAdjacent = $true
                    $TwoAdjacentInt = $PassToTest[$i]
                } elseif ($PassToTest[$i] -eq $lastnum -and $PassToTest[$i] -eq $TwoAdjacentInt) {
                    $TwoAdjacent = $false
                }
            }
            $lastnum = $PassToTest[$i]
        }
        if ($TwoAdjacent) {
            $true
        }
        else {
            $false
        }
    }
}

# Solve part 1
# 134792..675810 | Test-Password | ? {$_} | measure
# Solve part 2
# 134792..675810 | Test-Password2 | ? {$_} | measure