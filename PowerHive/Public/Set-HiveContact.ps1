Function Set-HiveContact
{
<#
.SYNOPSIS
Creates a New Hive Contact
.DESCRIPTION
Creates a New Hive Contact
.INPUTS
.OUTPUTS
List Properties of new contact
.PARAMETER Name
Set Hive Contact Name
.PARAMETER EMail
Set Hive Contact Email
.NOTES
Author: @pm091
.EXAMPLE
Set-HiveContact -Name "Contact Name" -Email "Contact@email"
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Set-HiveContact.md
#>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
    Param(
        [Parameter(Mandatory = $true,Position = 1,ValueFromPipeline = $true,HelpMessage = 'Contact Name')]
        [ValidateNotNullorEmpty()]
        [string]$Name,

        [Parameter(Mandatory = $true,Position = 2,HelpMessage = 'Contact Email')]
        [ValidateNotNullorEmpty()]
        [string]$Email
    )

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/contacts/"
        Write-Verbose -Message 'Build the JSON body'
        $body = @{
            contacts = @(
                @{
                    name    = "$Name"
                    email   = "$Email"
                }
            )
        }
        if($PSCmdlet.ShouldProcess($Name)){
        Write-Verbose -Message "Creating Hive Contact: $name $email"
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Post -Headers $Global:HiveHead -Body (ConvertTo-Json -InputObject $body -Depth 4)
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "Contact: $name Created"
        $R.contacts | Format-List
    }
    else {
        Write-Verbose -Message "User aborted confirm action"
    }
      }
    }
}