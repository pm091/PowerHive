Function Get-HiveActivePlug
{
<#
.SYNOPSIS
Retrieves hive smart plug
.DESCRIPTION
Retrieves hive smart plug devices
.INPUTS
.OUTPUTS
Outputs the Hive Active Plug properties Requires formatting
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveActivePlug
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveActivePlug.md
#>

    [CmdletBinding()]
    Param()
    Process {
        $Session = (Get-hivesession)
        if($Session){
        $nodes = (Get-HiveDevice | Where-Object name -Like SmartPlug* | Select-Object -ExpandProperty id)
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
        $R
   }
  }
 }
}