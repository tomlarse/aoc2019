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
            "L" {
                $Direction = 'H'
                for ($initialy = $y; $y -gt $initialy - [int]$Line.Substring(1); $y--) {
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
                for ($initialy = $y; $y -lt $initialy + [int]$Line.Substring(1); $y++) {
                    $null = $Points.Add(
                        [pscustomobject]@{
                            x = $x
                            y = $y
                        }
                    )
                }
            }
            "D" {
                $Direction = 'V'
                for ($initialx = $x; $x -gt $initialx - [int]$Line.Substring(1); $x--) {
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