function Get-HiveAsscociatedDevice
{
<#
.SYNOPSIS
Gets Linked Management Devices
.DESCRIPTION
Retrieves list of devices where the hive management app is installed
.INPUTS
.OUTPUTS
Outputs Linked Devices
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveThermometer
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveAsscociatedDevice.md
#>

    [CmdletBinding()]
    param ()
    process{
        $Session = (Get-hivesession)
        if($Session){
        if((Get-HiveUser).latestsuppoortedversion -le 6.4){
            Write-Warning "Get-HiveAsscociatedDevice Requires the lastest supported api version to be above 6.4"; break
        }
        Write-Verbose -Message 'Build the URI'
        $uri = 'https://api-prod.bgchprod.info:443/omnia/deviceTokens'
        Write-Verbose -Message 'Submit the request'
        try{

            $r = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Global:HiveHead
            }
        catch{
            throw $_
            }
        Write-Verbose -Message 'return the request'
        $r.deviceTokens
  }
 }
}