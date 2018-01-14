function Get-HiveWeather {
<#
.SYNOPSIS
Provides basic temperature reading from the Hive Weather API
.DESCRIPTION
Uses a PostCode to retrieve current outside temperature.
By default the users postcode is used in the query, this can
be overridden using the PostCode parameter.
.INPUTS
Does not take pipeline input.
.OUTPUTS
Hive Weather Properties
.PARAMETER PostCode
UK Postcode
.EXAMPLE
Get-HiveWeather
.Example
Get-HiveWeather -PostCode SW12

Weather Icon        : clear_sky
Outside Weather     : Clear
Outside Temperature : 6.0 °C
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveWeather.md
#>
    [CmdletBinding()]
    param (
	[Parameter(Mandatory=$false, Position = 0)]
	[ValidateNotNullOrEmpty()]
	[string] $PostCode
	)
	$Uri = 'http://weather-prod.bgchprod.info/weather'

	if ($PSBoundParameters.ContainsKey('PostCode')) {
		$query = '?postcode=' + $PostCode
	} else {
		$user = (Get-HiveUser)
		$query = '?postcode=' + $user.postcode
	}
	$weatherHead = [ordered]@{
		'Content-Type'='application/vnd.alertme.zoo-6.1+json'
		'Accept'='application/vnd.alertme.zoo-6.1+json'
		'X-Omnia-Client'='Hive Web Dashboard'
	}
	$Uri = $Uri + $query
	$r = Invoke-RestMethod -Method Get -Uri $Uri -Headers $weatherHead
	$r.weather | ForEach-Object {
		[pscustomobject]@{
			PSTypeName            = "Hive.Weather"
			'Weather Icon'		  = $_.icon
			'Outside Weather'     = $_.description
			'Outside Temperature' = '{0} °{1}' -f $_.temperature.Value,$_.Temperature.unit

		}
	}
}