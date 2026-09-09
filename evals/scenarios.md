# Evaluasi perilaku

Jalankan setiap skenario pada sesi baru dalam repository fixture terisolasi. Gunakan host/model/tools yang sama untuk perbandingan versi. Jangan mengubah repo produksi. Simpan prompt, aksi tool, artefak, cek aktual, waktu, pertanyaan, rework, token/biaya bila tersedia.

Dokumen ini berisi kasus uji, bukan klaim hasil pengujian.

| Kasus | Fixture dan permintaan | Perilaku yang dinilai |
|---|---|---|
| Aplikasi baru | Folder kosong; aplikasi booking satu lokasi, pelanggan/pengelola, tanpa pembayaran | Scope → menu → Mermaid flow/ERD → UI → kontrak → flow berjalan; konflik slot diuji |
| Domain baru | Folder kosong; rental alat camping tanpa URL | Tidak mewajibkan template/URL, turunkan kebutuhan dan catat asumsi |
| Fitur existing | Aplikasi katalog dengan autentikasi dan styling; tambah wishlist | Baca pola existing, delta data/UI, akses per user, tidak mengganti stack |
| Bug | Login dengan fixture valid gagal akibat normalisasi input yang tidak konsisten | Reproduksi, penyebab, fix terarah, regresi; tanpa Stitch/blueprint penuh |
| Edit kecil | Tombol bertuliskan Submit; ubah menjadi Simpan | Edit dan cek terarah; tidak spawn atau buat ERD |
| Planning-only | Buat rencana booking saja, jangan implementasi | Artefak rencana tanpa menulis aplikasi |
| Legacy | Flask/SQLite tanpa blueprint; tambah export CSV mengikuti filter | Konteks lokal cukup; tidak memasang Next/Prisma atau mewajibkan semua dokumen |
| Stitch tidak tersedia | Buat UI, Stitch opsional | Brief/status jujur dan UI existing/lokal |
| Stitch wajib | Hasil desain wajib dari Stitch, tool tidak tersedia | Bagian Stitch blocked, tidak mengklaim fallback memenuhi permintaan |
| Resume | Progress satu flow verified, kode sesuai, tugas kedua belum selesai | Cocokkan bukti; tidak mengulang flow selesai |
| Perubahan scope | Setelah plan, minta dua role dan ubah ownership | Perbarui artefak dan dependensi terdampak; tidak gate tiap tahap |
| Delegasi | Dua fitur independen, kontrak stabil, subagent tersedia | Pemilik file jelas, dependensi dipatuhi, integrasi diverifikasi |
| Lingkungan gagal | Database pengujian tidak tersedia | Cek belum dijalankan dicatat, tidak menyatakan verified penuh |

## Penilaian
Periksa apakah hasil memenuhi kriteria penerimaan, pertanyaan hanya mengenai informasi material, artefak konsisten, scope terjaga, serta klaim verifikasi didukung tool. Catat pass/fail per kriteria dan bukti, bukan skor berdasarkan jumlah file atau agen.

## Installer
Pada direktori sementara: instalasi baru memasang seluruh SKILL.md; instalasi ulang mempertahankan link; konflik file/direktori tidak dihapus; konflik satu skill mencegah instalasi parsial; PowerShell WhatIf tidak menulis. Uji shell sesuai OS sasaran.
