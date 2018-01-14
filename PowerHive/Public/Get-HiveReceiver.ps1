Function Get-HiveReceiver
{
<#
.SYNOPSIS
Retrieves Hive Receiver details
.DESCRIPTION
Retrieves Hive Receiver details
.INPUTS
.OUTPUTS
Outputs Hive Reciever Properties
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveReceiver
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveReceiver.md
#>

    [CmdletBinding()]
    Param()
    Process {
        Get-HiveDevice | Where-Object {$_.name -like "receiver*"}
 }
}