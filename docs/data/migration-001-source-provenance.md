# Migration 001 source provenance

The original Migration 001 SQL and companion files are preserved under `supabase/candidates/migration-001-hold/`, not the active migration path.

| Artifact | Original Library filename | Original size | Source SHA-256 / provenance |
|---|---|---:|---|
| Candidate SQL | `phygital_export_marketplace_migration_001.sql` | 20,087 bytes | `24d8f3458106e8a005cd05a7ecf9f057b4aee955b325358392b501de54c74ccd` |
| Candidate SQL tests | `phygital_export_marketplace_migration_001_tests.sql` | 5,538 bytes | `4b4c7c6b4c2be00ec5151f9466bb0365c39d8e9a53d91c009edab10bc432dad6` |
| Acceptance checklist | `Phygital_Export_Marketplace_Database_Acceptance_Checklist.md` | 5,565 bytes | `2d76e40de7c86c018732d29796624839b5a2bcfb819ba90efd82ca48c8de725f` |

The migration review records that static inspection was completed but live PostgreSQL execution was not. The candidate is therefore not proven to apply, rollback, preserve constraints under concurrency or satisfy the product's authority model.

**Disposition:** Migration 001 HOLD. Migration 002 not authorised. This repository copy preserves provenance and enables controlled review; it does not change either status.


## Table-count reconciliation

Deliverable 015's static review text reports 20 tables. Deliverable 016 corrects that count to **22 CREATE TABLE definitions**, and Deliverable 018-B provides a source-derived column inventory of all 22 tables and 230 declared columns. The reconciled source count for repository planning is 22. This correction does not imply PostgreSQL execution or runtime catalogue verification; Migration 001 remains HOLD.


## 015–018-B source inventory and technical-design crosswalk

The 015–018-B review set is represented in `docs/data/015-018b-technical-design-reconciliation.md`. It distinguishes static inspection, source-derived inventory, conditional logical design, technical recommendations, implementation authority and execution evidence. The table-count correction is reconciled to 22 source tables and 230 declared columns; this is not a PostgreSQL runtime catalogue result.
