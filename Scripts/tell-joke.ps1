﻿<#
.SYNOPSIS
	Tells a joke by text-to-speech
.DESCRIPTION
	This PowerShell script selects a random Chuck Norris joke in Data/jokes.csv and speaks it by text-to-speech (TTS).
.EXAMPLE
	PS> ./tell-joke.ps1
	(listen and enjoy)
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	$table = Import-CSV "$PSScriptRoot/../Data/jokes.csv"

	$randomNumberGenerator = New-Object System.Random
	$row = [int]$randomNumberGenerator.next(0, $table.count - 1)

	& "$PSScriptRoot/speak-english.ps1" $table[$row].Joke
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
