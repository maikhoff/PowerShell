﻿<#
.SYNOPSIS
        Measures the speed of MergeSort
.DESCRIPTION
        This PowerShell script measures the speed of the MergeSort algorithm.
        MergeSort is an efficient, general-purpose, and comparison-based sorting algorithm.
	Most implementations produce a stable sort, which means that the order of equal elements
	is the same in the input and output. Merge sort is a divide-and-conquer algorithm that
	was invented by John von Neumann in 1945. A detailed description and analysis of bottom-up
	merge sort appeared in a report by Goldstine and von Neumann as early as 1948.
.PARAMETER numIntegers
        Specifies the number of integers to sort
.EXAMPLE
        PS> ./measure-MergeSort.ps1
	🧭 Sorting 1000 integers by MergeSort took 0.3786619 sec
.LINK
        https://github.com/fleschutz/PowerShell
.NOTES
        Author: Markus Fleschutz | License: CC0
#>

param([int]$numIntegers = 1000)

class MergeSort {

    static Merge($theArray, $tempArray, $leftPos, $rightPos, $rightEnd) {
        $leftEnd = $rightPos - 1
        $tmpPos = $leftPos
        $numElements = $rightEnd - $leftPos + 1

        while (($leftPos -le $leftEnd) -and ($rightPos -le $rightEnd)) {
            if ($theArray[$leftPos].CompareTo($theArray[$rightPos]) -le 0) {
                $tempArray[$tmpPos++] = $theArray[$leftPos++]
            }
            else {
                $tempArray[$tmpPos++] = $theArray[$rightPos++]
            }
        }

        while ($leftPos -le $leftEnd) { $tempArray[$tmpPos++] = $theArray[$leftPos++] }
        while ($rightPos -le $rightEnd) { $tempArray[$tmpPos++] = $theArray[$rightPos++] }

        for ($i = 0; $i -lt $numElements; $i++, $rightEnd--) {
            $theArray[$rightEnd] = $tempArray[$rightEnd]
        }
    }

    static Sort($theArray) {
        $tempArray = New-Object Object[] $theArray.Count
        [MergeSort]::Sort($theArray, $tempArray, 0, ($theArray.Count - 1))
    }

    static Sort($theArray, $tempArray, $left, $right) {
        if ($left -lt $right) {

            $center = [Math]::Floor(($left + $right) / 2)

            [MergeSort]::Sort($theArray, $tempArray, $left, $center)
            [MergeSort]::Sort($theArray, $tempArray, ($center + 1), $right)

            [MergeSort]::Merge($theArray, $tempArray, $left, ($center + 1), $right)
        }
    }
}

$list = (1..$numIntegers | foreach{Get-Random -minimum 1 -maximum $numIntegers})
$stopWatch = [system.diagnostics.stopwatch]::startNew()
[MergeSort]::Sort($list)
[float]$elapsed = $stopWatch.Elapsed.TotalSeconds
"🧭 Sorting $numIntegers integers by MergeSort took $elapsed sec"
exit 0 # success
