---
name: phase-1-discovery
description: Kumpulkan konteks untuk perencanaan aplikasi baru atau fitur, termasuk pengguna, tujuan, pola repository, dan batas MVP sebelum merancang perubahan.
---

# Discovery berbasis konteks

1. Kenali aplikasi baru atau existing. Baca instruksi, manifest/lockfile, dokumentasi, schema, kode, dan tes terkait sebelum bertanya.
2. Rangkum pengguna/role, masalah, hasil utama, scope, batas teknis, fakta/sumber, dan asumsi. Pada fitur existing, fokus area perubahan.
3. Baca URL jika diberikan atau diperlukan. Bedakan tampilan yang terlihat dari backend yang tidak diketahui. Jika gagal diakses, catat keterbatasan dan gunakan konteks tersedia.
4. Tipe aplikasi tidak harus ada di katalog. Turunkan entitas/flow dari kebutuhan; jangan mewajibkan URL untuk tipe baru.
5. Tanya hanya keputusan penting yang belum terjawab. Keputusan rutin yang mudah dibalik mengikuti pola proyek dengan asumsi tercatat.
6. Jika build diminta, lanjut ke [features](../phase-2-features/SKILL.md) ketika konteks cukup. Jika discovery-only, berhenti pada artefaknya.

Output: konteks ringkas, sumber, batas MVP, batas arsitektur awal (offline/multi-tenant/integrasi bila relevan), ketidakpastian penting. Tidak ada gate per tahap.
