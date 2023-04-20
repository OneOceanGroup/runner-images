################################################################################
##  File:  Install-NET461.ps1
##  Desc:  Install .NET 4.6.1
################################################################################

# .NET 4.6.1 Dev pack
$InstallerName = "ndp461-devpack-kb3105179-enu.exe"
$InstallerUrl = "https://download.visualstudio.microsoft.com/download/pr/33a48e6c-c0d1-4321-946b-042b92bad691/a9a88bd451286ab9ea015ecc2208d725/${InstallerName}"
$ArgumentList = ("Setup", "/passive", "/norestart")

Install-Binary -Url $InstallerUrl -Name $InstallerName -ArgumentList $ArgumentList

Invoke-PesterTests -TestFile "Tools" -TestName "NET461"