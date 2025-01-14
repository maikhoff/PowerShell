﻿<#
.SYNOPSIS
	Tells a quote by text-to-speech
.DESCRIPTION
	This PowerShell script selects a random quote from Data/quotes.csv and speaks it by text-to-speech (TTS).
.EXAMPLE
	PS> ./tell-quote.ps1
	(listen and enjoy)
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	$table = Import-CSV "$PSScriptRoot/../Data/quotes.csv"

	$randomNumberGenerator = New-Object System.Random
	$row = [int]$randomNumberGenerator.next(0, $table.Count - 1)

	& "$PSScriptRoot/speak-english.ps1" "$($table[$row].QUOTE). By $($table[$row].AUTHOR)."
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
