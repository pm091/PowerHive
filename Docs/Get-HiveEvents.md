---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/PowerHive
schema: 2.0.0
---

# Get-HiveEvents

## SYNOPSIS
Retrieves hive events

## SYNTAX

### all (Default)
```
Get-HiveEvents [-all] [<CommonParameters>]
```

### FilterDays
```
Get-HiveEvents -FilterDays <UInt16> [<CommonParameters>]
```

## DESCRIPTION
Retrieves hive events from all the hive devices

## EXAMPLES

### EXAMPLE 1
```
Get-HiveEvents
```

## PARAMETERS

### -FilterDays
{{Fill FilterDays Description}}

```yaml
Type: UInt16
Parameter Sets: FilterDays
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -all
{{Fill all Description}}

```yaml
Type: SwitchParameter
Parameter Sets: all
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Outputs Hive Event Properties

## NOTES
Author: @pm091

## RELATED LINKS

[https://github.com/pm091/PowerHive](https://github.com/pm091/PowerHive)

