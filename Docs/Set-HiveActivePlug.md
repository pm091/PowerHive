---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Set-HiveActivePlug

## SYNOPSIS
Sets Power state on Active plug

## SYNTAX

```
Set-HiveActivePlug [-ActivePlugID] <Guid[]> [-PowerState] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the power state on the Activeplug supplied to the ActivePlugID parameter

## EXAMPLES

### EXAMPLE 1
```
Turns off hive active lightbulb of supplied id
```

Set-HiveActivePlug -ActivePlugID 7bf977c0-93ba-4a58-a78a-1ef0d317dd1b -PowerState OFF

### EXAMPLE 2
```
Turns off all hive active lightbulbs
```

Get-HiveDevice | Where-Object name -Like SmartPlug* | Select-Object -ExpandProperty id | Set-HiveActivePlug -PowerState OFF

## PARAMETERS

### -ActivePlugID
The uniqe ID of the Active Plug to change the power state on, allows multiple id's to be supplied

```yaml
Type: Guid[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PowerState
The desired power state

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
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

