describe "Day 3 Tests" {
    . .\day3\day3.ps1

    Context "Part 1" {
        It "Finds the closest crossing point for Example 1"  {
            Invoke-Day3Part1 -WirePaths @(@("U7","R6","D4","L4"),@("R8","U5","L5","D3")) | Should -Be 6
        }
    }
}