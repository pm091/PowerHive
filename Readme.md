# PowerHive PowerShell Module [![Build status](https://ci.appveyor.com/api/projects/status/ws4f5f9qojuowo5a?svg=true)](https://ci.appveyor.com/project/pm091/powerhive-tqwo4)


 PowerShell module for Hive British Gas API, control the hive home system from PowerShell

## Get Started With PowerHive

 ```powershell
# Get The Module
Install-Module -Name PowerHive
 ```

### Using The PowerHive Functions

 ```powershell
 # Connect To Hive API , Connect Hive will prompt for credentials, or use get-help connect-hive for details
 Connect-Hive
 # Get Hive Devices
 Get-HiveDevice
 # Get Hive Devices and return all properties
 Get-HiveDevice -Detailed
 # Send hive boost signal
 $Id = "8a6b5d85-9ba2-4adb-9ceb-157c59f9b2ac"
 Set-HiveBoost -ReceiverId $Id -Time 120 -Temperature 22
 ```

#### Exploring PowerHive Functions

 ```powershell
 # Get Commands
 Get-Command -Module PowerHive
 # Recurse help files
 Get-Command -Module PowerHive | ForEach-Object {Get-Help $_.name}
 ```

##### List Of Functions

| CommandType  |   Name  |  Version |  Source |
|--------------|---------|----------|---------|
| Function     | [Connect-Hive](Docs/Connect-Hive.md) | 1.0 | PowerHive |
| Function     | [Disconnect-Hive](Docs/Disconnect-Hive.md) | 1.0 | PowerHive |
| Function     | [Get-HiveActiveLight](Docs/Get-HiveActiveLight.md) | 1.0 | PowerHive |
| Function     | [Get-HiveActivePlug](Docs/Get-HiveActivePlug.md) | 1.0 | PowerHive |
| Function     | [Get-HiveAsscociatedDevice](Docs/Get-HiveAsscociatedDevice.md) | 1.0 | PowerHive |
| Function     | [Get-HiveChannels](Docs/Get-HiveChannels.md) | 1.0 | PowerHive |
| Function     | [Get-HiveContacts](Docs/Get-HiveContacts.md) | 1.0 | PowerHive |
| Function     | [Get-HiveDevice](Docs/Get-HiveDevice.md) | 1.0 | PowerHive |
| Function     | [Get-HiveEvents](Docs/Get-HiveEvents.md) | 1.0 | PowerHive |
| Function     | [Get-HiveReceiver](Docs/Get-HiveReceiver.md) | 1.0 | PowerHive |
| Function     | [Get-HiveTemperature](Docs/Get-HiveTemperature.md) | 1.0 | PowerHive |
| Function     | [Get-HiveThermometer](Docs/Get-HiveThermometer.md) | 1.0 | PowerHive |
| Function     | [Get-HiveTopology](Docs/Get-HiveTopology.md) | 1.0 | PowerHive |
| Function     | [Get-HiveUser](Docs/Get-HiveUser.md) | 1.0 | PowerHive |
| Function     | [Get-HiveWeather](Docs/Get-HiveWeather.md) | 1.0 | PowerHive |
| Function     | [Remove-HiveContact](Docs/Remove-HiveContact.md) | 1.0 | PowerHive |
| Function     | [Set-HiveActiveLight](Docs/Set-HiveActiveLight.md) | 1.0 | PowerHive |
| Function     | [Set-HiveActivePlug](Docs/Set-HiveActivePlug.md) | 1.0 | PowerHive |
| Function     | [Set-HiveBoost](Docs/Set-HiveBoost.md) | 1.0 | PowerHive |
| Function     | [Set-HiveContact](Docs/Set-HiveContact.md) | 1.0 | PowerHive |
| Function     | [Set-HiveTemperature](Docs/Set-HiveTemperature.md) | 1.0 | PowerHive |

###### Future Expansions

Formatting output on some of the functions to provide a better experiance and maybe some added functions around the hive channels etc.

###### Credits

[smartofthehome](http://www.smartofthehome.com/2016/05/hive-rest-api-v6/)

[lwsrbrts/PoSHive](https://github.com/lwsrbrts/PoSHive)

[ukbendavies/PoshHive](https://github.com/ukbendavies/PoshHive)
