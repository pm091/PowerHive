Function Set-HiveTemperature
{
<#
.SYNOPSIS
Sets Temperature
.DESCRIPTION
Sets the temperature on the thermometer supplied to the ReceiverId parameter
.INPUTS
Accepts Pipeline input from Get-HiveDevice
.OUTPUTS
.PARAMETER ReceiverId
The Uniqe ID of the Receiver to change the temperature on
.PARAMETER Temperature
The New Temperature in Celcius EG. for 22°C -Temperature 22
.NOTES
Author: @pm091
.EXAMPLE
Set-HiveThermometer -ReceiverId $ID -Temperature 22
.EXAMPLE
(Get-HiveDevice | Where-Object name -Like rec*)[0] | Select-Object -ExpandProperty id | Set-HiveThermometer -Temperature 22
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Set-HiveTemperature.md
#>
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
    Param(
        [Parameter(Mandatory = $true,Position = 1,ValueFromPipeline = $true,HelpMessage = 'Hive Thermostat')]
        [ValidateNotNullorEmpty()]
        [guid]$ReceiverId,

        [Parameter(Mandatory = $true,Position = 2,HelpMessage = 'Desired Temperature')]
        [ValidateNotNullorEmpty()]
        [uint16]$Temperature
    )

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/nodes/$ReceiverId"
        Write-Verbose -Message 'Build the JSON body'
        $body = @{
            nodes = @(
                @{
                    "attributes" = @{
                    "targetHeatTemperature" = @{
                    "targetValue" = $Temperature
                        }
                    }
                }
            )
        }
        Write-Verbose -Message "Setting Temperature on $ReceiverId to : $temperature"
        if($PSCmdlet.ShouldProcess($ReceiverId)){
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Put -Headers $global:HiveHead -Body (ConvertTo-Json -InputObject $body -Depth 4)
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "Temperature set to : $temperature on $ReceiverId"
        $R.nodes
    }
    else {
        Write-Verbose -Message "User aborted confirm action"
    }
    }
  }
}