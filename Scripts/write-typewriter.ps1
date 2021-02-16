#!/bin/powershell
<#
.SYNTAX         ./write-typewriter.ps1 [<text>] [<speed>]
.DESCRIPTION	writes the given text with the typewriter effect
.LINK		https://github.com/fleschutz/PowerShell
.NOTES		Author:	Markus Fleschutz / License: CC0
#>

param([string]$Text = "", [int]$Speed = 250) # in milliseconds

if ($Text -eq "" ) {
	$Text = "`nHello World`n-----------`nPowerShell is cross-platform`nPowerShell is open-source`nPowerShell is easy to learn`nPowerShell is fully documented`n`nThanks for watching`n`n:-)`n`n"
}

try {
	$Random = New-Object System.Random

	$Text -split '' | ForEach-Object {
		write-host -nonewline $_
		start-sleep -milliseconds $(1 + $Random.Next($Speed))
	}
	exit 0
} catch {
	write-error "ERROR: line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
