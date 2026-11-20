# Phygital application operational identity register

**Standard:** AADDG v1.0, including Level 1 extensions.
**Repository:** `Actifyappps/Phygital`.
**Status:** Current control record for the design/repository phase. It is not evidence of provisioned services or a production application.

AADDG requires staff to be able to identify the authoritative source repository, backend/data project, deployment project, production address and worker/edge service. This register answers those questions from verified repository state and must be updated only when a real project/service is provisioned and verified.

## 1. Five operational identity questions

| Question | Current verified answer | Status |
|---|---|---|
| A. Where is the source code? | GitHub repository: `Actifyappps/Phygital` — https://github.com/Actifyappps/Phygital | Repository exists; currently a documented architecture/specification skeleton, not yet a buildable application |
| B. Where is the backend/data? | No backend project or database has been provisioned. PostgreSQL/Supabase are candidate options only. | OPEN — ADR-0001/0002 and TSBBF evidence required |
| C. Where is the application deployed? | No deployment project or production runtime has been provisioned. Vercel is a candidate example, not a selected host. | OPEN — topology and commercial/operational assessment required |
| D. What is the production address? | None. No production URL/domain is approved or represented. | NOT PROVISIONED |
| E. Where do background jobs, workers and physical/edge gateways live? | Repository placeholders exist under `workers/`; no worker runtime, queue, edge gateway, QR/NFC device integration or production worker service is provisioned. | DESIGN PLACEHOLDERS ONLY |

## 2. Repository evidence snapshot

- `package.json`: absent; no application package/build manifest currently exists.
- `.env.example`: present; it documents configuration names only and contains no production secrets.
- `.github/workflows/`: no CI workflow files currently exist.
- `web/`: logical frontend/surface placeholders exist; no framework is selected.
- `src/`: absent. The `web/` versus `src/` convention remains an open architecture decision.
- `workers/`: job and schedule placeholders exist; no executable worker implementation is claimed.
- `supabase/migrations/`: active migration directory is intentionally empty.
- `supabase/candidates/migration-001-hold/`: candidate SQL, tests and acceptance checklist are preserved under HOLD; do not execute or promote.
- Migration 002: NOT AUTHORISED; no active SQL.

## 3. Update protocol

Update this register only after the relevant owner confirms the service/project identity and access, and the repository contains the corresponding approved configuration/documentation. Record environment (development, preview/test or production), project identifier, region, owner, data classification, source commit, secret-management reference (never secret values), backup/recovery arrangement, support/escalation and exit route.

Do not fill a blank with a candidate vendor, an example domain, a planned service or an inferred connection. Do not place credentials, service-role keys, database passwords, recovery codes or private URLs containing tokens in this file.

## 4. Current boundary

No database has been provisioned; no migration has been run; no CI build, preview deployment, production deployment, worker execution, real integration or live user workflow is claimed. Synthetic-data design and documentation work may continue within the approved Phase 0 boundary.

Migration 001: **HOLD**. Migration 002: **NOT AUTHORISED**. EVI-21: **OPEN**.