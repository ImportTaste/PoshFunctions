function Get-FolderName {
<#
.SYNOPSIS
    Gets a filename through the native OpenFileDialog. Can select a single file or multiple files.
.DESCRIPTION
    Gets a filename through the native OpenFileDialog. Can select a single file
    or multiple files. If user clicks 'OK' an [array] is returned, otherwise returns
    a $null if the dialog is canceled. Aliased function to 'Get-Folder' for backward compatibility
.PARAMETER InitialDirectory
    The directory for the OpenFileDialog to start in. Defaults to $pwd.
    Aliased to 'Path'.
.PARAMETER MultiSelect
    Determines if you can select one or multiple files. Defaults to $false.
    Aliased to 'Multi'.
.PARAMETER Filter
    A character string delimited with pipe '|' character. Each 'token' in the string follows the form
    'Description|FileSpec'. Multiple 'tokens' can be in the string and they too are separated
    by the pipe character. Defaults to 'All files|*.*'.
.EXAMPLE
    PS C:\> $File = Get-FileName
    Will present a fileopen dialog box where only a single file can be selected and the fileopen
    dialog box will start in the current directory. Assigns selected file to the 'File' variable.
.EXAMPLE
    PS C:\> $File = Get-FileName -MultiSelect -Filter 'Powershell files|*.ps1|All files|*.*'
    Will present a fileopen dialog box where multiple files can be selected and the fileopen
    dialog box will start in the current directory. There will be a drop down list box in lower right
    where the user can select 'Powershell files' or 'All files' and the files listed will change.
    Assigns selected file(s) to the 'File' variable.
.EXAMPLE
    PS C:\> $File = Get-FileName -MultiSelect -InitialDirectory 'C:\Temp'
    Will present a fileopen dialog box where multiple files can be selected and the fileopen
    dialog box will start in the C:\Temp directory. Assigns selected file(s) to the 'File' variable.
.EXAMPLE
    PS C:\> Get-FileName | get-childitem
    Pipes selected filename to the get-childitem cmdlet.
.INPUTS
    None are required, but you can use parameters to control behavior.
.OUTPUTS
    [array]     If user selects file(s) and clicks 'OK'. Will return an array with a .Count
                and each element in the array will be the file(s) selected
    $null       If the user clicks 'Cancel'.
.NOTES
    Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
                http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    Changes:     Added parameter for MultiSelect of files. Forced function to always return an array. Filter is
                now a parameter that can be specified to control behavior. Changed InitialDirectory to default
                to $pwd and to give an alias of 'Path' which is commonly used parameter name.
                Also changed syntax to Add-Type -AssemblyName to conform with
                Powershell 2+ and to be more "Powershelly".

    # Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    # get-help about_ISE-Color-Theme-Cmdlets for more information
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType([string[]])]
    Param(
        [Alias('InitialDirectory', 'RootFolder')]
        [string] $Path = "$pwd", #default

        [switch] $NoNewFolder, #default

        [Alias('Description')]
        [string] $Title

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Add-Type -AssemblyName System.Windows.Forms

        $FolderBrowserDialog = New-Object -TypeName System.Windows.Forms.FolderBrowserDialog
        $FolderBrowserDialog.RootFolder = 'MyComputer'
        $FolderBrowserDialog.SelectedPath = $Path
        if ($NoNewFolder) { $FolderBrowserDialog.ShowNewFolderButton = $false }
        if ($Title) { $FolderBrowserDialog.Description = $Title }

        $Result = $FolderBrowserDialog.ShowDialog()

        # needed to play around to force PowerShell to return an array.
        if ($Result -eq 'OK') {
            [array] $ReturnArray = $FolderBrowserDialog.SelectedPath
            Write-Output -InputObject (, $ReturnArray)
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}

Set-Alias -Name 'Get-Folder' -Value 'Get-FolderName' -Description 'Alias for Get-FolderName for backward compatibility'
