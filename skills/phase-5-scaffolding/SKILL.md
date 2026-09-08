---
name: phase-5-scaffolding
description: Generate a runnable Next.js 15 + Prisma project skeleton that installs and starts, after the DB design is approved
---

# Phase 5 - Scaffolding Runnable

## Overview

Generate minimal project that runs `npm install && npm run dev`. No placeholder TODO.

## Stack Default

Next.js 15 App Router + TypeScript + Tailwind + Prisma + Postgres.

## Steps

1. If Phase 1 type is NOT `ppob-topup`: skip the reference file entirely; generate Prisma from the DBML approved in Phase 4 for that type. Never copy the PPOB schema onto a POS/LMS/marketplace app.
2. If it IS `ppob-topup`: read DB schema source of truth `../app-builder-id/references/db-arch-ppob.md`. Mirror `prisma/schema.prisma` 1:1 to its DBML.
3. `package.json` deps: next@15, react, prisma, @prisma/client, zod, tailwindcss, typescript, @types/*. Scripts: `dev`, `build`, `lint`, `db:migrate` (`prisma migrate dev`).
4. `prisma/schema.prisma` - only tables from the approved DBML, never invent tables.
5. Mirror approved UI pages into routes (PPOB example below; POS/LMS/other shape differs):
```
app/(shop)/page.tsx
app/games/[slug]/page.tsx
app/payment/[invoice]/page.tsx
app/api/orders/route.ts
app/api/webhook/route.ts
lib/provider.ts
lib/rupiah.ts
```
6. `lib/rupiah.ts`:
```ts
export const rupiah = (n:number) => new Intl.NumberFormat('id-ID',{style:'currency',currency:'IDR',minimumFractionDigits:0}).format(n);
```
7. `lib/provider.ts` - match Phase 4 contract (timeout 10s, retry 3x):
```ts
export interface ProviderTx { ref: string }
export async function createTx(p:{uid:string;server?:string;sku:string}):Promise<ProviderTx>;
export async function checkStatus(ref:string):Promise<'pending'|'success'|'failed'>;
```
8. Webhook route verifies signature and is idempotent by `gateway_ref` (see reference file). No real keys in code; gateways are stubbed behind `lib/provider.ts`.
9. `.env.example`:
```
DATABASE_URL=postgresql://user:pass@localhost:5432/app
PROVIDER_KEY=
QRIS_KEY=
WA_KEY=
STITCH_API_KEY=
```
10. No secrets committed. Only `.env.example`. Add `.env` to `.gitignore`.

## Verification (also run skill phase-6-verification)

- [ ] `npx tsc --noEmit` pass
- [ ] `npx prisma validate` pass
- [ ] `npm install` + `npm run dev` boots without Stitch
- [ ] No secret committed, only `.env.example`

## Done Output

```md
## Selesai v1
Run: npm install && npx prisma migrate dev && npm run dev
Cek: / , /games/mobile-legends, /payment/INV-001
Next v2: admin CRUD, kalkulator ML, artikel
```
