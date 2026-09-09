#!/usr/bin/env bash
set -euo pipefail
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*)
    echo "On Windows use install.ps1 or install.bat; this installer requires POSIX symlinks." >&2
    exit 2
    ;;
esac
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$root/skills"
destination="${1:-$root/.agents/skills}"
if [[ $# -gt 1 ]]; then
  echo "Usage: bash install.sh [destination]" >&2
  exit 2
fi
[[ -d "$source_dir" ]] || { echo "Skills source missing" >&2; exit 1; }
shopt -s nullglob
skills=("$source_dir"/*/SKILL.md)
[[ ${#skills[@]} -gt 0 ]] || { echo "No skills found" >&2; exit 1; }
# Check the entire destination before writing anything.
for skill in "${skills[@]}"; do
  folder="${skill%/SKILL.md}"
  link="$destination/${folder##*/}"
  if [[ -e "$link" || -L "$link" ]]; then
    if [[ ! -L "$link" || "$(readlink "$link")" != "$folder" ]]; then
      echo "Destination conflict; nothing replaced: $link" >&2
      exit 1
    fi
  fi
done
mkdir -p -- "$destination"
for skill in "${skills[@]}"; do
  folder="${skill%/SKILL.md}"
  link="$destination/${folder##*/}"
  if [[ -L "$link" ]]; then
    echo "Already linked: $link"
  else
    ln -s -- "$folder" "$link"
    echo "Linked: $link"
  fi
done
