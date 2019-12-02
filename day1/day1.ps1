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