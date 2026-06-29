$numbers = @(1, 2, 3, 4, 5)

for ($i = 0; $i -lt $numbers.Length; $i++) {
    #Mod array
    $numbers[$i] = $numbers[$i] * 10
}

$numbers


#Ping https://pointerpointer.com/ to see if this important service is up, and save the results

for ($i = 1; $i -le 3;  $i++) {
    $result = Test-Connection -TargetName "pointerpointer.com" -quiet
    #Good Example of a in-line If/Else statement
    Write-Host "Attempt $i - $(if ($result) {'Online'} else {'Failed'})"
}



