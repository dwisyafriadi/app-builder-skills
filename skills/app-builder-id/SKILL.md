---
name: app-builder-id
description: Bangun MVP aplikasi baru, tambahkan atau ubah fitur, dan perbaiki bug dalam repository aplikasi. Baca konteks dahulu lalu pilih planning, desain, implementasi, dan verifikasi sesuai dampak pekerjaan.
---

# App Builder ID

Pengarah pembangunan aplikasi. Jawab dalam bahasa pengguna dan ikuti pola kode repository. Nama phase dipertahankan untuk kompatibilitas; angka bukan urutan wajib.

## Baca konteks dahulu

Baca instruksi proyek, status perubahan lokal, dokumentasi, manifest/lockfile, modul, schema/migration, dan tes yang relevan. Batasi eksplorasi pada kebutuhan tugas. Jangan menimpa pekerjaan lokal yang tidak terkait.

Pisahkan fakta beserta sumber, asumsi yang mudah dibalik, dan ketidakpastian penting. Cari jawaban di repo sebelum bertanya. Ikuti stack dan konvensi existing.

Tanyakan hanya keputusan yang belum terjawab dan mengubah hasil secara material: aturan bisnis, kepemilikan data, scope, atau integrasi berbayar. Kelompokkan pertanyaan terkait; lanjutkan bagian independen sambil menunggu. Tidak ada gate "OK lanjut" setiap tahap. Hormati permintaan planning-only serta otorisasi untuk tindakan eksternal/destruktif.

## Pilih jalur

| Permintaan | Jalur minimum | Perluasan |
|---|---|---|
| Aplikasi baru | discovery → features → database/flow → frontend → scaffolding → verification | Batas arsitektur sejak discovery, finalisasi setelah desain |
| Tambah/ubah fitur | discovery terarah → features berupa delta → scaffolding → verification | Database jika data/flow berubah; frontend jika UI berubah |
| Bug | [maintenance](references/maintenance.md) → verification | Dokumen diperbarui jika perilaku/kontrak berubah |
| Edit kecil | Baca → edit → pemeriksaan relevan | Tanpa blueprint, ERD, Stitch, atau subagent wajib |
| Hanya plan/UI/DB/review | Artefak yang diminta | Jangan otomatis membangun aplikasi |

Panggil skill melalui mekanisme host jika tersedia, atau baca file relatif. Muat hanya yang diperlukan:
- [Discovery](../phase-1-discovery/SKILL.md): konteks dan batas MVP.
- [Features](../phase-2-features/SKILL.md): menu, role, kriteria penerimaan.
- [Database](../phase-4-database/SKILL.md): flow dan ERD Mermaid, aturan data, arsitektur.
- [Frontend](../phase-3-frontend/SKILL.md): desain existing atau Stitch.
- [Build](../phase-5-scaffolding/SKILL.md): flow lengkap.
- [Verification](../phase-6-verification/SKILL.md): bukti hasil.

## Konteks lintas sesi

Untuk pekerjaan lintas tahap, gunakan dokumen proyek existing. Jika belum ada, gunakan docs/app/blueprint.md dan docs/app/progress.md sesuai [kontrak artefak](references/artifacts.md). Bug kecil cukup catatan hasil; dokumentasi lengkap bukan prasyarat repository lama.

Simpan keputusan, asumsi, tugas, dependensi, dan bukti pemeriksaan. Saat melanjutkan, cocokkan catatan dengan kode/status git. Jangan mengulang tugas selesai atau menganggap dokumen usang sebagai fakta. Perubahan scope memperbarui bagian terdampak dan tugas turunannya; jangan mengunci revisi secara arbitrer.

## Delegasi dan selesai

Baca [delegasi](references/delegation.md) untuk pekerjaan independen yang cukup besar, jika tersedia dan diizinkan host. Tanpa capability itu, kerjakan sendiri.

Laporkan hasil, pemeriksaan aktual, dan blocker. Bedakan rancangan, demo lokal, dan integrasi nyata. Skeleton/mock tidak membuktikan MVP terintegrasi.
