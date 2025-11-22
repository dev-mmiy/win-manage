# Registory path list of Lanscope Cat
$paths = @(
    "HKLM:\SOFTWARE\WOW6432Node\LanScopeCat\Agent",
    "HKLM:\SOFTWARE\LanScopeCat\Agent",
    "HKLM:\SOFTWARE\WOW6432Node\LanScopeCat",
    "HKLM:\SOFTWARE\LanScopeCat"
)

$found = $false

Write-Output "Start check version of LanScope Cat"

foreach ($path in $paths) {
    if (Test-Path $path) {
        $info = Get-ItemProperty $path

        if ($info.Version -or $info.ProductVersion -or $info.DisplayVersion) {
            Write-Output "Found in: $path"
            Write-Output "Version: $($info.Version)"
            Write-Output "ProductVersion: $($info.ProductVersion)"
            Write-Output "DisplayVersion: $($info.DisplayVersion)"
            $found = $true
        }
    }
}

if (-not $found) {
    Write-Output "Cannot find version infomation of Lanscope Cat"
}
