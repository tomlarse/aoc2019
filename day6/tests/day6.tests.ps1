Describe "Day 6 Tests" {
    . .\day6\day6.ps1

    Context "Part 1" {
        It "Calculates correct Orbit Count Checksum" {
            Get-OrbitCountChecksum (New-PlanetMap @("COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L")) | Should -Be 42
        }
    }
}