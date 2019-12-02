Describe "Day 1" {
    . .\day1\day1.ps1
    It "Mass of 12 should require 2 fuel" {
        Invoke-Day1Part1 -Mass 12 | Should Be 2
    }
    It "Mass of 14 should require 2 fuel" {
        Invoke-Day1Part1 -Mass 14 | Should Be 2
    }
    It "Mass of 1969 should require 654 fuel" {
        Invoke-Day1Part1 -Mass 1969 | Should Be 654
    }
    It "Mass of 100756 should require 33583 fuel" {
        Invoke-Day1Part1 -Mass 100756 | Should Be 33583
    }
}

# Solve Part 1 Import-Csv .\day1\input1.csv -Header Mass | Invoke-Day1 | Measure-Object -Sum