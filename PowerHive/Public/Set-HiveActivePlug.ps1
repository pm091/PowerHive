Function Set-HiveActivePlug
{
<#
.SYNOPSIS
Sets Power state on Active plug
.DESCRIPTION
Sets the power state on the Activeplug supplied to the ActivePlugID parameter
.INPUTS
Accepts Pipeline input from Get-HiveDevice
.OUTPUTS
.PARAMETER ActivePlugID
The uniqe ID of the Active Plug to change the power state on, allows multiple id's to be supplied
.PARAMETER PowerState
The desired power state
.NOTES
Author: @pm091
.EXAMPLE
Turns off hive active lightbulb of supplied id

Set-HiveActivePlug -ActivePlugID 7bf977c0-93ba-4a58-a78a-1ef0d317dd1b -PowerState OFF
.EXAMPLE
Turns off all hive active lightbulbs

Get-HiveDevice | Where-Object name -Like SmartPlug* | Select-Object -ExpandProperty id | Set-HiveActivePlug -PowerState OFF
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Set-HiveActivePlug.md
#>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
    Param(
        [Parameter(Mandatory = $true,Position = 1,ValueFromPipeline = $true,HelpMessage = 'Hive Active Plug ID')]
        [ValidateNotNullorEmpty()]
        [guid[]]$ActivePlugID,

        [Parameter(Mandatory = $true,Position = 2,HelpMessage = 'Desired Power State')]
        [ValidateNotNullorEmpty()]
        [ValidateSet("ON","OFF")]
        [string]$PowerState
    )

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        foreach($S in $ActivePlugID){
        $uri = "https://api-prod.bgchprod.info:443/omnia/nodes/$S"
        Write-Verbose -Message 'Build the JSON body'
        $body = @{
            nodes = @(
                @{
                    "attributes" = @{
                    "state" = @{
                    "targetValue" = $PowerState.ToUpper()
                        }
                    }
                }
            )
        }
        Write-Verbose -Message "Setting $ActivePlugID to powerstate : $Powerstate"
        if($PSCmdlet.ShouldProcess($ActivePlugID)){
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Put -Headers $global:HiveHead -Body (ConvertTo-Json -InputObject $body -Depth 4)
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "Powerstate : $Powerstate set on $ActivePlugID"
        $R.nodes
    }
    else {
        Write-Verbose -Message "User aborted confirm action"
    }
     }
    }
  }
}