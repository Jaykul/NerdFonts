param(
    [string[]]$Name = @(if ($NameParameter = (Get-PackageParameters)["Name"] -split "[, ]") { $NameParameter } else { "CascadiaCode" })
)

$packageName = "NerdFonts"
$Version = "v" + $Env:ChocolateyPackageVersion
$Fonts = Get-Content (Join-Path $PSScriptRoot $Version) | ConvertFrom-StringData

# If they install them all, do it in alphabetical order
$FontNames = $Name.ForEach{ $Fonts.Keys -match $_ } | Sort-Object
foreach ($Font in $FontNames) {
    $packageArgs = @{
        packageName   = $packageName
        unzipLocation = Join-Path $PSScriptRoot $Font
        url           = "https://github.com/ryanoasis/nerd-fonts/releases/download/$Version/$Font.zip"
        checksum      = $Fonts[$Font]
        checksumType  = 'sha256'
    }

    Install-ChocolateyZIPPackage @packageArgs
}

# Only install the "Windows Compatible" fonts, because otherwise we'll have double fonts
$CompatibleFonts = Get-ChildItem $PSScriptRoot -File -Recurse -Filter "*Windows Compatible*"
Install-ChocolateyFont $CompatibleFonts.FullName -Multiple -ErrorAction Stop
