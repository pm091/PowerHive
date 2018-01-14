---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Set-HiveActiveLight

## SYNOPSIS
Set properties on a specific Hive light.

## SYNTAX

```
Set-HiveActiveLight [-ActiveLightId] <Guid> [[-PowerState] <String>] [[-ColourMode] <String>] [[-Hue] <UInt16>]
 [[-Brightness] <UInt16>] [[-ColourTemperature] <UInt16>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Update specified Hive light with new desired state that can include a combination of:
Brightness, Hue, PowerState, ColourMode and ColourTemperature

## EXAMPLES

### EXAMPLE 1
```
Set-HiveActiveLight -ActiveLightID $ID -PowerState OFF
```

### EXAMPLE 2
```
Set-HiveActiveLight -ActiveLightID $ID -ColourMode TUNABLE -ColourTemperature 1200
```

### EXAMPLE 3
```
Set-HiveActiveLight -ActiveLightID $ID -ColourMode COLOUR -Hue 255
```

### EXAMPLE 4
```
Turns on all hive active light bulbs
```

Get-HiveDevice | Where-Object name -Like "*light*" | Select-Object -ExpandProperty id | Set-HiveActiveLight -PowerState ON

## PARAMETERS

### -ActiveLightId
ID of Hive Active Light Bulb

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PowerState
Desired Power state of the bulb

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColourMode
Desired colour mode of the bulb

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hue
Desired hue colour of the bulb

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Brightness
Desired brightness of the bulb

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColourTemperature
Desired colour temperature of the bulb

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 2700
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Accepts Pipeline input from Get-HiveDevice

### Accepts pipeline input from Get-HiveDevice

## OUTPUTS

## NOTES
Author: @pm091

## RELATED LINKS

[https://github.com/pm091/powerhive](https://github.com/pm091/powerhive)

