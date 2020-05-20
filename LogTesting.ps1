function Get-TimeStamp {
    return "{0:yyyy/MM/dd} {0:HH:mm:ss}" -f (Get-Date)
}
$activityLog = New-Object System.Collections.Generic.List[System.Object]

function LogForm($msg){
    $global:activityLog.add("[" + [string]$(Get-TimeStamp) + "] " + [string]$msg + "`n")
}

LogForm("Begin log for current run.")


WRITE-HOST $activityLog

#Get-Variable -Scope global
