################################################################################
##  File:  Install-InstallShield.ps1
##  Desc:  Install InstallShield 2023 SAB
################################################################################

# https://flexerasoftware.flexnetoperations.com/control/inst/AnonymousDownload?dkey=17981227
# https://flexerasoftware.flexnetoperations.com/control/inst/AnonymousDownload?dkey=20096677

# SAB2023 download key.
$DownloadKey = "20096677";
$InstallerName = "InstallShield2023R1StandaloneBuild.exe";
$InstallerURL = "https://flexerasoftware.flexnetoperations.com/control/inst/AnonymousDownload?dkey=${DownloadKey}";

$InstallDir = "${env:ProgramFiles(x86)}\InstallShield\2023 SAB";
$SystemPath = "${InstallDir}\System";

# Pull the licence server values from the environment, if set.
if (Test-Path env:SAB_PORT) {
    $SAB_PORT = ${env:SAB_PORT};
} else {
    $SAB_PORT = "27000";
}

if (Test-Path env:SAB_SERVER) {
    $SAB_SERVER = ${env:SAB_SERVER};
} else {
    $SAB_SERVER = "127.0.0.1";
}

$ArgList = (`
    "/S",`
    "/v/qn",`
    # "/vINSTALLDIR=""${InstallDir}""",`
    "/vPORTNUMBER=${SAB_PORT}",`
    "/vSERVERNAME=${SAB_SERVER}",`
    "/vLICENSETYPE=2"`
    );

Write-Host $ArgList

Install-Binary -Url $InstallerUrl -Name $InstallerName -ArgumentList $ArgList;

# Add the SAB system directory to the PATH.
Add-MachinePathItem ${SystemPath}

Invoke-PesterTests -TestFile "Tools" -TestName "InstallShield 2023 SAB"