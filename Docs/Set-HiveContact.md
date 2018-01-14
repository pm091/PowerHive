---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Set-HiveContact

## SYNOPSIS
Creates a New Hive Contact

## SYNTAX

```
Set-HiveContact [-Name] <String> [-Email] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates a New Hive Contact

## EXAMPLES

### EXAMPLE 1
```
Set-HiveContact -Name "Contact Name" -Email "Contact@email"
```

## PARAMETERS

### -Name
Set Hive Contact Name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Email
Set Hive Contact Email

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

## OUTPUTS

### List Properties of new contact

## NOTES
Author: @pm091

## RELATED LINKS

[https://github.com/pm091/powerhive](https://github.com/pm091/powerhive)

