---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Get-HiveWeather

## SYNOPSIS
Provides basic temperature reading from the Hive Weather API

## SYNTAX

```
Get-HiveWeather [[-PostCode] <String>] [<CommonParameters>]
```

## DESCRIPTION
Uses a PostCode to retrieve current outside temperature.
By default the users postcode is used in the query, this can
be overridden using the PostCode parameter

## EXAMPLES

### EXAMPLE 1
```
Get-HiveWeather
```

### EXAMPLE 2
```
Get-HiveWeather -PostCode SW12
```

Weather Icon        : clear_sky
Outside Weather     : Clear
Outside Temperature : 6.0 °C

## PARAMETERS

### -PostCode
UK Postcode

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Does not take pipeline input.

## OUTPUTS

### Hive Weather Properties

## NOTES

## RELATED LINKS
