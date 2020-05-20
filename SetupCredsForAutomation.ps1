# Script intended to drop secure string encoded creds into C:\Users\<Username>\Documents\Folder\
# This in only Window compatible
# Helpful guide: http://duffney.io/AddCredentialsToPowerShellFunctions



Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Get current username
$usersName = $env:UserName

# Make string for directory
$partOne = "C:\Users\"
$partTwo = "\Documents\Folder\"
$dirPath = $partOne + $usersName + $partTwo
# Check if directory exists

$isThere = Test-Path $dirPath

if ($isThere -eq 1){
    #True
    Write-Host('Directory Exists')
}else{
    Write-Host('Creating Directory')
    New-Item -Path ($partOne + $usersName + "\Documents\") -Name "Folder" -ItemType "directory"
}

# Get password and store

$myCred = Read-Host "Please enter password to be stored: "
"<EnterPassword>" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | out-file $dirPath\PW.txt