# app-builder-id — skill pack pembuat aplikasi Indonesia

Skill pack portabel (Claude Code, Codex, OpenClaw/Hermes) untuk membuat aplikasi ala toko Indonesia: PPOB topup, kasir/POS, LMS, marketplace. Murni markdown — tiap phase = satu folder berisi `SKILL.md`, tanpa runtime khusus agent.

## Struktur

```
skills/
  app-builder-id/              urutan rekomendasi + shared references
    references/                konten bersama: feature map, DB schema, MCP stitch
  phase-1-discovery/           klasifikasi tipe + cari referensi clone
  phase-2-features/            tabel P0/P1 + approval gate (pemilik gate)
  phase-3-frontend/            router: ke Stitch atau Tailwind
    phase-3a-frontend-stitch/  UI via Google Stitch MCP
    phase-3b-frontend-tailwind/ UI fallback Next.js + Tailwind
  phase-4-database/            DBML + flowchart + arsitektur
  phase-5-scaffolding/         skeleton Next.js 15 + Prisma
  phase-6-verification/        gate tsc + prisma + boot sebelum "Selesai"
```

## Aturan source-of-truth (jangan di-dobel)

- **Fitur**: konten di `references/feature-map-ppob.md`; gate `OK lanjut` hanya hidup di `phase-2`.
- **DB**: skema di `references/db-arch-ppob.md`; `phase-4`/`phase-5` baca file itu, tak ada DBML inline.
- **Guard non-PPOB**: reference itu khusus PPOB. Type POS/LMS/marketplace bikin skema dari entity list Phase 1, jangan menyalin tabel PPOB.
- **Deteksi capability, bukan nama tool**: portable lintas agent. Jangan tulis `mcp__…` / `webfetch` di body skill.

## Install — Claude Code (Windows)

```powershell
.\install.ps1
```
Membuat junction `.claude/skills/<nama>` → `skills/<nama>`. Sesi baru, lalu uji (di bawah).

## Install — agent lain (Codex, OpenClaw, Hermes, …)

Copy **seluruh tree `skills/`** ke direktori skills agent tsb (bukan per-folder — link relatif antar folder patah kalau cuma satu yang di-copy). Lokasi direktori skill ikut dokumentasi masing-masing agent. Key API via env `STITCH_API_KEY`; jangan commit key.

## Uji (sesi baru di folder ini)

1. `buatkan aplikasi PPOB seperti https://adstore.id/`
   → Phase 1 klasifikasi `ppob-topup`, lalu Phase 2 P0/P1 + gate.
   → balas `OK lanjut` → Phase 3. Tanpa Stitch MCP harus jatuh ke `phase-3b`.
2. Balas `Tambah: token PLN` → proposal revisi + gate lagi (bukan langsung jalan).
3. Ketik `buatkan DB nya` → Phase 4 DBML + Mermaid.
4. Ketik `buatkan app kasir untuk toko sembako` → klasifikasi `kasir-pos`, DB **bukan** salinan PPOB.
5. Ketik `buatkan app rental mobil` → tipe `other` → agent tanya URL referensi.
6. Sampai scaffold → output wajib `Selesai v1 - verified` (fase 6).

Nambah tipe baru? Lihat `CONTRIBUTING.md`.
