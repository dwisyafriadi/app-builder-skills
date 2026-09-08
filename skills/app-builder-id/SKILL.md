---
name: app-builder-id
description: Build Indonesian store apps (PPOB topup, POS, LMS, marketplace) through 5 standalone phases, each callable directly
---

# App Builder ID - Recommended Order

## Overview

5 standalone phases. Each callable directly. Recommended order below, not enforced.

## Recommended order

| # | Skill dir | When |
|---|---|---|
| 1 | `skills/phase-1-discovery` | New app request, clone-website request |
| 2 | `skills/phase-2-features` | After discovery, need feature list + user sign-off |
| 3 | `skills/phase-3-frontend` | After features approved, need UI |
| 4 | `skills/phase-4-database` | After UI approved, need DB schema + flow |
| 5 | `skills/phase-5-scaffolding` | After DB approved, need runnable skeleton |
| 6 | `skills/phase-6-verification` | Before declaring done, must pass checks |

Invoke via harness skill mechanism if available. Otherwise read + follow `SKILL.md` in that dir manually.

## Rules

- One phase at a time. Do not jump ahead without the prerequisite output (e.g. no UI without `FEATURES_APPROVED`).
- Each phase output short enough to read on phone.
- Missing capability (URL fetch, UI generator)? Use the fallback inside that phase skill. Never block.
- Respond to user in Bahasa Indonesia. Code/comments in English.

## Quick Reference

| User says | Do |
|---|---|
| "buatkan aplikasi X seperti URL Y" | Phase 1, fetch URL Y |
| "OK lanjut" after feature table | Phase 3 |
| "Tambah: pulsa, PLN" | Phase 2 revise, ask gate again |
| "buatkan UI nya" | Phase 3 only if Phase 2 done, else Phase 2 first |
| "buatkan DB nya" | Phase 4 |
