@echo off
REM Universal installer Windows - run: install.bat
set SRC=%~dp0skills
mkdir "%USERPROFILE%\.agents\skills" 2>nul
mkdir "%USERPROFILE%\.claude\skills" 2>nul
mkdir "%USERPROFILE%\.openclaw\skills" 2>nul
mkdir "%USERPROFILE%\.codex\skills" 2>nul
for %%S in (app-builder-id phase-1-discovery phase-2-features phase-3-frontend phase-4-database phase-5-scaffolding) do (
  rmdir "%USERPROFILE%\.agents\skills\%%S" 2>nul
  mklink /J "%USERPROFILE%\.agents\skills\%%S" "%SRC%\%%S"
)
echo Done. Skills linked to ~/.agents/skills
echo Claude Code also reads ~/.claude/skills, copy manually if needed.
echo OpenClaw: openclaw skills install ./skills/app-builder-id --as app-builder-id
