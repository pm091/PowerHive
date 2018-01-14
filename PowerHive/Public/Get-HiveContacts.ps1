Function Get-HiveContacts
{
<#
.SYNOPSIS
Retrieves hive contacts
.DESCRIPTION
Retrieves hive contacts name and email
.INPUTS
.OUTPUTS
Outputs Hive Contacts
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveContacts
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveContacts.md
#>

    [CmdletBinding()]
    Param()

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/contacts/"
        Write-Verbose -Message "Submit the request"
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method GET -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }

        Write-Verbose -Message "Return Request"

         $R.contacts | ForEach-Object{
             [pscustomobject][ordered]@{
                 Id    = $_.Id
                 Name  = $_.Name
                 Email = $_.email
                 Href  = $_.href


             }
         }
    }
  }
}