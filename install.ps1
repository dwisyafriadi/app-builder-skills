# Link the whole pack without replacing existing files or links.
[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$Destination
)
$ErrorActionPreference = 'Stop'
if (-not $Destination) { $Destination = Join-Path $PSScriptRoot '.agents\skills' }
$source = Join-Path $PSScriptRoot 'skills'
if (-not (Test-Path -LiteralPath $source -PathType Container)) {
    throw "Skills source not found: $source"
}
$destinationPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
$entries = @(Get-ChildItem -LiteralPath $source -Directory | Where-Object {
    Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') -PathType Leaf
})
if ($entries.Count -eq 0) { throw 'No skills found.' }
# Preflight all conflicts before creating any links.
$pending = @()
foreach ($entry in $entries) {
    $link = Join-Path $destinationPath $entry.Name
    $existing = Get-Item -LiteralPath $link -Force -ErrorAction SilentlyContinue
    if ($null -ne $existing) {
        $sameTarget = $false
        if ($existing.LinkType -in @('Junction', 'SymbolicLink')) {
            foreach ($target in @($existing.Target)) {
                if (-not $target) { continue }
                $absoluteTarget = if ([IO.Path]::IsPathRooted($target)) {
                    [IO.Path]::GetFullPath($target)
                } else {
                    [IO.Path]::GetFullPath((Join-Path $destinationPath $target))
                }
                if ($absoluteTarget.TrimEnd('\', '/') -ieq $entry.FullName.TrimEnd('\', '/')) {
                    $sameTarget = $true
                }
            }
        }
        if (-not $sameTarget) { throw "Destination conflict; nothing replaced: $link" }
        Write-Output "Already linked: $link"
    } else {
        $pending += [pscustomobject]@{ Link = $link; Target = $entry.FullName }
    }
}
foreach ($entry in $pending) {
    if ($PSCmdlet.ShouldProcess($entry.Link, "Create junction to $($entry.Target)")) {
        New-Item -ItemType Directory -Path $destinationPath -Force | Out-Null
        New-Item -ItemType Junction -Path $entry.Link -Target $entry.Target | Out-Null
        Write-Output "Linked: $($entry.Link)"
    }
}
