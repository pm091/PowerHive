function ConvertFrom-HiveTime {
<#
.SYNOPSIS
	Provides basic date time conversion for Hive timestamps.
.DESCRIPTION
	Hive uses timestamps in milliseconds past the epoc.
	This helper function converts these times to date time UTC format.
.INPUTS
	Does not take pipeline input.
.OUTPUTS
	DateTime UTC.
#>
	[CmdletBinding()] param (
	[Parameter(Mandatory=$true, Position = 0)]
		[ValidateNotNullOrEmpty()]
		[uint64]$Miliseconds
	)
	$epoc = Get-Date -Date 01/01/1970
	$converted=$epoc.AddMilliseconds($Miliseconds)
	return $converted.GetDateTimeFormats('u')
}