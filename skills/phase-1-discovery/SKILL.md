---
name: phase-1-discovery
description: Classify PPOB topup, POS, LMS, or marketplace app type and find closest clone reference before coding
---

# Phase 1 - Discovery Relevansi

## Overview

Classify app type and find closest reference. Goal: avoid building from zero.

## Steps

1. Classify request into type: `ppob-topup`, `kasir-pos`, `lms`, `marketplace`, `saas-crud`, `other`.
2. If type matches Known Map below, present relevance immediately. No need to ask URL.
3. If type `other` or unknown, MUST ask:
> "Belum ada template yang cocok. Punya URL referensi yang mau ditiru? Contoh: https://adstore.id/"
4. If URL given, fetch it with any URL-fetch capability available. If more than one exists, prefer a headless/rendered one for likely anti-bot sites. Extract: menu list, katalog, alur checkout, payment method, auth model.
5. Fetch gagal (403/blocked/empty/redirect-loop/JS-heavy)? Jangan retry lebih dari sekali total. Catat `Fetch: diblokir <host>`. Lanjut ke step 6. Dilarang mandek menunggu fetch sukses.
6. Tanpa konten fetch: tanyakan ke user deskripsi situs (dia tahu menu/alur/payment-nya) + maks 3 pertanyaan klarifikasi untuk mengisi 5 item di atas. Output tetap wajib berisi 5 item; kalau user tak tahu, isi `?` dan pakai default tipe dari Known Map. Jika masih ambigu antara 2 tipe, sebut keduanya dan minta user pilih.

## Known Map

| Type | Reference | Core entities |
|---|---|---|
| ppob-topup | adstore.id | categories, products, variants, orders, payments, banners |
| kasir-pos | majoo.id, olsera.com | products, stock, cart, transactions, shifts |
| lms | quipper.com | courses, modules, quizzes, enrollments |

## Output

```md
## Hasil Discovery
Tipe: ppob-topup
Referensi: https://adstore.id/
Entitas inti: User, Kategori, Produk, Varian(nominal), Order, Payment QRIS, Banner
Alur inti: Pilih game > Input UID > Pilih nominal > Bayar QRIS > Cek pesanan
Lanjut ke Phase 2? (ya / ganti referensi)
```

## Common Mistakes

- Langsung coding tanpa klasifikasi -> selalu discovery dulu.
- Fetch seluruh HTML mentah -> ringkas ke menu + alur saja.
