Describe "Day 4 Tests" {
    . .\day4\day4.ps1

    Context "Part 1" {
        It "Judges passwords correctly example 1" {
            Test-Password 111111 | Should -BeTrue
        }
        It "Judges passwords correctly example 2" {
            Test-Password 223450 | Should -BeFalse
        }
        It "Judges passwords correctly example 3" {
            Test-Password 123789 | Should -BeFalse
        }
    }
}