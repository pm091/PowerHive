Function Get-HiveChannels{
<#
.SYNOPSIS
Retrieves Hive Channels
.DESCRIPTION
Retrieves Hive Cannels
.INPUTS
.OUTPUTS
Outputs Hive Channels
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveChannels
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveChannels.md
#>

    [CmdletBinding()]
    Param()

    Process {
        $nodes = (Get-HiveDevice | Where-Object name -Like Thermo* | Select-Object -ExpandProperty id)
        foreach ($node in $nodes){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/channels/"
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
         $R.channels | ForEach-Object {
                [PSCustomObject]@{
                    Id                  = $_.id
                    Href                = $_.href
                    Links               = $_.links
                    Unit                = $_.unit
                    SupportedOperations = $_.supportedoperations
                }
         }
    }
  }
}