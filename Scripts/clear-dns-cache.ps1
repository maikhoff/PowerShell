﻿<#
.SYNOPSIS
	Clears the DNS cache
.DESCRIPTION
	This PowerShell script clears the DNS client cache of the local computer.
.EXAMPLE
	PS> ./clear-dns-cache.ps1
	✔️ cleared DNS cache in 0 ms
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	Clear-DnsClientCache

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ cleared DNS cache in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
