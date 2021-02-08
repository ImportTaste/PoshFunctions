Function Convert-ROT13 {
<#
.SYNOPSIS
    Shifts letters in string by 13 positions.
.DESCRIPTION
    Shifts letters in string by 13 positions. 'A' becomes 'N' and so on.
.PARAMETER String
    A simple string or array of strings that you want Convert-ROT13 run against.
.NOTES
    Link:       https://en.wikipedia.org/wiki/ROT13
.EXAMPLE
    Convert-ROT13 -String 'Hello World!'

    Would return
    Uryyb Jbeyq!
.EXAMPLE
    Convert-ROT13 -String 'Uryyb Jbeyq!'

    Would return
    Hello World!
.EXAMPLE
    Convert-ROT13 -String 'This is a secret'

    Would return
    Guvf vf n frperg
.EXAMPLE
    Convert-ROT13 -String 'one', 'two' -verbose

    Would return
    VERBOSE: String is [one|two]
    VERBOSE: Current line is [one]
    bar
    VERBOSE: Current line is [two]
    gjb
.INPUTS
    [string[]]
.OUTPUTS
    [string[]]
.LINK
    https://en.wikipedia.org/wiki/ROT13

#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [Parameter(Position = 0, HelpMessage='Please enter text to obfuscate', Mandatory, ValueFromPipeLine)]
        [Alias('Text')]
        [String[]] $String
    )
    #endregion Parameter

    begin {
        $Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
        $Cipher   = 'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'
        Write-Verbose -Message "Starting $($MyInvocation.MyCommand)"
    }

    process {
        Write-Verbose -Message "String is [$((($String | findstr.exe /r ".") -split "`n") -join '|')]"
        Foreach ($Line in $String) {
            Write-Verbose -Message "Current line is [$($Line)]"
            [string] $NewString = ''
            foreach ($Char in $Line.ToCharArray()) {
                if ( $Char -cmatch '[A-Za-z]' ) {
                    $NewString += $Cipher.Chars($Alphabet.IndexOf($Char))
                } else {
                    $NewString += $Char
                }
            }
            Write-Output -InputObject $NewString
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.MyCommand)"
    }

} # endfunction Convert-ROT13
