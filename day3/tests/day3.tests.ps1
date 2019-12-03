describe "Day 3 Tests" {
    . .\day3\day3.ps1

    Context "Part 1" {
        It "Finds the closest crossing point for Example 1"  {
            Invoke-Day3Part1 -WirePaths @(@("U7","R6","D4","L4"),@("R8","U5","L5","D3")) | Should -Be 6
        }
        It "Finds the closest crossing point for Example 2" {
            Invoke-Day3Part1 -WirePaths @(@("R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"), @("U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83")) | Should -Be 159
        }
        It "Finds the closest crossing point for Example 3" {
            Invoke-Day3Part1 -WirePaths @(@("R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"), @("U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7")) | Should -Be 135
        }
    }
}