Function Get-HiveActiveLight
{
<#
.SYNOPSIS
Retrieves Hive Active Light
.DESCRIPTION
Retrieves Hive Active Light Devices
.INPUTS
.OUTPUTS
Outputs the Hive Active Light properties Requires formatting
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveActiveLight
.LINK
https://github.com/pm091/powerhivehttps://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveActiveLight.md
#>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$detailed
    )
    Process {
        $Session = (Get-hivesession)
        if($Session){
        $nodes = (Get-HiveDevice | Where-Object name -Like "*light*" | Select-Object -ExpandProperty id)
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
        Write-Verbose -Message "Return Request"
        $R
   }
  }
 }
}