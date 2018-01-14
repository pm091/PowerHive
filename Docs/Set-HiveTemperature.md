---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Set-HiveTemperature

## SYNOPSIS
Sets Temperature

## SYNTAX

```
Set-HiveTemperature [-ReceiverId] <Guid> [-Temperature] <UInt16> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the temperature on the thermometer supplied to the thermostat parameter

## EXAMPLES

### EXAMPLE 1
```
Set-HiveThermometer -ReceiverId $ID -Temperature 22
```

### EXAMPLE 2
```
(Get-HiveDevice | Where-Object name -Like rec*)[0] | Select-Object -ExpandProperty id | Set-HiveThermometer -Temperature 22
```

## PARAMETERS

### -ReceiverId
The Uniqe ID of the Receiver to change the temperature on

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Temperature
The New Temperature in Celcius EG.
for 22°C -Temperature 22

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: 0
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

## OUTPUTS

## NOTES
Author: @pm091

## RELATED LINKS

[https://github.com/pm091/powerhive](https://github.com/pm091/powerhive)

