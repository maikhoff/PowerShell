﻿<#
.SYNOPSIS
	Checks the battery
.DESCRIPTION
	This PowerShell script queries the status of the system battery and prints it.
.EXAMPLE
	PS> ./check-battery.ps1
	⚠️ Battery 9% low, 54 min remaining
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	if ($IsLinux) {
		$Reply = "✅ AC powered" # TODO, just guessing :-)
	} else {
		Add-Type -Assembly System.Windows.Forms
		$Details = [System.Windows.Forms.SystemInformation]::PowerStatus
		[int]$Percent = 100 * $Details.BatteryLifePercent
		[int]$Remaining = $Details.BatteryLifeRemaining / 60
		if ($Details.PowerLineStatus -eq "Online") {
			if ($Details.BatteryChargeStatus -eq "NoSystemBattery") {
				$Reply = "✅ AC powered"
			} elseif ($Percent -ge 95) {
				$Reply = "✅ Battery fully charged ($Percent%)"
			} else {
				$Reply = "✅ Battery charging... ($Percent%)"
			}
		} else { # must be offline
			if ($Remaining -eq 0) {
				$Reply = "✅ Battery at $Percent%, calculating remaining time..."
			} elseif ($Remaining -le 5) {
				$Reply = "⚠️ Battery at $Percent%, ONLY $Remaining MIN remaining"
			} elseif ($Remaining -le 30) {
				$Reply = "⚠️ Battery at $Percent%, only $Remaining min remaining"
			} elseif ($Percent -lt 10) {
				$Reply = "⚠️ Battery $Percent% low, $Remaining min remaining"
			} elseif ($Percent -ge 80) {
				$Reply = "✅ Battery $Percent% full, $Remaining min remaining"
			} else {
				$Reply = "✅ Battery at $Percent%, $Remaining min remaining"
			}
		}
	}
	Write-Output $Reply
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
