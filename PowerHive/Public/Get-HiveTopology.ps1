function Get-HiveTopology
{
<#
.SYNOPSIS
Returns hive topology
.DESCRIPTION
Returns topology for all hubs and devices associated with customer
.INPUTS
.OUTPUTS
Outputs Hive Topology Properties
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveToplogy
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveTopology.md
#>

    [CmdletBinding()]
    Param()
    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/topology/"
        Write-Verbose -Message 'Submit the request'
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Get -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "Return Request"
        $R.topology.sender
    }
  }
}