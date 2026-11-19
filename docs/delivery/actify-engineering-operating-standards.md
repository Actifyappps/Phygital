# Actify engineering operating standards applied to Phygital

**Sources:** Actify Inc. AADDG v1.0 (GitHub → Supabase → Vercel Operating Standard, including Level 1 extensions) and TSBBF v1.0 (ratified 31 October 2026). This file records their application to this project; it does not reproduce the full company standards.

## AADDG — lifecycle and source-of-truth discipline
- GitHub is the source of truth for application code, technical documentation, appropriate configuration and change history.
- Supabase or the selected backend is the source of truth for application data/backend services.
- Vercel or the selected deployment platform is the build-and-serving environment.
- Preferred lifecycle: define → establish repository → backend → deployment → test → release; each meaningful change follows PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY.
- Do not mistake code written for code committed, deployment success for feature correctness, or a demo for production readiness.
- Never commit passwords, service-role secrets, database credentials, recovery codes or sensitive customer data.
- Level 1 extensions recognise background workers and physical bridges (QR/NFC/edge devices) as governed components; they require integrity, security, observability and lifecycle controls.
- Offline-first, bandwidth, webhook, payment and physical-digital boundaries require explicit design and tests.
- For Phygital, Supabase and Vercel remain candidates/defaults within AADDG, not a final project stack selection until the TSBBF decision and open ADRs are completed. The Technical Development Manual v3.0 and Developer Guide contain differing candidate architecture descriptions; do not silently choose one.

## TSBBF — technology selection and build-vs-buy
Default preference: reuse suitable open-source software; pilot free/freemium tools where appropriate; pay where reliability/support/security justify it; build custom code only for a real differentiating gap. This is a preference order, not an inflexible rule.

Every material decision evaluates:
- functional and non-functional fitness;
- security, privacy, legal and commercial suitability;
- data portability, export, backup, migration and exit;
- free-tier quotas, upgrade consequences and total cost of ownership;
- maintainer activity, support, skills and maintenance burden;
- reliability, integration fit, licensing and vendor dependency;
- reversible pilot path, evidence still required and named decision owner.

Critical security, legal, privacy or recovery risks block approval regardless of weighted score. Record decision, assumptions, evidence, limitations, owner and reassessment trigger in an ADR.

## Project-specific consequence
The existing folder structure is intentionally technology-neutral. GitHub is the code-history home. No Supabase project, Vercel project, production environment, database migration, worker or physical device integration is declared provisioned by this repository.
