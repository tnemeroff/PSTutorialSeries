Set-StrictMode -Version Latest
#reference out of index array
$arrayWeTotallyWontBreak = @(1, 2, 3, 4, 5)
write-host "blah Blah " $arrayWeTotallyWontBreak[100]

Get-Service "sanity",*microsoft


#Locally
Get-Service "sanity",*ms* -ErrorAction Continue

Get-Service "sanity",*ms* -ErrorAction Ignore

Get-Service "sanity",*ms* -ErrorAction Inquire

Get-Service "sanity",*ms* -ErrorAction SilentlyContinue

Get-Service "sanity",*ms* -ErrorAction Stop


#set Globally
$ErrorActionPreference = "Stop"
$ErrorActionPreference = "Continue"
Get-Service "sanity",*ms*


Try {
    #code you want to execute
} catch [Specific.Error] {  
    #code for if there is a speific terminating error (Defined in brackets)
} catch {
    #this is the catch-all, ha, ha
    Write-host "Error: " $_
} finally { #optional
    #code that will always run
}
