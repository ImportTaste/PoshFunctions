---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-MacVendor

## SYNOPSIS
Resolve MacAddresses To Vendors

## SYNTAX

```
Get-MacVendor [-MacAddress] <String[]> [<CommonParameters>]
```

## DESCRIPTION
This Function Queries The MacVendors API With Supplied MacAdderess And Returns Manufacturer Information If A Match Is Found

## EXAMPLES

### EXAMPLE 1
```
Get-MacVendor -MacAddress 00:00:00:00:00:00
```

### EXAMPLE 2
```
Warning ! ! This may error due to api limits
```

Get-DhcpServerv4Lease -ComputerName $ComputerName -ScopeId $ScopeId | Select -ExpandProperty ClientId | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}

Get-NetAdapter | select -ExpandProperty MacAddress | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}

### EXAMPLE 3
```
Get-MacVendor -MacAddress 00-09-0F-AA-00-01, B8-31-B5-3D-75-D1, 00-09-0F-FE-00-01, F0-6E-0B-DA-B6-A7, F0-6E-0B-DA-B6-A8
```

Would return
Vendor                MacAddress
------                ----------
Fortinet Inc. 
00-09-0F-AA-00-01
Microsoft Corporation B8-31-B5-3D-75-D1
Fortinet Inc. 
00-09-0F-FE-00-01
Microsoft Corporation F0-6E-0B-DA-B6-A7
Microsoft Corporation F0-6E-0B-DA-B6-A8

## PARAMETERS

### -MacAddress
MacAddress To Be Resolved

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Originally published as script Get-MacVendor.ps1 on PSGallery
* added write-verbose
* removed a-f in regex as case insensitive by default
* added example

## RELATED LINKS
