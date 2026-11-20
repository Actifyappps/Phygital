# Actify technology standards — source verification record

**Review date:** 20 November 2026  
**Purpose:** Record source recovery and version verification for the standards governing Phygital technology decisions.  
**Status:** Source verification record; it does not amend either standard or approve a Phygital technology choice.

## 1. TSBBF v1.0 — recovered and verified

**Source title:** Actify Inc. — Technology Selection & Build-vs-Buy Framework (TSBBF)  
**Version/date:** Version 1.0; ratified 31 October 2026.  
**Source location:** Actify internal Library working reference; complete 258-line text inspected on 20 November 2026. The Library display filename is generic ("Pasted text.txt"); the document title and version are taken from the content, not the filename.

### Verified governing principle

“Reuse before buying. Pilot before committing. Buy reliability where it matters. Build only what differentiates us.”

The default order is:
1. Reuse suitable, mature and actively maintained open-source software.
2. Use free/freemium tools for reversible pilots, documenting limits and exit.
3. Pay where reliability, support, security, compliance or operational savings justify it.
4. Build custom code only for a genuine requirement gap or differentiating capability.

This is a default preference, not an inflexible rule.

### Verified mandatory assessment domains

- Data portability and exit, including files, metadata, relationships, user records, configuration and history.
- Free-tier limits, overage behaviour, upgrade costs and what happens at quota.
- Maintenance, support, security updates and successor path.
- Data location, access, encryption, backup, retention, deletion and privacy/legal suitability.
- Licence and commercial suitability for the actual version and intended use.
- TCO for prototype, first 12 months and where appropriate 24–36 months, including setup, migration, skills, maintenance, support, security, growth and exit.
- Component-level sourcing decisions; one product may combine open-source, managed services, paid specialist services and custom code.

### Verified scorecard

| Criterion | Weight |
|---|---:|
| Functional fit | 20% |
| Data portability and exit | 15% |
| Security and privacy | 15% |
| Reliability and maintenance | 15% |
| Total cost of ownership | 15% |
| Licence and commercial fit | 10% |
| Integration and scalability | 5% |
| Ease of operation | 5% |
| **Total** | **100%** |

Score 1–5; weighted score is sum(score × weight) ÷ 5. 80–100 is a shortlist for practical testing and cost verification; 65–79 requires investigation or improved terms; below 65 should not be adopted without a documented compelling reason. A score is not approval. Unresolved critical security, legal, privacy, recovery or continuity risks block adoption regardless of score.

**Disposition:** WP-00 TSBBF source/version verification is CLOSED. Existing repository workbook weights and thresholds are consistent with the recovered source.

## 2. AADDG v1.0 — recovered and verified

**Source title:** AADDG v1.0 — GitHub → Supabase → Vercel Operating Standard.  
**Source location:** Actify internal Library working reference; complete 408-line text inspected on 20 November 2026. The Library display filename is generic ("Pasted text(1).txt"); the document title/version are taken from the content. The body identifies v1.0 but does not expose a ratification date; none is inferred here.

### Verified core operating model

- GitHub is the source of truth for application code and appropriate configuration/documentation.
- Supabase or the selected backend is the source of truth for application data and backend services.
- Vercel or the selected deployment platform is the build-and-serving environment.
- Preferred working cycle: PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY.
- Backend schema, migrations, functions and row-level security policies must be reproducible from version-controlled source; no dashboard-only drift.
- Secrets and privileged service credentials must not enter source control or client bundles.
- Development, preview/test and production environments must be clearly separated.
- The repository must be sufficient to reproduce and maintain the application; deployment success is not feature acceptance.

### Verified Level 1 extensions relevant to Phygital

- Background workers and physical bridges (QR/NFC/edge) are first-class governed components where used.
- Assess commercial-use terms and bandwidth economics; the standard explicitly names Vercel and Cloudflare Pages as frontend-host examples to compare against actual workload.
- If a frontend host and worker host are both required, both must be governed by the same authoritative GitHub repository; Render/queues are illustrative worker examples, not mandated providers.
- Private trade/evidence documents must use private storage and short-lived scoped access, not public bucket links.
- Webhooks require cryptographic verification, provider-scoped event identity, idempotency and audit.
- Physical identifiers must be non-sequential/unguessable or cryptographically protected; physical event histories must be append-only/corrected by linked events.
- Offline/low-bandwidth capture must synchronize idempotently and preserve actor, source and timing.
- Structured logs, correlation IDs, dead-letter handling, safe retries, backup verification, restore rehearsal and rollback are governed release concerns.
- Multiple runtime components should remain in one authoritative repository unless a documented architecture decision justifies otherwise.

**Important interpretation:** Supabase and Vercel are the standard's named default model, but AADDG itself says “or the selected backend/deployment platform.” Phygital's project-specific stack remains subject to TSBBF, source reconciliation and ADR approval. AADDG does not force a Supabase/Vercel selection.

**Disposition:** WP-00 AADDG source/version verification is CLOSED. Project-specific application of the standard remains in force; no infrastructure is thereby provisioned or approved.

## 3. Developer Guide v0.1 — source recovery remains OPEN

The Developer Guide v0.1 dated 17 November 2026 remains unrecovered as a complete canonical source.

Checks performed for this work package:
- Targeted Notion searches for the named Developer Guide, version/date and candidate stack wording returned Project Home and related project documents, but no canonical Developer Guide page.
- Targeted Library content searches for the named guide and its distinctive Next.js/Supabase/Vercel wording did not surface a matching Developer Guide file. The search did surface the Technical Development Manual v3.0, AADDG v1.0 and other Phygital artefacts; these are not substitutes for the missing guide.
- A previously supplied conversational excerpt is not treated as a complete, version-controlled canonical source.

This is a documented recovery gap, not proof that the guide never existed. Candidate A (Next.js + Supabase/PostgreSQL/Auth/Storage + Vercel) remains provisional and must not be scored until the guide is recovered or the authorised decision owner formally dispositions the missing source.

## 4. Consequences for Phygital

1. TSBBF and AADDG source/version verification can be marked complete in WP-00.
2. The TSBBF workbook and component evidence packs remain assessment instruments; no candidate scores are created by this verification.
3. Candidate A remains unscorable pending Developer Guide recovery/disposition.
4. Candidate B (modular API application) and candidate C (component-level hybrid) remain hypotheses, not approved alternatives.
5. AADDG examples such as Vercel, Cloudflare Pages, Render/queues are candidate classes to verify against current terms and actual workload, not recommendations or procurement directions.
6. WP-01–WP-06 remain subject to their own evidence and approval gates.
7. No production backend, hosting, CI pipeline, migration, worker, live integration or real-data environment is authorized by this record.
