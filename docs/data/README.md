# Data workspace

Canonical logical model: 024-C. Canonical workflow invariants: 024-B. This workspace records implementation-facing integrity, provenance, classification and migration-readiness controls. It does not authorise Migration 001 or Migration 002.

- [018-C source-to-target mapping and conditional target ERD](018c-source-to-target-conditional-erd.md) — all 22 source-table dispositions, target entities, logical relationship rules, D-01–D-07 branches, migration/backfill safeguards and G1–G8 gates. Candidate design only; no migration authorization.

- [018-C source completeness verification](../quality/018c-source-completeness-verification.md) — source-section count check and alignment against 018-A/B, 017 and 024-C.

- [024-B / 024-C workflow-to-logical-model integrity review](../quality/024b-024c-cross-spec-integrity-review.md) — connects all 18 workflows to the 65 logical entities, 34 relationships, 36 invariants, unresolved decisions and verification gates; design-only.

- [EVI-29 recovery, retention and restore readiness](../operations/evi-29-recovery-retention-restore-readiness-assessment-001.md) — maps data classes, retention and recovery evidence without inventing periods or RTO/RPO values.
