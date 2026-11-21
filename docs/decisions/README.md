# ADR register

- ADR-0001 Technology baseline — **OPEN**. EVI-28 readiness assessment: no candidate READY FOR SCORING, no numeric score, shortlist or baseline selection. Final approval depends on the authorized ADR-0002 topology decision and complete TSBBF evidence.
- ADR-0002 Application topology — **OPEN**. EVI-27 readiness assessment: Option B is a conditional logical candidate only; no topology or deployment architecture selected. WP-05 spike is separately gated by EVI-26 and is NOT AUTHORIZED.
- ADR-0003 Identity and authorisation — OPEN.
- ADR-0004 Data and file storage — OPEN.
- ADR-0005 Integrations and event delivery — OPEN.
- ADR-0006 Offline and synchronisation — OPEN.
- ADR-0007 Public projections and QR — OPEN.
- ADR-0008 Physical-digital event integrity — OPEN.

Supporting records:
- P1 business-capability evidence pack (TC-14, TC-15, TC-16, TC-18, TC-20); no live provider or partner selected.
- P1 platform-quality evidence pack (TC-08, TC-11, TC-22, TC-23); initial public-source evidence only, no selection or score.
- ADR-0001 and ADR-0002 remain OPEN. EVI-27 and EVI-28 are IN PROGRESS readiness assessments, not decisions; Option B remains conditional only.
- WP-03 candidate evidence register: consolidated component candidates, evidence states and blockers; no candidate scored or shortlisted.
- TC-12/TC-13/TC-24 recovery, offline and portability evidence snapshot (20 November 2026); no recovery or offline pattern selected.
- TC-09/TC-10 hosting, deployment and CI candidate evidence snapshot (20 November 2026); no candidates scored or shortlisted.
- TC-01/TC-02/TC-07 frontend, runtime and worker candidate evidence snapshot (20 November 2026); no candidates scored or shortlisted.
- TC-06 private object storage candidate evidence snapshot (20 November 2026): Supabase Storage, Cloudflare R2 and Amazon S3; not scored or shortlisted.
- TC-05 authorization candidate evidence snapshot (20 November 2026): application policy + PostgreSQL RLS, OpenFGA and OPA; not scored or shortlisted.
- TC-04 identity candidate evidence snapshot (20 November 2026): Supabase Auth, Clerk, Auth0 and Keycloak; not scored or shortlisted.
- TC-03 database candidate evidence snapshot (20 November 2026): Supabase, Neon and Render public-source comparison; not scored or shortlisted.
- Actify standards source verification: TSBBF v1.0 and AADDG v1.0 recovered/verified; Developer Guide v0.1 remains a source-recovery gap. See actify-technology-standards-source-verification.md.
- Component inventory: technology component register.
- Technology requirements: technology-decision-requirements-baseline.md.
- Workload, operating and TCO assumptions: technology-workload-and-tco-assumptions-register.md (values remain UNKNOWN until evidenced).
- TSBBF component assessment workbook: blank; no candidate scored.
- WP-03 component evidence pack 01: TC-03 database, TC-04 identity, TC-05 authorisation and TC-06 private object storage; evidence requirements only, no candidate scored.
- WP-03 component evidence pack 02: TC-01 frontend, TC-02 application runtime and TC-07 workers; evidence requirements only, no candidate scored.
- WP-03 component evidence pack 03: TC-09 hosting/deployment, TC-10 CI/build, TC-12 backup/restore, TC-13 offline/sync and TC-24 portability/exit; evidence requirements only, no candidate scored.
- ADR-0001/0002 closure and synthetic vertical-slice readiness: decision-readiness assessment.
- Evidence sequencing and decision gates: adr-evidence-closure-work-package-register.md.

All supporting records are preparation aids. They do not select a stack, authorise a spike, provision an environment, execute a migration or permit live operations.


## EVI-25–EVI-29 current decision evidence — 21 November 2026

- [EVI-25 source recovery and authority assessment](../delivery/evi-25-developer-guide-source-recovery-assessment-001.md) — IN PROGRESS; canonical Developer Guide v0.1 not recovered.
- [EVI-26 WP-05 spike authorization readiness](../delivery/evi-26-wp05-synthetic-spike-authorization-readiness-001.md) — IN PROGRESS; NOT READY — NOT AUTHORIZED; no spike run.
- [EVI-27 ADR-0002 topology readiness](../architecture/evi-27-topology-decision-readiness-assessment-001.md) — IN PROGRESS; Option B conditional only.
- [EVI-28 ADR-0001 technology baseline readiness](evi-28-adr-0001-technology-baseline-readiness-assessment-001.md) — IN PROGRESS; no candidate ready for scoring.
- [EVI-29 recovery/retention/restore readiness](../operations/evi-29-recovery-retention-restore-readiness-assessment-001.md) — IN PROGRESS; no backup capability or approved RTO/RPO claimed.

**Sequence and controls:** ADR-0002 must be decided before final ADR-0001 approval. EVI-26 does not authorize execution merely because the readiness brief exists. EVI-29 requires approved objectives and a witnessed restore test. No provider, technology, procurement or production deployment is selected or authorized.
