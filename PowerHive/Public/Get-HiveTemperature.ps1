Function Get-HiveTemperature
{
<#
.SYNOPSIS
Gets current hive temperature
.DESCRIPTION
Gets the current hive temperature and reported time values
.INPUTS
.OUTPUTS
Outputs Hive Temperature Properties
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveTemperature
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveTemperature.md
#>

    [CmdletBinding()]
    Param()

    Process {
        $temp = (Get-HiveDevice -detailed | Where-Object {$_.name -like "receiver*"} | Select-Object -ExpandProperty Attributes | Where-Object {$_.Temperature.reportedValue -gt 1} | Select-Object Temperature)
        $temp.Temperature | ForEach-Object {
                [pscustomobject]@{
                PSTypeName = 'Hive.Receiver.Temperature'
                ReportedValue       = '{0} °C' -f $_.reportedValue
                DisplayValue        = '{0} °C' -f $_.displayValue
                ReportReceivedTime  = (ConvertFrom-HiveTime $_.reportReceivedTime)
                ReportChangedTime   = (ConvertFrom-HiveTime $_.reportChangedTime)
            }
        }
 }
}