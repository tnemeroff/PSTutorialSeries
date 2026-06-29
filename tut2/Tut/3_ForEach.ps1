$veryImportantApps = @("steam", "minecraft", "discord", "DaVinci")

foreach ($app in $veryImportantApps) {
    $found = Get-Process -Name $app -ErrorAction SilentlyContinue
    if ($found) {
        Write-Host "$app is running"
    } else {
        Write-Host "$app is not running"
    }
}