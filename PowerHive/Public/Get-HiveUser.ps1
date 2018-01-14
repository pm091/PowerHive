Function Get-HiveUser
{
<#
.SYNOPSIS
Gets Hive User 
.DESCRIPTION
Get The Detials for the Hive User Account
.INPUTS
.OUTPUTS
 Hive User Properties
.PARAMETER Detailed
If the Detailed Switch is used all user properties will be returned
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveUser
.EXAMPLE
Get-HiveUser -Detailed
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveUser.md
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$detailed
    )

    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = 'https://api-prod.bgchprod.info:443/omnia/users/'
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
        if($PSBoundParameters.ContainsKey('detailed')){
         $R.users | ForEach-Object {
                [PSCustomObject]@{
                    Id                        = $_.id
                    Href                      = $_.href
                    UserName                  = $_.username
                    Email                     = $_.email
                    FirstName                 = $_.firstName
                    LastName                  = $_.lastName
                    Mobile                    = $_.mobile
                    Phone                     = $_.phone
                    Postcode                  = $_.postcode
                    Country                   = $_.country
                    CountryCode               = $_.countryCode
                    City                      = $_.city
                    Address                   = $_.address
                    Locale                    = $_.locale
                    TimeZone                  = $_.timeZone
                    PartnerId                 = $_.partnerId
                    LatestSupportedApiVersion = $_.latestSupportedApiVersion
                    Permissions               = $_.permissions
                    ExtCustomerLevel          = $_.extCustomerLevel
                    AlertSettings             = $_.alertSettings
                    ExternalUserId            = $_.externalUserId
                    Group                     = $_.group
                    TemperatureUnit           = $_.temperatureUnit
                    Longitude                 = $_.longitude
                    Latitude                  = $_.latitude
                }
         }
      }
      else {
        $R.users | ForEach-Object {
            [PSCustomObject]@{
                Id                        = $_.id
                UserName                  = $_.username
                Email                     = $_.email
                FirstName                 = $_.firstName
                LastName                  = $_.lastName
                Mobile                    = $_.mobile
                Phone                     = $_.phone
                Postcode                  = $_.postcode
                Address                   = $_.address
                LatestSupportedApiVersion = $_.latestSupportedApiVersion
                TemperatureUnit           = $_.temperatureUnit
                Longitude                 = $_.longitude
                Latitude                  = $_.latitude
            }
     }
      }
    }
  }
}