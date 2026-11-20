# Actify TSBBF and AADDG source conformance verification

**Sources:**
- Actify Inc. Technology Selection & Build-vs-Buy Framework (TSBBF) v1.0, ratified 31 October 2026; Library record `libfile_c1f71b07c484819181b906a75b43db1a`.
- Actify Application Development & Deployment Guide (AADDG) v1.0 — GitHub → Supabase → Vercel Operating Standard, including Level 1 extensions; Library record `libfile_0ac4413eec74819185ffbb384ab85a3a`.
**Comparison date:** 20 November 2026.
**Status:** Source-conformance check of repository documentation and structure; not an implementation or release audit.

## 1. TSBBF v1.0 conformance

| Source requirement | Repository home | Result / remaining state |
|---|---|---|
| Reuse suitable open source first; reversible free/freemium pilots; pay for justified reliability/support; custom build only for real gaps | `docs/delivery/actify-engineering-operating-standards.md`; this crosswalk | Preference order represented; not treated as inflexible rule |
| Eight weighted criteria: functional fit 20%; portability/exit 15%; security/privacy 15%; reliability/maintenance 15%; TCO 15%; licence/commercial 10%; integration/scalability 5%; ease of operation 5% | `docs/decisions/TSBBF-component-assessment-workbook.md`; `docs/architecture/technology-decision-status.md` | All weights represented; workbook remains blank |
| Score bands: 80–100 shortlist; 65–79 investigate; below 65 do not adopt without compelling rationale | Same | Represented; score does not equal approval |
| Critical security, legal, privacy, recovery or continuity risk blocks adoption regardless of score | Same | Represented as mandatory veto |
| Assess prototype, first 12 months and 24–36-month TCO where material; include setup, usage, support, maintenance, migration and exit | Workbook TCO model; technology status | Assessment structure present; no candidate costs or current vendor prices asserted |
| Decision record includes evidence, assumptions, owner, pilot criteria, limitations and reassessment trigger | ADR-0001 and component workbook | Templates exist; candidate scorecards and ADR approval remain open |

## 2. AADDG v1.0 core operating controls

| Source control | Repository home | Result / remaining state |
|---|---|---|
| GitHub is source of truth for application code and technical change history | `README.md`; source register; this repository | Repository exists; application source not yet implemented |
| Backend is source of truth for application data/services; deployment platform builds/serves the application | `docs/architecture/technology-decision-status.md`; operational identity register | Principle represented; no backend or deployment provider selected/provisioned |
| PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY | `docs/delivery/development-workflow.md`; release gates | Workflow represented; CI/build/deployment not yet implemented |
| No secrets or sensitive customer data in source; use secret management | `.env.example`; `docs/security/`; `docs/delivery/environment-and-promotion-model.md` | Variable-name template present; no real secrets recorded |
| Reproducible backend schema/functions; no dashboard-only drift | `supabase/migrations/README.md`; `docs/data/`; `docs/delivery/` | Policy represented; active migrations intentionally empty |
| Preview/test/production environment separation and controlled promotion | `docs/delivery/environment-and-promotion-model.md` | Design represented; no environments provisioned |
| One authoritative repository/application source by default | `Actifyappps/Phygital`; `docs/delivery/` | Repository boundary represented; no split services authorized |

## 3. AADDG Level 1 extension coverage

| AADDG area | Repository home | Conformance state |
|---|---|---|
| Workers and physical/edge bridges as first-class components | `workers/`; `docs/architecture/technology-component-register.md`; integration/physical-digital docs | Logical homes and requirements; no worker/edge runtime implemented |
| Commercial hosting, bandwidth and external integration boundaries | TSBBF workbook; technology component register; `docs/integrations/` | Assessment requirements represented; no provider/plan approved |
| Non-sequential or cryptographically protected QR/NFC/batch identifiers | `docs/product-integrity/`; `docs/security/`; product passport/public projection docs | Requirements represented; no token implementation or device deployed |
| Append-only scan, intake, custody and handover records | `docs/data/`; `docs/product-integrity/`; inventory movement rules | Ledger/event requirements represented; no database implementation |
| Offline queue, idempotent sync, actor/device provenance and conflict handling | `docs/architecture/offline-and-sync-architecture.md`; `docs/security/`; `docs/api/` | Requirements represented; no executable sync implementation |
| Private document/media storage and short-lived scoped delivery | `docs/security/`; evidence/document domain; TSBBF workbook | Requirements represented; no storage provider/bucket provisioned |
| Append-only financial history, signed/idempotent webhooks and server-side fee calculation | `docs/commerce/`; `docs/integrations/`; `docs/data/`; `docs/security/` | Requirements represented; D-07 boundary preserved; no payment activation |
| One authoritative monorepo for web/admin/workers/migrations/tests/docs | Root repository; `web/`, `workers/`, `supabase/`, `tests/`, `docs/` | Structure represented; framework/build manifest absent |
| AI-assisted change integrity, lockfile discipline, synthetic-data isolation and no dashboard-only drift | `docs/delivery/development-workflow.md`; `docs/security/`; `fixtures/`; migration controls | Requirements represented; no package manager/build yet |
| Structured logs, correlation IDs, dead-letter/retry, backup and restore | `docs/delivery/observability.md`; `backup-restore.md`; `workers/`; operations runbooks | Plans/placeholders only; no runtime or restore rehearsal |
| Five operational identity questions | `docs/delivery/application-operational-identity-register.md` | Current answers recorded; backend/deployment/production/worker service not provisioned |
| Level 1 repository layout and release gates | `docs/delivery/release-gates.md`; `docs/quality/024g-test-catalogue-crosswalk.md`; operational identity register | Requirements represented; release gates not passed |

## 4. Repository-state check

At the comparison point the repository has:
- one authoritative GitHub repository;
- `.env.example`, but no `package.json` or executable application build;
- logical `web/` and `workers/` placeholders, but no `src/` tree or executable worker;
- no `.github/workflows/` CI workflow;
- an intentionally empty active `supabase/migrations/` directory;
- Migration 001 candidate SQL isolated under `supabase/candidates/migration-001-hold/`;
- no provisioned backend, deployment project, production URL or physical/edge gateway.

The AADDG standard is therefore represented in governance and repository structure but is not yet satisfied as a running application. That is an accurate phase distinction, not a failed production audit.

## 5. Developer Guide v0.1 source limitation

The Phygital Developer Guide v0.1 dated 17 November 2026 is referenced in the product blueprint and existing project records. It was not located as a canonical Notion page or Library file in this targeted search. Its Next.js/Vercel + Supabase/PostgreSQL/Auth/RLS/private-storage description remains provisional. Do not score it as an independently verified source or resolve the architecture conflict until the exact source artifact is recovered and reconciled.

## 6. Decision and authorization boundary

No TSBBF candidate has been scored, shortlisted or approved. ADR-0001 and ADR-0002 remain OPEN. No stack, ORM, database provider, hosting provider, worker host, identity provider or storage vendor is selected. No environment, backend, CI pipeline, deployment, migration or live integration is authorized by this verification.

Migration 001: **HOLD**. Migration 002: **NOT AUTHORISED**. EVI-21: **OPEN**.