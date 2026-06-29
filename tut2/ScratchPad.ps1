#Allows Strings to be piped
"C:\windows" | test-path


#Does not accept string
"chrome" | get-process


#Normal Way to View these Properties (Does not list correct info)
get-help get-process -full


#Work Around 
(Get-Command Get-Service).Parameters['Name'].Attributes
#Link to problem record: https://github.com/PowerShell/platyPS/issues/804




#WhereObj
Get-Process | Where-Object ProcessName -eq "msedge"

#SelectObj
"Joe", "Shmo", "Joe", "Shmo", "PleaseGiveMeAJobIAmBeggingYou" | Select-Object -Unique

#SortObj 
Get-ChildItem | Sort-Object -Property Length -Descending

#ForEachObj
0,15,30,45 | ForEach-Object { $_ * 2 }

#GroupObj
Get-Service | Group-Object -Property Status



#Example
Get-Service | Where-Object {$_.Status -eq "Stopped"}








Set-StrictMode -Version Latest
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
Get-ExecutionPolicy -List


