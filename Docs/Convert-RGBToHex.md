---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Convert-RGBToHex

## SYNOPSIS
Converts an RGB color string to hex equivalent

## SYNTAX

### String (Default)
```
Convert-RGBToHex [-RGB] <String[]> [-Prefix] [-IncludeInput] [<CommonParameters>]
```

### Colors
```
Convert-RGBToHex [-Red <Int32>] [-Green <Int32>] [-Blue <Int32>] [-Prefix] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts an RGB color string to hex equivalent.
Input should be in the form 'A,R,G,B'

## EXAMPLES

### EXAMPLE 1
```
Convert-RGBToHex -RGB '255,128,64,32'
```

Would return
FF804020

### EXAMPLE 2
```
Convert-RGBToHex -RGB '255,255,0,0' -IncludeHash
```

Would return
#FFFF0000

### EXAMPLE 3
```
convert-RGBtohex '255,64,128,255' -IncludeHash
```

Would return
#FF4080FF

### EXAMPLE 4
```
'255,128,128,92' | convert-RGBtohex
```

Would return
FF80805C

### EXAMPLE 5
```
Convert-RGBToHex -RGB @('255,0,0','255,128,80,80') -IncludeHash -IncludeInput
```

Would return
DecimalRGB   HexRGB
-----------   -------
0,255,0,0     #00FF0000
255,128,80,80 #FF805050

## PARAMETERS

### -RGB
An RGB color string in the form '#,#,#,#' where each number is between 0 and 255.

```yaml
Type: String[]
Parameter Sets: String
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Red
{{ Fill Red Description }}

```yaml
Type: Int32
Parameter Sets: Colors
Aliases: R

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Green
{{ Fill Green Description }}

```yaml
Type: Int32
Parameter Sets: Colors
Aliases: G

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Blue
{{ Fill Blue Description }}

```yaml
Type: Int32
Parameter Sets: Colors
Aliases: B

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Prefix
{{ Fill Prefix Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
A switch indicating whether to include the original decimal RGB input in the output, aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string]
## NOTES
Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

Modified:
a) Changed name of parameter to RGB
b) Added -IncludeHash parameter to make # optional.
c) Minor tweaking so that it passes Invoke-ScriptAnalyzer
d) Added parameter validation on RGB.
e) Added .LINK entries for related items

## RELATED LINKS

[about_ISE-Color-Theme-Cmdlets]()

[Convert-HexToRGB]()

