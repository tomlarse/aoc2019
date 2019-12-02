function Invoke-Day1Part1 {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [int]$Mass
    )
    Process {
        [Math]::Floor($Mass/3) - 2
    }
}

function Invoke-Day1Part2 {
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [int]$Mass
    )
    process {
        $RequiredFuel = 0
        $LastMass = $Mass
        while ((Invoke-Day1Part1 -Mass $LastMass) -gt 0) {
            $RequiredFuel += Invoke-Day1Part1 -Mass $LastMass
            $LastMass = Invoke-Day1Part1 -Mass $LastMass
        }
        $RequiredFuel
    }
}

# Solve Part 1 Import-Csv .\day1\input.csv -Header Mass | Invoke-Day1Part1 | Measure-Object -Sum
# Solve Part 2 Import-Csv .\day1\input.csv -Header Mass | Invoke-Day1Part2 | Measure-Object -Sum