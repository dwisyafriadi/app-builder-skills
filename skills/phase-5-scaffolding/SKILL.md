---
name: phase-5-scaffolding
description: Implementasikan flow MVP lengkap atau fitur existing berdasarkan scope dan kontrak jelas, menggunakan stack repository dan memverifikasi integrasinya.
---

# Build flow lengkap

Nama lama dipertahankan; hasil bukan skeleton kecuali itu yang diminta.

1. Baca scope, kriteria penerimaan, kode, manifest/lockfile, kontrak. Pertahankan stack/package manager existing.
2. Proyek baru: pilih stack sederhana; cek kompatibilitas versi melalui dokumentasi resmi bila perlu. Jangan mengunci seluruh proyek ke versi framework tertentu.
3. Tetapkan arsitektur/kontrak cukup untuk build. Implementasikan satu flow dari input/UI, validasi, akses, penyimpanan, sampai hasil terbaca kembali.
4. Bagi sisa pekerjaan menurut flow. [Delegasi](../app-builder-id/references/delegation.md) hanya untuk tugas independen.
5. Implementasikan aturan domain dan error realistis. Tidak ada fungsi bertanda tangan saja, TODO inti, atau tombol tanpa aksi dalam scope selesai.
6. Siapkan migration dan contoh konfigurasi sesuai kebutuhan; tindakan data destruktif/shared memerlukan otorisasi sesuai. Jangan commit secret.
7. Integrasi eksternal memakai kontrak aktual. Jika akses/credential belum tersedia, demo lokal eksplisit boleh dipakai bila sesuai; tandai integrasi nyata belum diverifikasi. Jangan membuat sukses palsu.
8. Jalankan [verification](../phase-6-verification/SKILL.md), selaraskan dokumen dengan implementasi, sediakan cara menjalankan.

Bug langsung memakai [maintenance](../app-builder-id/references/maintenance.md); tidak perlu scaffold baru.
