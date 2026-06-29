$ErrorActionPreference = "Stop"

$outputPath = "C:\Users\Thaddeus\Documents\IT\PowerShell\Scripts\LogOut\output.txt"
$content    = "Computer, write this down."

try {
    Write-Host "Transcribing"
    Add-Content -Path $outputPath -Value $content
    Write-Host "Recorded. Peep " $outputPath
    #we must consider a few common cases:
    # 1, permission Error
} catch [System.UnauthorizedAccessException] {
    Write-Host "Access denied — You ain't got the perms diggity dog"

    # 2, folder doesnt exist
} catch [System.IO.DirectoryNotFoundException] {
    Write-Host "Folder not found"

    #catch-all, outputting the error from the error which is saved to variable $_
} catch {
    Write-Host "Unexpected error:" $_

}