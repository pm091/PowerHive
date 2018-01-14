Function Connect-Hive
{
<#
.SYNOPSIS
Connects to British Gas Hive API and retrieves An Access Token
.DESCRIPTION
The Connect-Hive function is used to connect to the Hive 6.1 API, Hive API returns a unique token to represent the user's credentials for subsequent calls. Acquire a token before running other PowerHive cmdlets.
.INPUTS
Does not take pipeline input.
.OUTPUTS
Hive Session Vairable $Global:HiveHead
.PARAMETER Username
Hive User name
.PARAMETER Password
Hive User Password
.NOTES
Author: @pm091
.EXAMPLE
Connect-Hive -Username useraccount@email
This will connect to Hive with a username of "useraccount@email". The prompt will request a secure password.
.EXAMPLE
Connect-Hive -Username "useraccount@email" -Password (ConvertTo-SecureString "secret" -asplaintext -force)
If you need to pass the password value in the cmdlet directly, use the ConvertTo-SecureString function.
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Connect-Hive.md
#>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true,Position = 1,HelpMessage = 'Hive username')]
        [ValidateNotNullorEmpty()]
        [String]$Username,
        [Parameter(Mandatory = $true,Position = 2,HelpMessage = 'Hive password')]
        [ValidateNotNullorEmpty()]
        [SecureString]$Password

    )

    Process {

        Write-Verbose -Message 'Build the URI'
        $uri = 'https://api-prod.bgchprod.info:443/omnia/auth/sessions'

        Write-Verbose -Message 'Build the JSON body for Auth'
        $head = @{'Content-Type'='application/vnd.alertme.zoo-6.1+json';'Accept'='application/vnd.alertme.zoo-6.1+json';'X-Omnia-Client'='Hive Web Dashboard'}
        $credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password
        $body = @{
            sessions = @(
                @{
                    username = $credentials.username
                    password = $credentials.GetNetworkCredential().Password
                    caller = "WEB"
                }
            )
        }

        Write-Verbose -Message 'Submit the token request'
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Post -Headers $head -Body (ConvertTo-Json -InputObject $body)
        }
        catch
        {
            throw "$_"
        }

        Write-Verbose -Message "Acquired Access token: $r"
        $global:HiveHead = [ordered]@{
            'Content-Type'='application/vnd.alertme.zoo-6.1+json';
            'Accept'='application/vnd.alertme.zoo-6.1+json';
            'X-Omnia-Client'='Hive Web Dashboard';
            'X-Omnia-Access-Token'= $r.sessions.sessionid;
        }

         Write-Verbose -Message "User:$Username Logged in"
    }
}