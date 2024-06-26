$filePaths = @(
    Join-Path $PSScriptRoot "..\documentation\about.md"
    Join-Path $PSScriptRoot "..\documentation\development.md"
    Join-Path $PSScriptRoot "..\documentation\deployment.md"
)

$combinedContent = $generatedWarningMessage
$generatedWarningMessage = "[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)`r`n"
$combineSeparator = "`r`n`r`n***`r`n`r`n"

foreach ($filePath in $filePaths)
{
    $fileContent = Get-Content -Path $filePath -Raw
    $combinedContent += $fileContent + $combineSeparator + $generatedWarningMessage
}

$readmeFile = Join-Path $PSScriptRoot "..\readme.md"
$combinedContent | Set-Content -Path $readmeFile

# Requires https://dotnet.microsoft.com/en-us/download
# And https://github.com/BUTR/Converter.MarkdownToBBCode
$readmeFileBbcodenm = Join-Path $PSScriptRoot "..\documentation\readme.bbcodenm"
& markdown_to_bbcodenm -i $readmeFile > $readmeFileBbcodenm