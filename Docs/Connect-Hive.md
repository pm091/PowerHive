---
external help file: PowerHive-help.xml
Module Name: PowerHive
online version: https://github.com/pm091/powerhive
schema: 2.0.0
---

# Connect-Hive

## SYNOPSIS
Connects to British Gas Hive API and retrieves An Access Token

## SYNTAX

```
Connect-Hive [-Username] <String> [-Password] <SecureString> [<CommonParameters>]
```

## DESCRIPTION
The Connect-Hive function is used to connect to the Hive 6.1 API, Hive API returns a unique token to represent the user's credentials for subsequent calls.
Acquire a token before running other PowerHive cmdlets.

## EXAMPLES

### EXAMPLE 1
```
Connect-Hive -Username useraccount@email
```

This will connect to Hive with a username of "useraccount@email".
The prompt will request a secure password.

### EXAMPLE 2
```
Connect-Hive -Username "useraccount@email" -Password (ConvertTo-SecureString "secret" -asplaintext -force)
```

If you need to pass the password value in the cmdlet directly, use the ConvertTo-SecureString function.

## PARAMETERS

### -Username
Hive User name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Hive User Password

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Does not take pipeline input.

## OUTPUTS

### Hive Session Vairable $Global:HiveHead

## NOTES
Author: @pm091

## RELATED LINKS

[https://github.com/pm091/powerhive](https://github.com/pm091/powerhive)

