---
name: phase-4-database
description: Rancang atau perbarui flow dan ERD Mermaid, aturan data, serta arsitektur minimal saat alur, penyimpanan, atau kontrak aplikasi berubah.
---

# Flow, data, dan arsitektur

Ambil scope dari permintaan/konteks, tanpa prasyarat UI disetujui. Pada aplikasi baru, model awal sebelum UI dan selaraskan sesudahnya.

1. Buat fenced Mermaid flowchart: aktor, keputusan, hasil sukses, kegagalan penting, transisi status.
2. Baca schema/migration existing. Buat fenced Mermaid erDiagram untuk data relasional dengan tipe, PK/FK, kardinalitas, dan optionality. DBML hanya jika diminta.
3. Jelaskan aturan di luar ERD: kepemilikan, validasi, uniqueness, penghapusan, status valid, transaksi/concurrency relevan.
4. Arsitektur mengikuti stack existing. Proyek baru memakai struktur sederhana; queue/cache/service terpisah hanya jika kebutuhan membenarkan.
5. Tetapkan kontrak input/output/error/akses sebelum delegasi. Setelah UI, selaraskan field dan tindakan.
6. Existing: delta schema serta rencana migration/backfill jika perlu. Jangan reset data demi diagram.
7. Cocokkan diagram dengan schema final. Render/parse jika tool tersedia; jika hanya pemeriksaan manual, nyatakan batasnya.

Gunakan tipe uang sesuai currency/domain; hindari float untuk nominal finansial. Tanpa database relasional, jelaskan model penyimpanan aktual tanpa memaksakan tabel.

PPOB saja: [catatan domain](../app-builder-id/references/db-arch-ppob.md).
