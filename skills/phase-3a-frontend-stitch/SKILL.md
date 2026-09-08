---
name: phase-3a-frontend-stitch
description: Generate mobile-first store UI screens with the Google Stitch UI generation capability after features are approved
---

# Phase 3A - Frontend via Stitch

## Overview

Generate mobile-first UI via Google Stitch capability. Do not invent features beyond `FEATURES_APPROVED`.

Setup: read [mcp-stitch.md](../app-builder-id/references/mcp-stitch.md).

## Stitch Prompt Template

Copy-paste, isi [bracket]:
```
Build mobile-first topup store inspired by [adstore.id], lang id:
Pages: / (hero banner carousel + flash sale countdown + grid kategori Game/Voucher/PC Game + search), /games/[slug] (input UserID + select server + grid nominal + payment QRIS + tombol beli), /payment/[invoice] (status + countdown 15min + tombol cek pesanan), /account, /notifikasi, /artikel
Style: dark navy #0B1220, cards rounded-2xl, bottom nav mobile, font Inter
Output: screens + Tailwind HTML export
Approved features: [paste FEATURES_APPROVED]
```

## Rules

- 5 pages max for v1. No full admin dashboard in this phase.
- Bahasa UI: Indonesia.
- All money with `Intl.NumberFormat('id-ID')`.
- API key via env `STITCH_API_KEY`. Never write the key into a repo file.

## Verification

- [ ] Every Phase 2 menu has a page
- [ ] Mobile 360px no overflow
