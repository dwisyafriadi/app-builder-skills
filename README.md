# App Builder ID

Skill pack berbahasa Indonesia untuk membangun MVP, menambah fitur, memperbaiki bug, dan mengubah aplikasi existing. Satu pintu masuk: `app-builder-id`. Baca konteks dahulu, tanyakan keputusan penting saja, lalu jalankan tahap sesuai dampak.

## Cara kerja

| Permintaan | Perilaku |
|---|---|
| Buat aplikasi baru | Pengguna/tujuan → menu → flow dan ERD Mermaid → UI → arsitektur final → flow lengkap → verifikasi |
| Tambah wishlist | Baca repo → delta fitur → ubah data/UI yang relevan → implementasi → verifikasi |
| Login gagal | Reproduksi → penyebab → perbaikan terarah → cek regresi |
| Ganti label tombol | Baca → edit → cek terarah |
| Buat plan saja | Hasilkan plan; tidak menulis implementasi |
| Lanjutkan pekerjaan | Cocokkan progress dengan kode dan lanjutkan tugas yang belum selesai |

Tidak ada gate "OK lanjut" setiap phase, batas revisi, stack wajib, atau paksaan Stitch untuk edit kecil. Keputusan material yang belum jelas tetap ditanyakan. Tindakan eksternal/destruktif mengikuti otorisasi yang berlaku.

## Struktur

Nama phase lama tetap tersedia agar pemanggilan existing tidak putus; angka bukan urutan wajib.

| Folder di skills/ | Fungsi |
|---|---|
| app-builder-id | Pengarah; referensi maintenance, artefak, delegasi |
| phase-1-discovery | Konteks pengguna dan repository |
| phase-2-features | Scope, menu/role, kriteria penerimaan |
| phase-4-database | Flowchart Mermaid, ERD Mermaid, aturan data, arsitektur |
| phase-3-frontend | Memilih desain existing atau Stitch |
| phase-3a-frontend-stitch | Brief dan desain melalui capability Stitch |
| phase-3b-frontend-tailwind | UI lokal mengikuti stack existing |
| phase-5-scaffolding | Implementasi flow lengkap |
| phase-6-verification | Bukti hasil sesuai scope dan stack |

Ini file instruksi, bukan runtime yang menjalankan dirinya sendiri. Semua folder perlu dipasang bersama karena link relatif antarskill.

## Instalasi

Pilih alat yang digunakan di bawah. Setelah pemasangan atau update, buka sesi
baru dan pastikan App Builder ID terlihat di daftar plugin/skill.
Instalasi membuat skill tersedia; pemilihan otomatis mengikuti kemampuan host.

## Claude Code

Jalankan di Claude Code:

```text
/plugin marketplace add dwisyafriadi/app-builder-skills
/plugin install app-builder-id@app-builder-id-marketplace
```

Panggil pengarah:

```text
/app-builder-id:app-builder-id Tambahkan fitur wishlist.
```

Untuk memperbarui:

```text
/plugin marketplace update app-builder-id-marketplace
/plugin update app-builder-id@app-builder-id-marketplace
```

Mulai sesi baru setelah update. Hindari memasang skill yang sama sekaligus
melalui junction `.claude/skills` dan plugin.

## Codex

Gunakan versi Codex yang menyediakan `codex plugin`:

```sh
codex plugin marketplace add dwisyafriadi/app-builder-skills
codex plugin add app-builder-id@app-builder-id-marketplace
```

Untuk memperbarui marketplace Git dan memasang ulang versi terbaru:

```sh
codex plugin marketplace upgrade app-builder-id-marketplace
codex plugin add app-builder-id@app-builder-id-marketplace
```

Buka thread baru, lalu pilih skill App Builder ID atau minta:

```text
Gunakan app-builder-id untuk memperbaiki bug login.
```

## OpenCode

Clone repository satu kali. Perintah ini dapat digunakan di PowerShell maupun
shell macOS/Linux:

```sh
git clone https://github.com/dwisyafriadi/app-builder-skills.git "$HOME/app-builder-id"
```

Gabungkan [konfigurasi integrasi OpenCode](integrations/opencode.json) berikut
ke `~/.config/opencode/opencode.json`. Jika belum ada, buat file tersebut.
Pertahankan pengaturan existing dan sesuaikan `skills.paths` jika lokasi clone berbeda.

```json
{
  "$schema": "https://opencode.ai/config.json",
  "skills": {
    "paths": ["~/app-builder-id/skills"]
  },
  "command": {
    "app-builder-id": {
      "description": "Bangun aplikasi, tambah fitur, atau perbaiki bug dengan App Builder ID",
      "template": "Muat skill app-builder-id dan ikuti referensi yang relevan untuk permintaan ini: $ARGUMENTS"
    }
  }
}
```

Restart OpenCode, lalu panggil:

```text
/app-builder-id Tambahkan fitur wishlist.
```

Untuk memperbarui skill:

```sh
git -C "$HOME/app-builder-id" pull --ff-only
```

Restart OpenCode setelah update. Jika konfigurasi integrasi berubah, gabungkan
perubahan JSON tersebut juga. Integrasi ini menggunakan discovery skill OpenCode
dan tidak membutuhkan paket npm.

## Instalasi manual

Installer berikut tersedia sebagai alternatif pemasangan marketplace.

Windows, dari repository ini:

```powershell
.\install.ps1
# Default: junction semua skill ke .agents/skills dalam repository ini.
# Pilih direktori yang dibaca host atau repository tujuan:
.\install.ps1 -Destination 'E:\proyek-saya\.agents\skills'
# Pratinjau tanpa menulis:
.\install.ps1 -WhatIf
```

`install.bat` meneruskan argumen ke installer PowerShell.

macOS/Linux:

```bash
bash install.sh
# Atau lokasi skill yang dibaca host:
bash install.sh /path/to/project/.agents/skills
```

Installer tidak mengganti file/link berbeda yang sudah ada. Jika konflik, periksa tujuan dan selesaikan secara sadar. Junction/symlink membutuhkan source repository tetap berada di lokasinya; untuk distribusi mandiri, salin semua folder di skills/ bersama-sama.

Pilih direktori discovery sesuai dokumentasi host. Setelah instalasi, buka sesi baru/reload sesuai host dan pastikan skill terlihat. Instalasi saja tidak menjamin pemilihan otomatis; kemampuan discovery dan invocation mengikuti host.

Untuk pemanggilan eksplisit di host yang mendukung sintaks ini:

```text
$app-builder-id Tambahkan fitur wishlist mengikuti pola repository ini.
```

Jika host tidak menyediakan pemanggilan skill, minta AI membaca `skills/app-builder-id/SKILL.md` beserta referensi yang relevan.

Instruksi opsional pada file proyek yang dibaca host:

```markdown
Untuk membangun aplikasi, menambah fitur, dan memperbaiki bug, gunakan
app-builder-id sebagai pengarah jika tersedia. Baca konteks dahulu dan
pilih tahap sesuai dampak. Perubahan kecil tidak memerlukan blueprint lengkap.
```

## Menerbitkan pembaruan

1. Edit sumber instruksi di `skills/`.
2. Naikkan `version` pada `.claude-plugin/plugin.json` dan `.codex-plugin/plugin.json`
   ke versi SemVer yang sama, misalnya `0.2.1`.
3. Validasi manifest dan uji pemanggilan pada host yang tersedia.
4. Commit dan push perubahan ke branch default repository.
5. Bagikan nomor versi dan instruksi update untuk masing-masing alat di atas.

Pertahankan nama plugin dan marketplace agar pengguna tidak perlu mendaftar ulang.
Detail katalog dan pengujian lokal tersedia di [panduan integrasi](integrations/README.md).

## Artefak dan Stitch

Gunakan dokumentasi existing. Untuk pekerjaan besar tanpa dokumen, default:
- docs/app/blueprint.md: scope, menu, flowchart, ERD, UI, kontrak, kriteria penerimaan.
- docs/app/progress.md: keputusan, status tugas, dependensi, bukti pemeriksaan.

Fenced Mermaid dapat dilihat pada viewer yang mendukung Mermaid. Diagram harus selaras dengan schema dan implementasi; diagram bukan migration.

Stitch dipakai jika tersedia dan eksplorasi desain diperlukan. Tanpa konektor, hasilkan brief dan lanjutkan UI lokal jika scope mengizinkan. Jika hasil secara eksplisit wajib dari Stitch, laporkan bagian tersebut terblokir. Jangan mengklaim desain telah dibuat dari brief saja.

Subagent hanya untuk tugas independen dengan kontrak dan pemilik file jelas; default awal maksimal dua pekerja. Tanpa subagent, alur tetap bisa dikerjakan berurutan.

## Validasi kualitas

Lihat [skenario evaluasi](evals/scenarios.md) dan [kontribusi](CONTRIBUTING.md). Validasi format tidak membuktikan skill otomatis terpicu atau aplikasi berhasil dibangun. Uji perilaku pada sesi host aktual dan catat pertanyaan, keberhasilan, waktu, rework, serta biaya.

<!-- Referensi pendekatan:
- [Superpowers](https://github.com/obra/superpowers): rencana, delegasi, review, verifikasi.
- [Karpathy-inspired guidelines](https://github.com/multica-ai/andrej-karpathy-skills): kesederhanaan, perubahan terarah, tujuan terverifikasi. -->
