Function 2026JobApplicationProcesser {
[cmdletBinding()] # geeks up the function, gives us -ErrorAction among other common parameters

param(
[parameter()] #allow us to specify manditory, param position, if it accepts pipeline tomfoolery, etc
[string]$applicantName = "Applicant",

[parameter(mandatory = $true, valueFromPipeline)] #or ValueFromPipelineByPropertyName,
[validateSet(1,2,3)]
[int]$number
)

Process {
    $message = “Unfortunately, your application has not been selected to move forward in the recruitment process”
    switch ($number) {
        1 {
            write-host $message " Sorry, " $applicantName ":) - John HR"
        }
        2 {
            write-host $message " Best regards " $applicantName " :| - John HR"
        }
        3 {
            write-host $message "Cope, " $applicantName " :( - John HR"
        }
    }
}
}


#Call Function
$r = Read-Host "Enter a number"
2026JobApplicationProcesser -number $r

