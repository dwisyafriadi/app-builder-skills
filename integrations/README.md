# Instalasi dan update App Builder ID

Sumber instruksi tetap di `skills/`. Manifest Claude Code dan Codex menunjuk
folder yang sama. Paket ini memakai root repository sebagai root plugin;
tidak perlu menggandakan skill ke folder plugin lain.

Perintah GitHub di bawah berlaku setelah perubahan ini di-commit dan di-push
ke `dwisyafriadi/ppob-skills-agent`. Memasang paket hanya membuat skill tersedia;
pemilihan otomatis tetap bergantung pada host dan permintaan pengguna.

## Claude Code

Jalankan di Claude Code:

```text
/plugin marketplace add dwisyafriadi/ppob-skills-agent
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

Mulai sesi baru setelah update. Untuk pengujian sebelum push, tambahkan marketplace
dengan path absolut checkout ini sebagai pengganti `dwisyafriadi/ppob-skills-agent`.
Hindari memasang skill yang sama sekaligus melalui junction `.claude/skills` dan plugin.

## Codex

Gunakan versi Codex yang menyediakan `codex plugin`:

```sh
codex plugin marketplace add dwisyafriadi/ppob-skills-agent
codex plugin add app-builder-id@app-builder-id-marketplace
```

Untuk memperbarui marketplace Git dan memasang ulang versi terbaru:

```sh
codex plugin marketplace upgrade app-builder-id-marketplace
codex plugin add app-builder-id@app-builder-id-marketplace
```

Buka thread baru dan periksa bahwa App Builder ID muncul di daftar plugin/skill.
Panggil skill melalui pemilih skill atau minta: `Gunakan app-builder-id untuk
memperbaiki bug login.`

Katalog Codex berada di `.agents/plugins/marketplace.json`; `source.path` dihitung
dari root repository. Untuk uji lokal, gunakan `codex plugin marketplace add`
dengan path absolut checkout ini, lalu jalankan perintah pemasangan di atas.
Marketplace lokal diperbarui dengan mengubah checkout dan memasang ulang plugin;
`marketplace upgrade` ditujukan untuk marketplace Git.

## OpenCode

OpenCode membaca skill melalui konfigurasi `skills.paths`. File
[opencode.json](opencode.json) adalah konfigurasi integrasi skill dan command,
bukan manifest plugin JavaScript/TypeScript.

Clone satu kali ke lokasi tetap. PowerShell:

```powershell
git clone https://github.com/dwisyafriadi/ppob-skills-agent.git "$HOME/app-builder-id"
```

macOS/Linux:

```sh
git clone https://github.com/dwisyafriadi/ppob-skills-agent.git ~/app-builder-id
```

Gabungkan isi `integrations/opencode.json` ke konfigurasi global
`~/.config/opencode/opencode.json`. Jika belum ada, salin sebagai file baru.
Pertahankan pengaturan existing; tambahkan path ke array `skills.paths` dan
entry `app-builder-id` ke objek `command`. Jika lokasi clone berbeda, sesuaikan path.
Restart OpenCode lalu gunakan `/app-builder-id Tambahkan fitur wishlist.`

Untuk update, jalankan dari PowerShell atau shell POSIX:

```sh
git -C "$HOME/app-builder-id" pull --ff-only
```

Restart OpenCode setelah update. Jika konfigurasi integrasi berubah dalam rilis
baru, gabungkan perubahan JSON tersebut juga. Tidak ada paket npm yang perlu dipasang.
Contoh MCP Stitch tetap opsional di `.opencode/opencode.json.example`; isi
`STITCH_API_KEY` melalui environment jika memakai konfigurasi tersebut.

## Menerbitkan pembaruan

1. Edit sumber instruksi di `skills/`.
2. Naikkan `version` pada `.claude-plugin/plugin.json` dan
   `.codex-plugin/plugin.json` ke versi SemVer yang sama, misalnya `0.2.1`.
3. Validasi manifest dan uji pemanggilan pada host yang tersedia.
4. Commit dan push perubahan ke branch default repository.
5. Bagikan nomor versi dan instruksi update di atas. Tag Git seperti `v0.2.1`
   boleh ditambahkan untuk menandai rilis; katalog ini mengikuti branch default.

Nama plugin dan marketplace dipertahankan antarversi agar pengguna tidak perlu
mendaftar ulang. Versi plugin diletakkan pada manifest, bukan disalin ke katalog.
JSON tidak melakukan push atau mengaktifkan pembaruan otomatis pada mesin pengguna.

Referensi format:

- [Claude Code marketplace](https://code.claude.com/docs/en/plugin-marketplaces)
- [Paket dan marketplace Codex](https://developers.openai.com/plugins/build/plugins)
- [Schema konfigurasi OpenCode](https://opencode.ai/config.json)
- [Skill OpenCode](https://opencode.ai/docs/skills/)
