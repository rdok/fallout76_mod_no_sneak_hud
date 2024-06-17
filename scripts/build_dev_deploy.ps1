$buildScriptPath =  Join-Path -Path $PSScriptRoot -ChildPath ".\build.ps1"
& $buildScriptPath

$packageJsonPath = Join-Path -Path $PSScriptRoot -ChildPath "..\package.json"
$jsonContent = Get-Content -Path $packageJsonPath -Raw
$jsonObject = $jsonContent | ConvertFrom-Json
$version = $jsonObject.version
$buildName="no_stealth_meter_${version}.7z"
$ba2Name="NoStealthMeter.ba2"
$ba2SourceFilename = Join-Path $PSScriptRoot "../dist/$ba2Name"

$gameFilename="D:\SteamLibrary\steamapps\common\Fallout76"
if (-Not (Test-Path -Path $gameFilename)) {
    throw "The game installation path '$gameFilename' does not exist. Please update the game installation path accordingly."
}

$ba2DestinationFilename="$gameFilename\Data\$ba2Name"

if (-Not (Test-Path -Path $ba2DestinationFilename)) {
    throw "The mod file '$ba2DestinationFilename' does not exist. Please build the mod through the build.ps1 script, deploy mod through Vortex; and then try again."
}

Remove-Item -LiteralPath $ba2DestinationFilename -Force -Recurse
Copy-Item -Force -Path $ba2SourceFilename -Destination $ba2DestinationFilename