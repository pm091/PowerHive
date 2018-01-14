Function Disconnect-Hive
{
<#
.SYNOPSIS
Disconnects Hive Session
.DESCRIPTION
Deletes Hive Session and clears the $Global:HiveHead variable
.INPUTS
.OUTPUTS
.NOTES
Author: @pm091
.EXAMPLE
Disconnect-Hive
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Disconnect-Hive.md
#>

    [CmdletBinding()]
    Param()

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = 'https://api-prod.bgchprod.info:443/omnia/auth/sessions/'

        Write-Verbose -Message 'Build the Request'
        $HiveSession = $($Global:HiveHead.'X-Omnia-Access-Token')
        $uri = $uri + $HiveSession
        Write-Verbose -Message 'Submit the request'
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method DELETE -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "HiveLogged off..... removing Access Token"
        $Global:HiveHead.Clear()
    }
    $Global:HiveHead.Clear()
   }
 }
