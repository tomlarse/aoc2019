function Invoke-ShipComputerProgram {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string[]]$Program
    )
    
    $instr = 0
    $cont = $true

    while ($cont) {
        $norminstr = Get-NormalizedInstruction $Program[$instr]
        switch ($norminstr.Substring(3)) {
            "01" {
                [int]$parm1 = if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                } else {
                    $Program[$Program[$instr + 1]]
                }
                [int]$parm2 = if ($norminstr[1] -eq "1") {
                    $Program[$instr + 2]
                }
                else {
                    $Program[$Program[$instr + 2]]
                }
                $Program[$Program[$instr + 3]] = $parm1 + $parm2
                $instr += 4
            }

            "02" {
                [int]$parm1 = if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                }
                else {
                    $Program[$Program[$instr + 1]]
                }
                [int]$parm2 = if ($norminstr[1] -eq "1") {
                    $Program[$instr + 2]
                }
                else {
                    $Program[$Program[$instr + 2]]
                }
                $Program[$Program[$instr + 3]] = $parm1 * $parm2
                $instr += 4
            }

            "03" {
                $in = Read-Host -Prompt "Waiting for input..."
                $Program[$Program[$instr + 1]] = $in
                $instr+=2
            }
            
            "04" {
                if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                }
                else {
                    $Program[$Program[$instr + 1]]
                }
                $instr += 2
            }

            "05" {
                [int]$parm1 = if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                }
                else {
                    $Program[$Program[$instr + 1]]
                }
                [int]$parm2 = if ($norminstr[1] -eq "1") {
                    $Program[$instr + 2]
                }
                else {
                    $Program[$Program[$instr + 2]]
                }

                if ($parm1 -ne 0) {
                    $instr = $parm2
                } else {
                    $instr += 3
                }
            }

            "06" {
                [int]$parm1 = if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                }
                else {
                    $Program[$Program[$instr + 1]]
                }
                [int]$parm2 = if ($norminstr[1] -eq "1") {
                    $Program[$instr + 2]
                }
                else {
                    $Program[$Program[$instr + 2]]
                }

                if ($parm1 -eq 0) {
                    $instr = $parm2
                }
                else {
                    $instr += 3
                }
            }

            "07" {
                [int]$parm1 = if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                }
                else {
                    $Program[$Program[$instr + 1]]
                }
                [int]$parm2 = if ($norminstr[1] -eq "1") {
                    $Program[$instr + 2]
                }
                else {
                    $Program[$Program[$instr + 2]]
                }

                if ($parm1 -lt $parm2) {
                    $Program[$Program[$instr + 3]] = 1
                }
                else {
                    $Program[$Program[$instr + 3]] = 0
                }
                $instr += 4
            }

            "08" {
                [int]$parm1 = if ($norminstr[2] -eq "1") {
                    $Program[$instr + 1]
                }
                else {
                    $Program[$Program[$instr + 1]]
                }
                [int]$parm2 = if ($norminstr[1] -eq "1") {
                    $Program[$instr + 2]
                }
                else {
                    $Program[$Program[$instr + 2]]
                }

                if ($parm1 -eq $parm2) {
                    $Program[$Program[$instr + 3]] = 1
                }
                else {
                    $Program[$Program[$instr + 3]] = 0
                }
                $instr += 4
            }

            "99" {
                $cont = $false
            }

            Default {
                Throw "Faulty program"
            }
        }
    }
    #$Program
}

function Get-NormalizedInstruction {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$instr
    )
    
    switch ($instr.Length) {
        1 {
            $instr = "0000$instr"
        }
        2 {
            $instr = "000$instr"
        }
        3 {
            $instr = "00$instr"
        }
        4 {
            $instr = "0$instr"
        }
    }
    $instr
}