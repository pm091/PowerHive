Function Get-HiveThermometer
{
<#
.SYNOPSIS
Retrieves Hive Thermometer details
.DESCRIPTION
Retrieves Hive Thermometer details
.INPUTS
.OUTPUTS
Outputs Hive Thermometer Properties
.PARAMETER Detailed
If the Detailed Switch is used all Thermometer properties will be returned
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveThermometer
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveThermometer.md
#>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$detailed

    )

    Process {
        $Session = (Get-hivesession)
        if($Session){
        $nodes = (Get-HiveDevice | Where-Object name -Like Thermo* | Select-Object -ExpandProperty id)
        foreach ($node in $nodes){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/nodes/$node"
        Write-Verbose -Message 'Submit the request'
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Get -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }

        Write-Verbose -Message "Return request"
        foreach ($Node in $R.Nodes){
        if($PSBoundParameters.ContainsKey('detailed')){
         $node | ForEach-Object {
            [PSCustomObject]@{
            PSTypeName       = "Hive.Thermometer.Detailed"
            nativeIdentifier = $_.nativeIdentifier
            LQI              = $_.LQI
            batteryVoltage   = $_.batteryVoltage
            nodeType         = $_.nodeType
            powerSupply      = $_.powerSupply
            manufacturer     = $_.manufacturer
            RSSI             = $_.RSSI
            protocol         = $_.protocol
            macAddress       = $_.macAddress
            lastSeen         = (ConvertFrom-HiveTime $_.lastSeen)
            thermostat       = $_.thermostat
            batteryState     = $_.batteryState
            model            = $_.model
            presence         = $_.presence
            softwareVersion  = $_.softwareVersion
            batteryLevel     = $_.batteryLevel
            }
        }

      }
      else {
        $node | ForEach-Object {
            [PSCustomObject]@{
            PSTypeName       = "Hive.Thermometer"
            nodeType         = $_.nodeType
            lastSeen         = (ConvertFrom-HiveTime $_.lastSeen)
            }
        }
     }
    }
   }
  }
 }
}