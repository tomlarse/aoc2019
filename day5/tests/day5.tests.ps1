Describe "Day 5 Tests" {
    . .\day5\day5.ps1

    Context "Part 1" {
        it "Adds correctly with positional params" {
            Invoke-ShipComputerProgram @("1","1","2","0","4","0","99") | should -be "3"
        }
        It "Adds correctly with immediate params" {
            Invoke-ShipComputerProgram @("1101", "2", "4", "0", "4", "0", "99") | Should -be "6"
        }
        It "Multiplies correctly with positional params" {
            Invoke-ShipComputerProgram @("2", "4", "0", "0", "4", "0", "99") | Should -be "8"
        }
        It "Multiplies correctly with Immediate params" {
            Invoke-ShipComputerProgram @("1102", "0", "2", "0", "4", "0", "99") | Should -be "0"
        }
    }

    Context "Part 2" {
        It "Compares correctly equals using position mode" {
            Mock Read-Host { return "8" }
            Invoke-ShipComputerProgram @(3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8) | Should -Be 1
            Mock Read-Host { return "7" }
            Invoke-ShipComputerProgram @(3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8) | Should -Be 0
        }
        It "Compares correctly less than using position mode" {
            Mock Read-Host { return "7" }
            Invoke-ShipComputerProgram @(3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8) | Should -Be 1
            Mock Read-Host { return "8" }
            Invoke-ShipComputerProgram @(3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8) | Should -Be 0
        }
        It "Compares correctly equals using Immediate mode" {
            Mock Read-Host { return "8" }
            Invoke-ShipComputerProgram @(3, 3, 1108, -1, 8, 3, 4, 3, 99) | Should -Be 1
            Mock Read-Host { return "7" }
            Invoke-ShipComputerProgram @(3, 3, 1108, -1, 8, 3, 4, 3, 99) | Should -Be 0
        }
        It "Compares correctly less than using immediate mode" {
            Mock Read-Host { return "7" }
            Invoke-ShipComputerProgram @(3, 3, 1107, -1, 8, 3, 4, 3, 99) | Should -Be 1
            Mock Read-Host { return "8" }
            Invoke-ShipComputerProgram @(3, 3, 1107, -1, 8, 3, 4, 3, 99) | Should -Be 0
        }
        It "Jumps correctly using position mode" {
            Mock Read-Host { return "1" }
            Invoke-ShipComputerProgram @(3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9) | Should -Be 1
            Mock Read-Host { return "0" }
            Invoke-ShipComputerProgram @(3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9) | Should -Be 0
        }
        It "Jumps correctly using immediate mode" {
            Mock Read-Host { return "1" }
            Invoke-ShipComputerProgram  @(3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1) | Should -Be 1
            Mock Read-Host { return "0" }
            Invoke-ShipComputerProgram  @(3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1) | Should -Be 0
        }
        It "Runs the example program correct in all three cases" {
            Mock Read-Host { return "7" }
            Invoke-ShipComputerProgram @(3, 21, 1008, 21, 8, 20, 1005, 20, 22, 107, 8, 21, 20, 1006, 20, 31, 1106, 0, 36, 98, 0, 0, 1002, 21, 125, 20, 4, 20, 1105, 1, 46, 104, 999, 1105, 1, 46, 1101, 1000, 1, 20,4,20,1105,1,46,98,99) | Should -Be 999
            Mock Read-Host { return "8" }
            Invoke-ShipComputerProgram @(3, 21, 1008, 21, 8, 20, 1005, 20, 22, 107, 8, 21, 20, 1006, 20, 31, 1106, 0, 36, 98, 0, 0, 1002, 21, 125, 20, 4, 20, 1105, 1, 46, 104, 999, 1105, 1, 46, 1101, 1000, 1, 20,4,20,1105,1,46,98,99) | Should -Be 1000
            Mock Read-Host { return "9" }
            Invoke-ShipComputerProgram @(3, 21, 1008, 21, 8, 20, 1005, 20, 22, 107, 8, 21, 20, 1006, 20, 31, 1106, 0, 36, 98, 0, 0, 1002, 21, 125, 20, 4, 20, 1105, 1, 46, 104, 999, 1105, 1, 46, 1101, 1000, 1, 20,4,20,1105,1,46,98,99) | Should -Be 1001
        }
    }
}