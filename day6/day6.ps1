class Planet {
    [string]$Name
    [string]$Parent

    [bool]IsCOM() {
        return ("" -eq $this.Parent)
    }

    Planet ([string]$Name) {
        $this.Name = $Name
        $this.Parent = $null
    }

    Planet ([string]$Name, [string]$Parent) {
        $this.Name = $Name
        $this.Parent = $Parent
    }
}

function Get-NumberOfOrbits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [Planet]$Planet,
        [Parameter(Mandatory = $true, Position = 1)]
        [Planet[]]$PlanetList
    )
    process {
        $NumberOfOrbits = 0
        while (-not $Planet.IsCOM()) {
            $Planet = $PlanetList | Where-Object Name -eq $Planet.Parent
            $NumberOfOrbits++
        }
        $NumberOfOrbits
    }
}

function Get-OrbitCountChecksum {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [Planet[]]$PlanetMap
    )
    $OrbitCountChecksum = 0
    foreach ($planet in $PlanetMap) {
        $OrbitCountChecksum += (Get-NumberOfOrbits -Planet $Planet -PlanetList $PlanetMap)
    }
    $OrbitCountChecksum
}

function New-PlanetMap {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string[]]$In
    )
    $PlanetList = [System.Collections.ArrayList]::new()

    foreach ($planet in $in) {
        $planet = $planet.split(')')

        if ($planet[0] -eq "COM") {
            $null = $PlanetList.Add([Planet]::new($Planet[0]))
        }
        $null = $PlanetList.Add([Planet]::new($planet[1], $Planet[0]))
    }
    $PlanetList
}

# Solve part 1
# $planetin = Get-Content .\day6\input.txt
# Get-OrbitCountChecksum (New-PlanetMap $planetin)