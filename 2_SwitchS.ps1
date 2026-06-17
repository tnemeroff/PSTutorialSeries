#Select What you would like to do
$selection = Read-host "Make a Selection: (1) Open Chrome (2) Open Edge"

switch ($selection) {
    "1" {
        Write-host "Opening Chrome"
        Start-process "C:\Program Files\Google\Chrome\Application\chrome.exe"
        break
    }
    "2" {
        Write-host "Open Edge"
        Start-process "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
        break
    }
    default {
        Write-host "Your Selection Was Invalid"
    }
}