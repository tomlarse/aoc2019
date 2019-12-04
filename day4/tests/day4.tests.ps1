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

    Context "Part 2" {
        It "Judges passwords correctly example 1" {
            Test-Password2 112233 | Should -BeTrue
        }
        It "Judges passwords correctly example 2" {
            Test-Password2 123444 | Should -BeFalse
        }
        It "Judges passwords correctly example 3" {
            Test-Password2 111122 | Should -BeTrue
        }
        It "Judges passwords correctly self" {
            Test-Password2 111111 | Should -BeFalse
        }
        It "Judges passwords correctly self 2" {
            Test-Password2 122234 | Should -BeFalse
        }
        It "Judges passwords correctly self 3" {
            Test-Password2 122255 | Should -BeTrue
        }
        It "Judges passwords correctly self 4" {
            Test-Password2 111145 | Should -BeFalse
        }
    }
}