function Get-Uptime {
    #fetch that instance bb
    $os = Get-CimInstance Win32_OperatingSystem
    #peep uptime from date and last boot
    $uptime = (Get-Date) - $os.LastBootUpTime
    [PSCustomObject]@{
        Days    = $uptime.Days
        Hours   = $uptime.Hours
        Minutes = $uptime.Minutes
    }
}

function Get-DiskSpaceReport {
[CmdletBinding()]

param(
    [parameter()] #again, this isnt needed here, but i like looking at it
    [int]$threshold = 30
)
#30% gives us a good default margin per common recommendations (but I also just like the mults of 3)

#This is an example path, use | $logPath = Join-Path $PSScriptRoot "DiskSpaceReport.log" | for actual usage 
$logPath   = "C:\Users\Thaddeus\Documents\IT\PowerShell\Scripts\LogOut\DiskSpaceReport.log"

try {
    Write-Host "~~~ Checking disk space ~~~"

    #we can also break this down into logical or physical disks, the following would be logical (C: , D: , etc)
    $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

    # $physicalDisks = Get-CimInstance -ClassName Win32_DiskDrive - I aint gonna do this though, cause then i gotta map non-sense

    if (-not $disks) {
        Write-Warning "No fixed drives found."
        return
    }

    $report = foreach ($disk in $disks) {
        #Here, we are using round to make the numbers not be goofy as frick
        $freePerc = [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 1)
        $freeGB      = [math]::Round($disk.FreeSpace / 1GB, 2)
        $totalGB     = [math]::Round($disk.Size / 1GB, 2)

        # Console alert if below threshold
        if ($freePerc -lt $threshold) {
            Write-Host "WARNING - Drive $($disk.DeviceID) is at $freePerc% free"
        } else {
            Write-Host "PASS - Drive $($disk.DeviceID): $freePerc% free"
        }

        #Define Report Cust Obj
        [PSCustomObject]@{
            Drive       = $disk.DeviceID
            TotalGB     = $totalGB
            FreeGB      = $freeGB
            FreePerc = $freePerc
            Status      = if ($freePerc -lt $threshold) { "LOW" } else { "Cool As A Qcumber" }
            Timestamp   = (Get-Date)
        }
    }

    #Print table to console
    $report | Format-Table Drive, TotalGB, FreeGB, FreePerc, Status 

    #Bump log to a file, filling out data
    #Keep in mind, in this block $_ is referencing the pipeline variable ($report), in the next block, it is being used for error handling
    $report | ForEach-Object {
        Add-Content -Path $logPath -Value "$(Get-Date) | $($_.drive) | $($_.freeGB)GB free of $($_.totalGB)GB | $($_.freePerc)% | $($_.status)"
    }

    Write-Host "Log at: $logPath"

    #Keep in mind, the error is stored in the $_ variable once it occurs
    #Catch a potential error from Common Info Model / Windows Management Instrumentation
} catch [Microsoft.Management.Infrastructure.CimException] {
    Write-Error "Failed to get disk info ~ $_"

} catch {
    Write-Error "Unexpected error ~ $_"

} finally {
    Write-Host "~ Done ~" 
}
}
function Get-MemoryUse {
    #First gotta fetch CIM instance
    $os = Get-CimInstance Win32_OperatingSystem
    [PSCustomObject]@{
        #use round again to make things presentable
        totalGB     = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
        freeGB      = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
        usedPerc = [math]::Round((1 - $os.FreePhysicalMemory / $os.TotalVisibleMemorySize) * 100, 1)
    }
}

Export-ModuleMember -Function Get-Uptime, Get-DiskSpaceReport, Get-MemoryUse