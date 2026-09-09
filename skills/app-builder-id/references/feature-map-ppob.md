# Contoh scope PPOB

Baca hanya untuk PPOB. Ini kandidat, bukan scope wajib.

Flow minimum: pilih produk → isi tujuan → pilih nominal → bayar → lihat status. Role, metode pembayaran, dan provider mengikuti permintaan.

| Kandidat | Kriteria penerimaan contoh |
|---|---|
| Katalog | Produk aktif dan nominal tersedia terlihat |
| Order | Tujuan divalidasi sesuai produk, harga dihitung server |
| Pembayaran | Status berubah setelah bukti pembayaran tervalidasi |
| Status pesanan | Hanya pihak berhak dapat mengakses |
| Pengelolaan produk | Pengelola dapat mengubah harga; publik tidak |

Guest checkout, login, notifikasi, laporan, banner, flash sale, saldo, voucher, affiliate tidak otomatis masuk MVP.
Pulsa/PLN/e-wallet dapat memiliki input tujuan berbeda; validasi dan SKU mengikuti provider. Jangan menambah integrasi/kategori tanpa kebutuhan.
