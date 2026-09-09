# Data dan integrasi PPOB

Contoh konseptual, bukan schema executable untuk disalin tanpa penyesuaian.

```mermaid
erDiagram
    PRODUCTS ||--o{ VARIANTS : offers
    VARIANTS ||--o{ ORDERS : selected_in
    ORDERS ||--o{ PAYMENTS : has_attempts
    PRODUCTS {
        string id PK
        string name
    }
    VARIANTS {
        string id PK
        string product_id FK
        string sku UK
        int price
    }
    ORDERS {
        string id PK
        string variant_id FK
        string destination
        int amount
        string status
    }
    PAYMENTS {
        string id PK
        string order_id FK
        string gateway_ref UK
        string status
    }
```

Tambahkan ownership, expiry, currency, audit fields, dan entitas sesuai scope. Simpan snapshot harga pada order; jangan percaya harga client. Integer contoh mengasumsikan IDR.

Putuskan aturan:
- Akses pesanan: invoice yang dapat ditebak bukan autentikasi.
- Transisi pembayaran/order, pembayaran terlambat, kegagalan pemenuhan.
- Signature webhook, nominal, currency, dan identitas order sesuai provider.
- Unique gateway reference saja tidak menjamin idempotency: transaksi/transisi bersyarat harus mencegah pemenuhan ganda.
- Retry create transaksi membutuhkan dukungan idempotency/rekonsiliasi; jangan retry buta.
- Worker, polling, timeout, refund mengikuti kebutuhan/kontrak aktual.

Tidak ada janji performa tanpa pengukuran. Buat schema/migration lengkap untuk proyek aktual; contoh bukan implementasi Prisma.
