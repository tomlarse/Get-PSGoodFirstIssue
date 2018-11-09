$ModuleManifestName = 'Get-PSGoodFirstIssue.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\Get-PSGoodFirstIssue\$ModuleManifestName"

Import-Module $ModuleManifestPath

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

