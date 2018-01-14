Function Get-HiveDevice
{
<#
.SYNOPSIS
Retrieves Hive Devices
.DESCRIPTION
Retrieves Hive Devices
.INPUTS
.OUTPUTS
Outputs Hive Device Properties
.PARAMETER Detailed
If the Detailed Switch is used all device properties will be returned
.NOTES
Author: @pm091
.EXAMPLE
Get-HiveDevice
.Example
Get-HiveDevice -Detailed
.LINK
https://github.com/pm091/PowerHive/blob/master/Docs/Get-HiveDevice.md
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$detailed

    )

    Process {
        #Test Auth
        $Session = (Get-hivesession)
        if($Session){
        Write-Verbose -Message 'Build the URI'
        $uri = 'https://api-prod.bgchprod.info:443/omnia/nodes/'
        Write-Verbose -Message 'Submit the request'
        try
        {
            $r = Invoke-RestMethod -Uri $uri -Method Get -Headers $Global:HiveHead
        }
        catch
        {
            throw "$_"
        }
        Write-Verbose -Message "Request returned"
        if($PSBoundParameters.ContainsKey('detailed')){
        $R.nodes | ForEach-Object {
                [PSCustomObject][ordered]@{
                PSTypeName = 'Hive.Device.Detailed'
                Name          = $_.Name
                Id            = $_.Id
                Href          = $_.Href
                NodeType      = $_.NodeType
                ParentNodeId  = $_.ParentNodeId
                LastSeen      = (ConvertFrom-HiveTime $_.LastSeen)
                CreatedOn     = (ConvertFrom-HiveTime $_.CreatedOn)
                UserId        = $_.UserId
                OwnerId       = $_.OwnerId
                Relationships = $_.Relationships
                Attributes    = $_.Attributes
                }
            }
          }
          else{
            $R.nodes | ForEach-Object {
                [PSCustomObject][ordered]@{
                PSTypeName = 'Hive.Device'
                Name = $_.Name
                Id   = $_.Id
                Href = $_.Href

                }
            }
          }
        }
    }
}