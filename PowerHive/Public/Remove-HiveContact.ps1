Function Remove-HiveContact
{
<#
.SYNOPSIS
Removes Hive Contact
.DESCRIPTION
Removes Hive Contact
.PARAMETER ID
ID of Hive Contact to remove
.INPUTS
Accepts Pipeline input from Get-HiveContact
.OUTPUTS
.NOTES
Author: @pm091
.EXAMPLE
Remove-HiveContact -ID ccac1d4b-6a1b-4011-81f5-e67c1c817ba3 -Confirm:$false
.EXAMPLE
Get-HiveContact | Select-Object -ExpandProperty ID | Remove-HiveContact  -Confirm:$false
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Remove-HiveContact.md
#>

[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
    Param(
        [Parameter(Mandatory = $true,Position = 1,ValueFromPipeline = $true,HelpMessage = 'Contact Name')]
        [ValidateNotNullorEmpty()]
        [guid]$ID
    )

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/contacts/$ID"
        Write-Verbose -Message 'Build the JSON body'
        Write-Verbose -Message "Removing Contact : $ID"
        if($PSCmdlet.ShouldProcess($ID)){
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Delete -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "$ID Removed"
     }
     else {
         Write-Verbose -Message "User aborted confirm action"
     }
    }
  }
}