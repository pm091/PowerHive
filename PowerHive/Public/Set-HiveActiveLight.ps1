function Set-HiveActiveLight
{
<#
.SYNOPSIS
Set properties on a specific Hive light.
.DESCRIPTION
Update specified Hive light with new desired state that can include a combination of:
Brightness, Hue, PowerState, ColourMode and ColourTemperature
.INPUTS
Accepts Pipeline input from Get-HiveDevice
.OUTPUTS
.PARAMETER ActiveLightId
ID of Hive Active Light Bulb
.PARAMETER PowerState
Desired Power state of the bulb
.PARAMETER ColourMode
Desired colour mode of the bulb
.PARAMETER Hue
Desired hue colour of the bulb
.PARAMETER Brightness
Desired brightness of the bulb
.PARAMETER ColourTemperature
Desired colour temperature of the bulb
.NOTES
Author: @pm091
.INPUTS
Accepts pipeline input from Get-HiveDevice
.OUTPUTS
.EXAMPLE
Set-HiveActiveLight -ActiveLightID $ID -PowerState OFF
.EXAMPLE
Set-HiveActiveLight -ActiveLightID $ID -ColourMode TUNABLE -ColourTemperature 1200
.EXAMPLE
Set-HiveActiveLight -ActiveLightID $ID -ColourMode COLOUR -Hue 255
.EXAMPLE
Turns on all hive active light bulbs
Get-HiveDevice | Where-Object name -Like "*light*" | Select-Object -ExpandProperty id | Set-HiveActiveLight -PowerState ON
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Set-HiveActiveLight.md
#>
	[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
	param(
	[Parameter(Mandatory = $true, Position = 0,
		ValueFromPipelineByPropertyName = $true)]
	[guid] $ActiveLightId,

	[Parameter(Mandatory = $false, Position = 1)]
	[ValidateSet('ON', 'OFF')]
	[string] $PowerState,

	[Parameter(Mandatory = $false, Position = 2)]
	[ValidateSet('COLOUR', 'TUNABLE')]
	[string] $ColourMode,

	[Parameter(Mandatory = $false, Position = 3)]
	[ValidateRange(0, 355)]
	[uint16] $Hue = 0,

	[Parameter(Mandatory = $false, Position = 4)]
	[ValidateRange(5, 100)]
	[uint16] $Brightness = 5,

	[Parameter(Mandatory = $false, Position = 5)]
	[ValidateRange(2700, 6533)]
	[uint16] $ColourTemperature = 2700
	)
	$uri = "https://api-prod.bgchprod.info:443/omnia/nodes/$ActiveLightID"
	process{
	if ($PSBoundParameters.ContainsKey('PowerState')) {
		if ($pscmdlet.ShouldProcess($PowerState)) {
			$body = @{
				nodes = @(
					@{
						"attributes" = @{
						"state" = @{
						"targetValue" = $PowerState.ToUpper()
							}
						}
					}
				)
			}
		} else {
			Write-Verbose "User aborted confirm action."
			return
		}
	}
	if ($PSBoundParameters.ContainsKey('ColourMode')) {
		switch ($ColourMode) {
			'COLOUR' {
				$body = @{
					nodes = @(
						@{
							"attributes" = @{
							"colourmode" = @{
							"targetValue" = $ColourMode
							}
							"hsvHue" = @{
							"targetValue" = $Hue
								}
							}
						}
					)
				}
			Write-Verbose "Setting colour temperature to new value: $Hue"
			}
			'TUNABLE'{
				$body = @{
					nodes = @(
						@{
							"attributes" = @{
							"colourmode" = @{
								"targetValue" = $ColourMode
							}
							"colourTemperature" = @{
							"targetValue" = $ColourTemperature
								}
							}
						}
					)
				}
				Write-Verbose "Setting colour temperature to new value: $ColourTemperature"
			}
		}
	}
	if ($PSBoundParameters.ContainsKey('Brightness')) {
		$body = @{
				nodes = @(
					@{
						"attributes" = @{
						"brightness" = @{
						"targetValue" = $Brightness
							}
						}
					}
				)
			}
	}
	$r = Invoke-WebRequest -UseBasicParsing -Method Put -Uri $Uri -Headers $HiveHeaders -Body (ConvertTo-Json $nodes -Depth 4)
	$r.nodes
 }
}