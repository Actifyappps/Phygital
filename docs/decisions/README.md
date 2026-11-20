# ADR register

- ADR-0001 Technology baseline — OPEN. Assessment preparation: TSBBF component assessment workbook, technology decision requirements baseline and workload/TCO assumptions register.
- ADR-0002 Application topology — OPEN. Candidate spike plan: synthetic-data technology spike and acceptance plan; closure sequence: ADR evidence-closure work-package register.
- ADR-0003 Identity and authorisation — OPEN.
- ADR-0004 Data and file storage — OPEN.
- ADR-0005 Integrations and event delivery — OPEN.
- ADR-0006 Offline and synchronisation — OPEN.
- ADR-0007 Public projections and QR — OPEN.
- ADR-0008 Physical-digital event integrity — OPEN.

Supporting records:
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
