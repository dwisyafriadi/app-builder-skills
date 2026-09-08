# Nambah tipe aplikasi baru

Tipe sekarang: `ppob-topup`, `kasir-pos`, `lms`, `marketplace`, `saas-crud`.

## Minimal (wajib)

Tambahkan baris di Known Map `skills/phase-1-discovery/SKILL.md`:
- Tipe + referensi contoh + **entitas inti**. Entitas inti yang dipakai Phase-2 (non-PPOB) dan Phase-4 untuk bikin skema dari nol.

## Opsional (canned, kalau mau template siap-pakai)

Kalau tipe sering diminta dan mau template default seperti PPOB:

1. `skills/app-builder-id/references/feature-map-<tipe>.md` — proposal P0/P1. Header tulis: gate & approval dipegang `phase-2`, file ini cuma isi.
2. `skills/app-builder-id/references/db-arch-<tipe>.md` — DBML + Prisma + Mermaid + arsitektur.
3. Arahkan `phase-2-features` step 2 & `phase-4-database`/`phase-5-scaffolding` ke file baru itu (sekarang keras ke `-ppob`).

## Yang TIDAK boleh diubah

- **Gate** (`OK lanjut / Tambah:`) — satu-satunya di `phase-2-features` step 4–6.
- **Deteksi capability** — jangan pernah tulis nama tool exact di body skill.
- **Source of truth dobel** — DBML/fitur jangan di-inline di SKILL.md kalau sudah ada di references.
