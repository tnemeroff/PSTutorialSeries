#A example of If, elseif, and else
$ifValue = Read-host "Continue? (y/n)"

If (($ifValue -eq "y") -or ($ifValue -eq "Y")) {
    Write-Host "Continued"
} elseif (($ifValue -eq "n") -or ($ifValue -eq "N")) {
    Write-Host "Halted"
} else {
    Write-host "Valid Selection Not Made - Exiting"
}
