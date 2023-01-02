$nuspecPath = "$PSScriptRoot\nerdfonts.nuspec"
[xml]$nuspec = Get-Content $nuspecPath

$version = $nuspec.package.metadata.version

# Use the GitHub CLI to update the latest release
$name, [Uri[]]$urls = gh api /repos/ryanoasis/nerd-fonts/releases -F per_page=1 --method GET --jq "[.[0].name, .[0].assets[].browser_download_url]" |
    ConvertFrom-Json

if ($name -eq "v$Version") {
    Write-Host "Latest release is still $name"
    return
}

# Remove the old checksum file
Remove-Item $PSScriptRoot\tools\v$Version -ErrorAction SilentlyContinue

# Nerdfonts doesn't publish a checksum file, so I'm building one
$urls = $urls -notmatch "FontPatcher|makegroups"
$ProgressPreference = 'SilentlyContinue'
@(  foreach ($url in $urls) {
        $File = Join-Path $PSScriptRoot $url.Segments[-1]
        Invoke-WebRequest $url -OutFile $File
        Get-FileHash $File
    }
) | Select-Object { [io.path]::GetFileNameWithoutExtension($_.Path) }, Hash |
    ConvertTo-Csv -Delimiter '=' -QuoteFields:$false |
    Select-Object -Skip 1 |
    Out-File $PSScriptRoot\tools\$name

$nuspec.package.metadata.version = $name -replace "^v"
$nuspec.Save($nuspecPath)