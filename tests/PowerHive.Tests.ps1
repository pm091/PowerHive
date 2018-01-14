$ModuleManifestName = 'PowerHive.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\PowerHive\$ModuleManifestName"
Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath
        $? | Should Be $true
    }
}

Describe 'Module Import Tests' {
    It 'Passes Import-Module' {
        Import-Module $ModuleManifestPath
        $getmodule = (Get-module -Name PowerHive)
        $getmodule | Should Not Be $null
    }
}


Describe -Name 'Testing PSScriptAnalyzer rules' {
    Context 'PS ScriptAnalyzer Rule Check' {
        $AnalyzerIssues = Invoke-ScriptAnalyzer -Path "$PSScriptRoot\..\PowerHive\*" -Settings PSGallery -ExcludeRule PSAvoidGlobalVars, PSUseDeclaredVarsMoreThanAssignments, PSUseToExportFieldsInManifest, PSUseSingularNouns
        $ScriptAnalyzerRuleNames = Get-ScriptAnalyzerRule | Select-Object -ExpandProperty RuleName
        forEach ($Rule in $ScriptAnalyzerRuleNames) {
            It "Should pass $Rule" {
                $Failures = $AnalyzerIssues | Where-Object -Property RuleName -EQ -Value $rule
                ($Failures | Measure-Object).Count | Should Be 0
            }
        }
    }
}

Describe -Name 'Testing Module Help Output'{
    context 'Testing Module Help'{
        $Help = Get-Command -Module PowerHive | ForEach-Object {Get-Help $_.name}
        foreach ($h in $Help){
            It "$($h.name) Should Provide Help" {
                $h | Should Not Be $null
            }
        }
    }
}

