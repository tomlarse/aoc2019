$LineV = @(
    [pscustomobject]@{
        x= 3
        y= 5
    },
    [pscustomobject]@{
        x= 3
        y= 4
    },
    [pscustomobject]@{
        x= 3
        y= 3
    },
    [pscustomobject]@{
        x= 3
        y= 2
    }
)

$LineH = @(
    [pscustomobject]@{
        x= 6
        y= 3
    },
    [pscustomobject]@{
        x= 5
        y= 3
    },
    [pscustomobject]@{
        x= 4
        y= 3
    },
    [pscustomobject]@{
        x= 3
        y= 3
    },
    [pscustomobject]@{
        x= 2
        y= 3
    }
)

$crosses = [system.collections.arraylist]::new()

foreach ($Vcoord in $LineV) {
    foreach ($Hcoord in $LineH) {
        if ($Vcoord.x -eq $Hcoord.x -and $Vcoord.y -eq $Hcoord.y) {
            $crosses.Add($Hcoord)
        }
    }
}