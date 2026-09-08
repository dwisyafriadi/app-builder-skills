---
name: phase-6-verification
description: Run build, type, and DB checks and confirm the app boots before declaring scaffolding done
---

# Phase 6 - Verification

## Overview

Checks that must pass before you say `Selesai`. Never skip. If a check fails, fix the cause, re-run, then continue.

## Checklist

Run each. If one fails, STOP, fix, re-run from the failure.

- [ ] `npx tsc --noEmit` -> exit 0
- [ ] `npx prisma validate` -> exit 0
- [ ] `npm install` completes
- [ ] `npm run dev` boots (hit `/` returns 200)
- [ ] `.env.example` exists, `.env` not committed
- [ ] `lib/provider.ts` has stub signature: no real gateway key in code

## Output on pass

```md
## Selesai v1 - verified
tsc: pass | prisma: pass | npm run dev: 200 OK
```

## Output on fail

```md
## Blocker: [which check failed]
Error: [first line]
Fix: [one-line cause] lalu ulangi verification.
```
