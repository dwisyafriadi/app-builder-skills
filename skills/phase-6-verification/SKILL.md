---
name: phase-6-verification
description: Verifikasi aplikasi, fitur, atau bug terhadap kriteria penerimaan dan stack aktual sebelum menyatakan pekerjaan selesai.
---

# Verifikasi dengan bukti

Pilih pemeriksaan dari manifest, CI, dan area perubahan. Jangan memaksa TypeScript/Prisma pada stack lain atau memasang dependency berulang tanpa kebutuhan.

| Perubahan | Bukti |
|---|---|
| Aplikasi baru / fitur lintas lapisan | Build/check relevan dan flow input sampai hasil |
| Bug | Reproduksi sebelum jika memungkinkan, hasil sesudah, regresi terkait |
| UI | Tindakan, state, navigasi, aksesibilitas, responsive relevan |
| Schema / akses | Validasi schema/migration di lingkungan sesuai, aturan data, role |
| Edit kecil | Pemeriksaan terarah tanpa suite baru yang tidak berguna |

Cek kegagalan penting sesuai domain: input invalid, akses ditolak, konflik state/concurrency, kegagalan layanan. HTTP 200/server boot saja tidak membuktikan flow bisnis.

Jika cek gagal, cari penyebab, perbaiki, ulangi area terdampak. Bedakan baseline dan regresi. Jika lingkungan menghalangi, catat perintah/error/dampak serta cek yang belum dilakukan; jangan ubah menjadi pass.

Laporan: hasil sesuai scope, perintah/langkah cek dan hasil aktual, keterbatasan/mock/integrasi belum diuji, cara menjalankan jika aplikasi baru atau berubah. Verified hanya untuk bagian yang memiliki bukti; lokal bukan deployment.
