---
name: phase-3b-frontend-tailwind
description: Generate mobile-first store UI with Next.js App Router and Tailwind when no Stitch capability exists, after features are approved
---

# Phase 3B - Frontend via Tailwind

## Overview

Generate mobile-first UI with a plain Next.js + Tailwind stack. No Stitch dependency. Do not invent features beyond `FEATURES_APPROVED`.

## Files

- `app/page.tsx` - hero + grid kategori
- `app/games/[slug]/page.tsx` - form UID + nominal
- `app/payment/[invoice]/page.tsx` - status
- `components/BottomNav.tsx`, `ProductCard.tsx`, `NominalGrid.tsx`

## Rules

- 5 pages max for v1. No full admin dashboard in this phase.
- Bahasa UI: Indonesia.
- All money with `Intl.NumberFormat('id-ID')`.

## Verification

- [ ] Every Phase 2 menu has a page
- [ ] Mobile 360px no overflow
- [ ] `npm run dev` runs
