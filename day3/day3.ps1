function Get-WirePathLines {
    [CmdletBinding()]
    param (
        [String[]]$WirePath
    )
    
    $x = 0
    $y = 0
    $WirePathLines = [System.Collections.ArrayList]::new()

    foreach ($Line in $WirePath) {
        $Points = [System.Collections.ArrayList]::new()
        switch ($Line[0]) {
            "D" {
                $Direction = 'V'
                for ($initialy = $y; $y -gt $initialy - [int]$Line.Substring(1); $y--) {
                    $null = $Points.Add(
                        [pscustomobject]@{
                            x = $x
                            y = $y
                        }
                    )
                }
            }
            "U" {
                $Direction = 'V'
                for ($initialy = $y; $y -lt $initialy + [int]$Line.Substring(1); $y++) {
                    $null = $Points.Add(
                        [pscustomobject]@{
                            x = $x
                            y = $y
                        }
                    )
                }
            }
            "L" {
                $Direction = 'H'
                for ($initialx = $x; $x -gt $initialx - [int]$Line.Substring(1); $x--) {
                    $null = $Points.Add(
                        [pscustomobject]@{
                            x = $x
                            y = $y
                        }
                    )
                }
            }
            "R" {
                $Direction = 'H'
                for ($initialx = $x; $x -lt $initialx + [int]$Line.Substring(1); $x++) {
                    $null = $Points.Add(
                        [pscustomobject]@{
                            x = $x
                            y = $y
                        }
                    )
                }
            }
        }

        $WirePathLine = [PSCustomObject]@{
            direction = $Direction
            points = $Points
        }
        $null = $WirePathLines.Add($WirePathLine)
    }
    $WirePathLines
}

function Get-ManhattanDistance {
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [int]$x,
        [parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
        [int]$y
    )
    
    [Math]::Abs($x) + [Math]::Abs($y)
}

function Invoke-Day3Part1 {
    [CmdletBinding()]
    param (
        $WirePaths
    )

    $Wire1Lines = Get-WirePathLines -WirePath $WirePaths[0]
    $Wire2Lines = Get-WirePathLines -WirePath $WirePaths[1]

    $crosses = [system.collections.arraylist]::new()

    foreach ($Vcoord in $($Wire1Lines | Where-Object Direction -eq "V").Points) {
        foreach ($Hcoord in $($Wire2Lines | Where-Object Direction -eq "H").Points) {
            if (
                
            ) {
                if ($Hcoord.x -ne 0 -and $Hcoord.y -ne 0) {
                    $null = $crosses.Add($Hcoord)
                }
            }
        }
    }

    foreach ($Vcoord in $($Wire2Lines | Where-Object Direction -eq "V").Points) {
        foreach ($Hcoord in $($Wire1Lines | Where-Object Direction -eq "H").Points) {
            if ($Vcoord.x -eq $Hcoord.x -and $Vcoord.y -eq $Hcoord.y) {
                if ($Hcoord.x -ne 0 -and $Hcoord.y -ne 0) {
                    $null = $crosses.Add($Hcoord)
                }
            }
        }
    }

    $ShortestManhattanDistance = 0

    foreach ($cross in $crosses) {
        if ($ShortestManhattanDistance -eq 0) {
            $ShortestManhattanDistance = ($cross | Get-ManhattanDistance)
        } else {
            if (($cross | Get-ManhattanDistance) -lt $ShortestManhattanDistance) {
                $ShortestManhattanDistance = ($cross | Get-ManhattanDistance)
            }
        }
    }
    $ShortestManhattanDistance
}