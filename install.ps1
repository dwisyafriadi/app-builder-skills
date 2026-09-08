# Creates .claude/skills junctions so Claude Code discovers these skills in THIS project.
# Windows: junctions need no admin (symlinks do).
# Cross-agent: copy the WHOLE skills/ tree into that agent's skills dir instead (see README).

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $root 'skills'
$dst  = Join-Path $root '.claude\skills'

if (-not (Test-Path $src)) { Write-Error "skills/ not found under $root"; exit 1 }
New-Item -ItemType Directory -Force $dst | Out-Null

$made = @()
Get-ChildItem $src -Directory | ForEach-Object {
    $link = Join-Path $dst $_.Name
    if (Test-Path $link) {
        # existing real file -> remove it (junction removes link only, not target)
        Remove-Item $link -Force
    }
    New-Item -ItemType Junction -Path $link -Target $_.FullName | Out-Null
    $made += $_.Name
}

Write-Host "Linked $($made.Count) skills into $dst"
$made | ForEach-Object { Write-Host "  - $_" }
