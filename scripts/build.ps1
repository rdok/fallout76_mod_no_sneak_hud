$archive2Path = Join-Path $PSScriptRoot "../libraries/Quick Configuration v1.12.7/Archive2/Archive2.exe"
$srcPath = Join-Path $PSScriptRoot "../src/interface/"

$packageJsonPath = Join-Path -Path $PSScriptRoot -ChildPath "..\package.json"
$jsonContent = Get-Content -Path $packageJsonPath -Raw
$jsonObject = $jsonContent | ConvertFrom-Json
$version = $jsonObject.version

if (-Not (Test-Path -Path $archive2Path)) {
    throw "The Archive2 executable was not found at '$archive2Path'. Please download & extract the full contents from https://www.nexusmods.com/fallout76/mods/546?tab=files&file_id=13110."
}

& $archive2Path $srcPath -create="dist/NoStealthMeter.ba2"

$buildName="no_stealth_meter_${version}.7z"
$ba2Name="NoStealthMeter.ba2"
Remove-Item -LiteralPath $buildName -Force -Recurse
.\node_modules\7z-bin\win32\7z.exe a $buildName ".\dist\${ba2Name}"
#Remove-Item -LiteralPath "dist" -Force -Recurse