---
name: phase-3-frontend
description: Route UI generation to Stitch AI or Tailwind fallback after features are approved
---

# Phase 3 - Frontend Router

## Overview

Route to exactly one generator. Never invent features beyond `FEATURES_APPROVED`.

## Routing

1. If the harness has a Google Stitch UI-generation capability, use skill `phase-3a-frontend-stitch`. Setup: read [mcp-stitch.md](../app-builder-id/references/mcp-stitch.md).
2. Otherwise use skill `phase-3b-frontend-tailwind`. Tell user one line: `Stitch tidak terdeteksi, pakai fallback Tailwind.` Continue, do not block.

## Rules

- 5 pages max for v1. No full admin dashboard in this phase.
- Bahasa UI: Indonesia.
- All money with `Intl.NumberFormat('id-ID')`.

## Verification

- [ ] Every Phase 2 menu has a page
- [ ] Mobile 360px no overflow
- [ ] `npm run dev` runs without Stitch
