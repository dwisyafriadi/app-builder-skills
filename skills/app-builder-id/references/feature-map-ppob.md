# Feature map PPOB - isi proposal (gate & approval dipegang skill phase-2-features, bukan di sini)

## Usulan Fitur PPOB v1

### P0 - Wajib rilis
1. **Auth**
   - Login (email/phone + password), Daftar, Lupa password
   - Guest checkout: beli tanpa daftar, cukup no WA
   - Akun: profil, riwayat pesanan, saldo? (v1: tidak ada saldo, langsung bayar)

2. **Katalog**
   - Home: banner carousel, flash sale + countdown, grid kategori
   - Kategori: Mobile Game, Voucher, PC Game, Aplikasi Sosial/Hiburan, Game Terbaru
   - Search + filter kategori, badge Terlaris/Diskon
   - Daftar Harga (/tabelharga), Artikel (/postingan), Kalkulator ML (/kalkulator)

3. **Detail Produk + Transaksi**
   - Input: User ID + Server ID (ML), UID saja (FF), Login (Genshin/Honkai via drop-link)
   - Pilih nominal (varian): 86 Diamond, 172 Diamond, dst + harga coret/harga QRIS
   - Keranjang sederhana (1 item checkout langsung, tanpa cart kompleks di v1)
   - Payment: QRIS (prioritas harga terbaik), VA, E-wallet, Alfamart
   - Cek Pesanan (/payment): input invoice, tampilkan status Pending/Paid/Processing/Success/Failed

4. **Notifikasi**
   - In-app (/notifikasi): status order berubah
   - WA: invoice + QR + status sukses via API (Fonnte/Wablas)

5. **Admin (minimal v1)**
   - CRUD kategori, produk, varian + harga modal/harga jual
   - CRUD banner, flash sale (produk + jam mulai/selesai + stok promo)
   - Lihat order + ubah status manual + refund manual
   - Laporan harian: omzet, profit, order sukses/gagal

### P1 - Nanti (v2)
- Member level + poin, voucher diskon, affiliate, kalkulator MMR, multi-bahasa, dark/light toggle

---
## Revisi `Tambah:` - pemetaan (dipakai skill phase-2 step 5)

| User kata | Apa yang ditambah ke proposal |
|---|---|
| `Tambah: pulsa Telkomsel` | Kategori `Pulsa & PPOB`, produk `Telkomsel 5k-100k`, `nomor_tujuan` = UID |
| `Tambah: token PLN` | Produk `PLN 20k-500k` di kategori `Pulsa & PPOB`, `nomor_tujuan` = ID PLN |
| `Tambah: e-wallet/Dana/OVO` | Produk `Dana`, `OVO` isi saldo, `nomor_tujuan` = no HP |
| `Tambah: paket data` | Produk `XL/Axis/Telkomsel Data`, `nomor_tujuan` = no HP |
| `Tambah: voucher game` | Produk voucher (Google Play, PSN) di kategori `Voucher` |

Revisi max 3x, lalu kunci P0 terakhir, sisanya lempar ke P1. Produk baru selalu butuh `input_type` (NOMOR_TUJUAN utk pulsa/PLN) dan `provider_code`/`sku` baru.
