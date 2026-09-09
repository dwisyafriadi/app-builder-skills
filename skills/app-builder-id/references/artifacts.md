# Kontrak artefak

Gunakan dokumentasi existing terlebih dahulu. Default berikut hanya untuk pekerjaan lintas tahap.

## docs/app/blueprint.md
- Tujuan: pengguna, masalah, hasil utama, batas lingkungan.
- Scope: fitur, di luar MVP, fakta/sumber, asumsi, pertanyaan penting.
- Menu: ID fitur, role, route/layar, tindakan, kriteria penerimaan.
- Flow: Mermaid flowchart alur utama dan kegagalan penting.
- Data: Mermaid erDiagram dengan tipe, PK/FK, kardinalitas; aturan status, akses, validasi, constraint di luar diagram.
- UI: layar, komponen, state loading/kosong/error/sukses, referensi hasil Stitch atau status brief.
- Arsitektur: stack/alasan, modul, kontrak input/output/error, akses, penyimpanan, integrasi, konfigurasi, cara menjalankan.
- Traceability: ID fitur → flow → layar → entitas → pemeriksaan.

Contoh: F03 Booking → FLOW03 → /booking → bookings → tes konflik slot.
Hubungkan artefak dengan ID; jangan menggandakan aturan bisnis di banyak dokumen.

## docs/app/progress.md
Scope aktif, keputusan/alasan, status tugas, pemilik file, dependensi, pemeriksaan (perintah dan hasil), blocker.
Status: planned, in-progress, verified, blocked. Verified membutuhkan bukti.

## Konsistensi
Setiap tindakan memiliki hasil dan kriteria penerimaan. Layar mengikuti akses role. Data memiliki sumber atau status demo jelas. Diagram diselaraskan dengan kode/schema/migration final. Jika penyimpanan tidak relasional, jelaskan model aktual tanpa menciptakan tabel hanya demi ERD.
