Function Get-HiveSession
{
<#
.SYNOPSIS
Gets the current Hive Session
.DESCRIPTION
Gets the current Hive Session, Used to determine that the auth token is still valid
.NOTES
Author: @pm091
.LINK
https://github.com/pm091/powerhive
.EXAMPLE
Get-HiveSession
#>

    [CmdletBinding()]
    Param($ErrorActionPreference = "SilentlyContinue")

    Process {

        Write-Verbose -Message 'Build the URI'
        $uri = 'https://api-prod.bgchprod.info:443/omnia/auth/sessions/'

        Write-Verbose -Message 'Defining Request Variables'
        $HiveSession = $($Global:HiveHead.'X-Omnia-Access-Token')
        $uri = $uri + $HiveSession
        Write-Verbose -Message 'Submit the request'
        $r = Invoke-RestMethod -Uri $uri -Method GET -Headers $Global:HiveHead -ErrorVariable GetHSessionError
        if($GetHSessionError){
            Write-Warning -Message "Hive Session Expired, Please Renew using Connect-Hive";break
        }
        Write-Verbose -Message "Return Request"
        $r.sessions
    }
 }
