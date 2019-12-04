function TestPassword {
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        [string]$PassToTest
    )

}