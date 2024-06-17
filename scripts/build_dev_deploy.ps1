$packageJsonPath = Join-Path -Path $PSScriptRoot -ChildPath "..\package.json"
$jsonContent = Get-Content -Path $packageJsonPath -Raw
$jsonObject = $jsonContent | ConvertFrom-Json
$version = $jsonObject.version
$buildName="no_stealth_meter_${version}.7z"
$ba2Name="NoStealthMeter.ba2"
$distPath = Join-Path $PSScriptRoot "../dist/$ba2Name"

$gameFilename="D:\SteamLibrary\steamapps\common\Fallout76"
if (-Not (Test-Path -Path $gameFilename)) {
    throw "The game installation path '$gameFilename' does not exist. Please update the game installation path accordingly."
}

$modFilename="$gameFilename\Data\$ba2Name"

if (-Not (Test-Path -Path $modFilename)) {
    throw "The mod file '$modFilename' does not exist. Please build the mod through the build.ps1 script, deploy mod through Vortex; and then try again."
}

Copy-Item -Path $distPath -Destination $modFilename