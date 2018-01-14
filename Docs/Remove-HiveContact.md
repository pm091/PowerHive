---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Remove-HiveContact

## SYNOPSIS
Removes Hive Contact

## SYNTAX

```
Remove-HiveContact [-ID] <Guid> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Removes Hive Contact

## EXAMPLES

### EXAMPLE 1
```
Remove-HiveContact -ID ccac1d4b-6a1b-4011-81f5-e67c1c817ba3 -Confirm:$false
```

### EXAMPLE 2
```
Get-HiveContact | Select-Object -ExpandProperty ID | Remove-HiveContact  -Confirm:$false
```

## PARAMETERS

### -ID
ID of Hive Contact to remove

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

### Accepts Pipeline input from Get-HiveContact

## OUTPUTS

## NOTES
Author: @pm091

## RELATED LINKS

[https://github.com/pm091/powerhive](https://github.com/pm091/powerhive)

