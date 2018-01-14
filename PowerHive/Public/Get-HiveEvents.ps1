Function Get-HiveEvents
{
<#
.SYNOPSIS
Retrieves hive events
.DESCRIPTION
Retrieves hive events from all the hive devices
.INPUTS
.OUTPUTS
Outputs Hive Event Properties
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveEvents
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveEvents.md
#>

    [CmdletBinding(DefaultParameterSetName="all")]
    Param(
        [Parameter(Mandatory = $true,ParameterSetName = "FilterDays")]
        [uint16]$FilterDays,

        [Parameter(Mandatory = $false,ParameterSetName = "all")]
        [switch]$all

    )
    Process {
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = "https://api-prod.bgchprod.info:443/omnia/events/"
        Write-Verbose -Message 'Submit the request'
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Get -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "Return Request"
        if($PSBoundParameters.ContainsKey('FilterDays')){
        $R.Events | Where-Object {(Get-Date).Subtract((get-date $_.Time)).Days -le $FilterDays} | ForEach-Object {
            [PSCustomObject]@{
              Id         = $_.Id
              Href       = $_.Href
              EventType  = $_.EventType
              Source     = $_.Source
              Time       = $_.Time
              Properties = $_.Properties
               }
        }
     }
     else{
        $R.Events | ForEach-Object {
            [PSCustomObject]@{
              Id         = $_.Id
              Href       = $_.Href
              EventType  = $_.EventType
              Source     = $_.Source
              Time       = $_.Time
              Properties = $_.Properties
               }
        }
     }
    }
  }
}