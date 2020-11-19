# Script intended to drop secure string encoded creds into C:\Users\<Username>\Documents\Folder\
# This in only Window compatible
# Helpful guide: http://duffney.io/AddCredentialsToPowerShellFunctions


$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Get current username
$usersName = $env:UserName

# Make string for directory
$partOne = $scriptPath
$partTwo = "/creds/"
$dirPath = $partOne + $partTwo
# Check if directory exists

$isThere = Test-Path $dirPath

if ($isThere -eq 1){
    #True
    Write-Host('Directory Exists')
}else{
    Write-Host('Creating Directory')
    New-Item -Path ($partOne) -Name "/creds" -ItemType "directory"
}

# Get password and store

$myCred = Read-Host "Please enter password to be stored: "
"<EnterPassword>" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | out-file $dirPath\jiracreds.txt