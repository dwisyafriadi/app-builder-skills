---
name: phase-4-database
description: Produce DB schema, checkout/payment flowchart, and 1-page architecture after UI is approved
---

# Phase 4 - DB + Flowchart + Arsitektur

## Overview

Produce 3 artifacts: DBML (dbdiagram.io), Mermaid (mermaid.live), architecture doc. Keep DB minimal for v1.

## Steps

1. Check the type classified in Phase 1. If it is NOT `ppob-topup`, the reference file schema does NOT apply: generate DBML + Mermaid fresh from that type's entity list (Phase 1 Known Map). Never copy PPOB tables onto a POS/LMS/marketplace app.
2. If it IS `ppob-topup`, read the single source of truth: `../app-builder-id/references/db-arch-ppob.md` (full DBML + Prisma + Mermaid + architecture + API contract). Present its content, adjusted to the approved features.
3. Present to user: DBML, Mermaid flowchart, 1-page architecture.
4. Money as integer IDR, never float.

## Notes (already enforced in the reference file)

- `orders.user_id` nullable FK to `users` (guest checkout).
- `orders.expires_at` for 15min pending auto-expire.
- `payments.gateway_ref` unique -> webhook idempotency.
- `orders.status`, `payments.method` stay as strings in v1.
- P1 tables (wallet, voucher) -> comment `// v2`, do not create.

## Output

Show the artifacts from the reference file, then:
> Lanjut ke Phase 5? (OK / revisi skema)
