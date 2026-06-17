
#While
$tick = 0
while ($tick -lt 6) {
    $tick
    $tick++ 
} 

#rounding back to our if statemenet example, this would force the user to give us a valid response
$Winput = ""
while ($Winput -ne "Y" -and $Winput -ne "N") {
    $Winput = read-host "Continue (Y/N)"
}


#Do While++
$jampoCounter = 0
do {
    Write-host -Object "Jampo"
    $jampoCounter++
    } while ($jampoCounter -lt 2)


#Do Until
do {
    $choice = Read-Host -Prompt 'Whats 9 + 10'
    } until ($choice -eq '21') 
    Write-Host -Object 'Youre stupid!' 