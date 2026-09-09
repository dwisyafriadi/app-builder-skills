# Mengembangkan skill pack

Pertahankan satu pengarah adaptif dan phase yang bisa dipanggil langsung. Nama phase existing dipertahankan; jangan menambah skill hanya untuk satu contoh aplikasi.

## Aturan perubahan
- Deskripsi menjelaskan kapan dipakai; detail kondisional berada di references.
- Baca konteks sebelum bertanya; tidak ada gate per phase atau batas revisi.
- Planning-only tidak berubah menjadi build tanpa diminta.
- Stack, UI, dan schema existing dipertahankan kecuali scope mengubahnya.
- Flow dan ERD menggunakan Mermaid; aturan bisnis di luar diagram tetap eksplisit.
- Referensi domain adalah contoh, bukan source of truth proyek pengguna.
- Deteksi capability aktual; jangan mengarang nama tool, respons, atau konfigurasi konektor.
- Dokumen progress hanya jika membantu pekerjaan lintas tahap.
- Bug kecil tidak dipaksa menjalani seluruh pipeline.
- Klaim selesai membutuhkan bukti sesuai perubahan.

## Sebelum mengirim perubahan
1. Periksa frontmatter name/description dan semua link relatif.
2. Jalankan validator skill jika tersedia.
3. Jalankan skenario relevan dari [evals/scenarios.md](evals/scenarios.md) dalam workspace terisolasi.
4. Uji installer untuk target baru, pemanggilan ulang, dan konflik existing.
5. Laporkan tes aktual, batas lingkungan, dan bagian yang belum diuji.

Jangan menambahkan transcript yang mengandung secret atau data pengguna. Evaluasi perilaku mengukur tindakan/artefak, bukan kesamaan kata dengan template.
