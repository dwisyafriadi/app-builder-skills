# Delegasi adaptif

Gunakan bila tersedia, diizinkan host, dan tugas independen cukup besar.

1. Tetapkan scope, kontrak bersama, dependency graph, dan pemilik file.
2. Untuk aplikasi baru, buktikan satu flow lengkap sebelum memperbanyak implementasi.
3. Mulai maksimal dua pekerja bersamaan; tambah hanya bila tugas independen dan kapasitas tersedia.
4. Hindari edit file yang sama secara paralel. Schema, lockfile, routing pusat, dan kontrak bersama punya satu pemilik. Selesaikan dependensi sebelum konsumen mulai.
5. Brief berisi tujuan, input/output, file yang boleh diubah, dependensi, kriteria penerimaan, verifikasi, dan lokasi laporan. Jangan kirim seluruh riwayat.
6. Pekerja melaporkan perubahan, bukti cek, blocker; tidak mendelegasikan lagi tanpa koordinasi.
7. Pengarah menyatukan perubahan dan memeriksa integrasi. Review independen digunakan pada perubahan kompleks/berisiko.
8. Jika review berulang gagal, identifikasi masalah konteks, pembagian, atau implementasi; ubah pendekatan. Jangan meloloskan kegagalan karena kuota habis.

Tugas kecil dikerjakan sendiri. Worktree membantu isolasi, tetapi tidak menghapus kebutuhan kontrak dan integrasi.
