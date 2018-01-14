---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Set-HiveBoost

## SYNOPSIS
Sends Boost signal to Hive Heating System

## SYNTAX

```
Set-HiveBoost [-ReceiverId] <Guid> [[-Time] <UInt16>] [[-Temperature] <UInt16>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Sends Boost signal to Hive Heating System with supplied parameters

## EXAMPLES

### EXAMPLE 1
```
Set-HiveBoost -ReceiverId $ID -Time 120 -Temperature 22
```

### EXAMPLE 2
```
(Get-HiveDevice | Where-Object name -Like rec*)[0] | Select-Object -ExpandProperty id | Set-HiveBoost -Time 120 -Temperature 22
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

### -Time
The Desired Boost time in minutes in intervals of 30

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 120
Accept pipeline input: False
Accept wildcard characters: False
```

### -Temperature
The New Temperature in Celcius EG.
for 22°C -Temperature 22

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 22
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

