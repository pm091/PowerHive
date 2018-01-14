Function Set-HiveBoost
{
<#
.SYNOPSIS
Sends Boost signal to Hive Heating System
.DESCRIPTION
Sends Boost signal to Hive Heating System with supplied parameters
.INPUTS
Accepts Pipeline input from Get-HiveDevice
.OUTPUTS
.PARAMETER ReceiverId
The Uniqe ID of the Receiver to change the temperature on
.PARAMETER Time
The Desired Boost time in minutes in intervals of 30
.PARAMETER Temperature
The New Temperature in Celcius EG. for 22°C -Temperature 22
.NOTES
Author: @pm091
.EXAMPLE
Set-HiveBoost -ReceiverId $ID -Time 120 -Temperature 22
.EXAMPLE
(Get-HiveDevice | Where-Object name -Like rec*)[0] | Select-Object -ExpandProperty id | Set-HiveBoost -Time 120 -Temperature 22
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Set-HiveBoost.md
#>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
    Param(
        [Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true, HelpMessage = 'Hive Thermostat')]
        [ValidateNotNullorEmpty()]
        [guid]$ReceiverId,

        [Parameter(Mandatory = $false, Position = 2, HelpMessage = 'Desired Boost Time')]
        [ValidateNotNullorEmpty()]
        [uint16]$Time = 120,

        [Parameter(Mandatory = $false, Position = 2, HelpMessage = 'Desired Temperature')]
        [ValidateNotNullorEmpty()]
        [uint16]$Temperature = 22
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
                    "activeHeatCoolMode" = @{
                         "targetValue" = "BOOST"
                        }
                        "scheduleLockDuration" =@{
                            "targetValue" = $Time
                        }
                        "targetHeatTemperature" =@{
                            "targetValue" = $Temperature
                        }
                    }
                }
            )
        }

        Write-Verbose -Message "Setting boost for $time minutes at $temperature"
        if($PSCmdlet.ShouldProcess($ReceiverId))
        {
             try
             {
                 $r = Invoke-RestMethod -Uri $uri -Method Put -Headers $global:HiveHead -Body (ConvertTo-Json -InputObject $body -Depth 4)
             }
             catch
             {
                 throw "$_"
             }
             Write-Verbose -Message "Boost Set at $temperature for $time"
             $R.nodes
        }
        else
        {
            Write-Verbose -Message "User aborted confirm action"
        }
    }
  }
}