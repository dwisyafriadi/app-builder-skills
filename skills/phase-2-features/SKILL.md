---
name: phase-2-features
description: Turn app discovery into P0/P1 feature table and get user sign-off before any UI or DB work
---

# Phase 2 - Feature Planning + Approval Gate

## Overview

Turn discovery into feature table. MUST stop for user approval. No UI/DB code before OK.

Feature content lives in `../app-builder-id/references/feature-map-ppob.md` (PPOB). This skill owns the gate only; never re-specify approved features inline here.

## Steps

1. Group features: Auth, Katalog, Transaksi, Notifikasi, Admin, Tambahan.
2. PPOB: present the canned P0/P1 proposal from `feature-map-ppob.md` verbatim (its P0 is the approval target). Non-PPOB: build the table from the Phase 1 entity list, same grouping.
3. Enforce scope: if P0 has more than 7 items, force the user to cut to 7 before approving.
4. End with the exact gate below. STOP. Wait for user reply. Do not proceed automatically.
> "Fitur di atas sudah OK? Jawab: `OK lanjut` untuk ke UI, atau `Tambah: ...` untuk revisi."
5. If user says `Tambah: X`, revise the presented proposal, then ask the gate again. PPOB revision mapping (pulsa -> kategori `Pulsa & PPOB` + produk + field `nomor_tujuan`, dst) is in the reference file. Max 3 revisions; on the 3rd, lock the latest P0 and defer the rest to P1.
6. If user says `OK lanjut`, output `FEATURES_APPROVED: <the approved P0>` and proceed to Phase 3.

## Output Example

```md
## Usulan Fitur PPOB
1. Auth: Login, Daftar, Guest [..]
2. Katalog: Game, Akun, Voucher, Notifikasi, Search [..]
3. Transaksi: ...
Jawab: OK lanjut / Tambah: ...
```

## Red Flags - STOP

- User belum bilang OK tapi mau lanjut ke UI -> kembali ke gate.
- Menambah 10+ fitur sekaligus tanpa prioritas -> paksa pilih P0 (wajib rilis) vs P1 (nanti).

## Common Mistakes

- Fitur generik `CRUD user` tanpa field jelas -> tulis field: `users(id, phone, email)`.
- Lupa payment method Indonesia: QRIS, VA, E-wallet, Alfamart.
