# Maintenance repository existing

## Tambah atau ubah fitur
1. Temukan route, model, komponen, service, tes, dan dokumentasi terkait.
2. Nyatakan delta: sebelum/sesudah, role, kriteria penerimaan, bagian terdampak.
3. Pertahankan kontrak existing kecuali perubahan diperlukan; periksa caller dan kompatibilitas data.
4. Perbarui flow, ERD, atau UI hanya jika terdampak. Ketiadaan blueprint bukan blocker.
5. Implementasikan input sampai hasil tersimpan/terlihat, lalu verifikasi.

## Bug
1. Kumpulkan reproduksi, hasil aktual, hasil yang diharapkan, dan bukti. Jangan mencetak secret/data pribadi dari log.
2. Reproduksi melalui tes atau langkah manual. Jika belum berhasil, nyatakan itu; telusuri kode dan minta bukti minimum bila perlu.
3. Pisahkan hipotesis dan penyebab terbukti. Telusuri aliran data sebelum mengedit.
4. Buat regression test jika menangkap kegagalan nyata dan memberi perlindungan berguna. Perubahan visual sederhana dapat diperiksa secara visual.
5. Buat perbaikan terarah, ulangi reproduksi dan pemeriksaan area terdampak.
6. Build lolos saja tidak membuktikan bug selesai.

## Perubahan kecil
Label, spacing, atau konfigurasi terbatas: baca, edit, periksa. Jangan memaksa proposal desain, migration, atau subagent.

## Perubahan data
Periksa data existing, nullability, constraint, backfill, caller, dan kompatibilitas deployment. Siapkan migration yang reviewable; jangan reset atau memutasi database shared/production secara destruktif tanpa otorisasi sesuai.
