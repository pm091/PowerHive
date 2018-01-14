---
Module Name: PowerHive
Module Guid: 2f93c963-78a3-470c-90f3-8333002475ab
Download Help Link: {{Please enter FwLink manually}}
Help Version: {{Please enter version of help manually (X.X.X.X) format}}
Locale: en-GB
---

# PowerHive Module
## Description
{{Manually Enter Description Here}}

## PowerHive Cmdlets
### [Connect-Hive](Connect-Hive.md)
{{The Connect-Hive function is used to connect to the Hive 6.1 API, Hive API returns a unique token to represent the user's credentials for subsequent calls.
Acquire a token before running other PowerHive cmdlets.}}

### [Disconnect-Hive](Disconnect-Hive.md)
{{Deletes Hive Session and clears the $Global:HiveHead variable}}

### [Get-HiveActiveLight](Get-HiveActiveLight.md)
{{Retrieves Hive Active Light Devices}}}

### [Get-HiveActivePlug](Get-HiveActivePlug.md)
{{Retrieves hive smart plug devices}}

### [Get-HiveAsscociatedDevice](Get-HiveAsscociatedDevice.md)
{{Retrieves list of devices where the hive management app is installed}}

### [Get-HiveChannels](Get-HiveChannels.md)
{{Retrieves Hive Cannels}}

### [Get-HiveContacts](Get-HiveContacts.md)
{{Retrieves hive contacts name and email}}

### [Get-HiveDevice](Get-HiveDevice.md)
{{Retrieves Hive Devices}}

### [Get-HiveEvents](Get-HiveEvents.md)
{{Retrieves hive events from all the hive devices}}

### [Get-HiveReceiver](Get-HiveReceiver.md)
{{Retrieves Hive Receiver details}}

### [Get-HiveTemperature](Get-HiveTemperature.md)
{{Gets the current hive temperature and reported time values}}

### [Get-HiveThermometer](Get-HiveThermometer.md)
{{Retrieves Hive Thermometer details}}

### [Get-HiveTopology](Get-HiveTopology.md)
{{Returns topology for all hubs and devices associated with customer}}

### [Get-HiveUser](Get-HiveUser.md)
{{Get The Detials for the Hive User Account}}

### [Get-HiveWeather](Get-HiveWeather.md)
{{Uses a PostCode to retrieve current outside temperature.
By default the users postcode is used in the query, this can
be overridden using the PostCode parameter}}

### [Remove-HiveContact](Remove-HiveContact.md)
{{Removes Hive Contact}}

### [Set-HiveActiveLight](Set-HiveActiveLight.md)
{{Update specified Hive light with new desired state that can include a combination of:
Brightness, Hue, PowerState, ColourMode and ColourTemperature}}

### [Set-HiveActivePlug](Set-HiveActivePlug.md)
{{Sets the power state on the Activeplug supplied to the ActivePlugID parameter}}

### [Set-HiveBoost](Set-HiveBoost.md)
{{Sends Boost signal to Hive Heating System with supplied parameters}}

### [Set-HiveContact](Set-HiveContact.md)
{{Creates a New Hive Contact}}

### [Set-HiveTemperature](Set-HiveTemperature.md)
{{Sets the temperature on the thermometer supplied to the ReceiverId parameter}}

