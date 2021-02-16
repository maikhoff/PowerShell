#!/bin/powershell
<#
.SYNTAX         ./translate-file.ps1 [<file>] [<source-lang>] [<target-lang>]
.DESCRIPTION	translates the given file from source to target language.
.LINK		https://github.com/fleschutz/PowerShell
.NOTES		Author:	Markus Fleschutz / License: CC0
#>

param($File = "", $SourceLanguage = "", $TargetLanguage = "")

try {
	$PathToRepo = "$PSScriptRoot/.."
	
	if ($File -eq "" ) {
		$File = read-host "Enter path to file"
	}
	if ($SourceLanguage -eq "" ) {
		$SourceLanguage = read-host "Enter language of this file"
	}
	if ($TargetLanguage -eq "" ) {
		$TargetLanguage = read-host "Enter language to translate to"
	}

	Start-Process -FilePath "$PathToRepo/Data/trans" -ArgumentList "-i $File -s $SourceLanguage -t $TargetLanguage -e google -brief" -NoNewWindow -Wait
	exit 0
} catch {
	write-error "ERROR: line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
