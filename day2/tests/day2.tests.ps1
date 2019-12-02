Describe "Day 2 Tests" {
    . .\day2\day2.ps1

    Context "Part 1" {
        It "Should execute the example correctly" {
            $in = @(1, 9, 10, 3, 2, 3, 11, 0, 99, 30,40,50)
            Invoke-Day2Part1 -Program $in | Should -Be @(3500,9,10,70,2,3,11,0,99,30,40,50)
        }

        It "Should execute example 2 correctly" {
            $in = @(1, 0, 0, 0,99)
            Invoke-Day2Part1 -Program $in | Should -Be @(2, 0, 0, 0,99)
        }
        It "Should execute example 3 correctly" {
            $in = @(2, 3, 0, 3,99)
            Invoke-Day2Part1 -Program $in | Should -Be @(2, 3, 0, 6,99)
        }
        It "Should execute example 4 correctly" {
            $in = @(2, 4, 4, 5, 99,0)
            Invoke-Day2Part1 -Program $in | Should -Be @(2, 4, 4, 5, 99, 9801)
        }
        It "Should execute example 5 correctly" {
            $in = @(1, 1, 1, 4, 99, 5, 6,0,99)
            Invoke-Day2Part1 -Program $in | Should -Be @(30, 1, 1, 4, 2, 5, 6,0,99)
        }
    }
}