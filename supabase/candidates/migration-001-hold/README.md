# Migration 001 — candidate source, HOLD

**Disposition:** PRESERVED FOR REVIEW ONLY. NOT AN ACTIVE MIGRATION. DO NOT EXECUTE AGAINST ANY SHARED, STAGING OR PRODUCTION DATABASE.  
**Governing review:** Deliverables 002, 014, 015, 016, 017, 018-B and 018-C.  
**Source migration SHA-256:** `24d8f3458106e8a005cd05a7ecf9f057b4aee955b325358392b501de54c74ccd`.  
**Source test SHA-256:** `4b4c7c6b4c2be00ec5151f9466bb0365c39d8e9a53d91c009edab10bc432dad6` (verify against the source record before any later reuse).

## Why this is outside the active migrations directory
Migration 001 is a reviewed candidate, not an accepted technical baseline. Static reviews identified critical cross-record integrity gaps, incomplete authorisation and audit protections, unproven concurrency behaviour, incomplete event provenance/idempotency, and operational/migration controls requiring remediation. PostgreSQL execution was not performed in the cited reviews.

## Contents
- `migration_001_candidate.sql`: source SQL retained unchanged in intent for traceability.
- `migration_001_tests_candidate.sql`: supplied smoke/constraint test script; inspected, not executed.
- `database_acceptance_checklist.md`: required disposable-database test plan.

## Rules
1. Never move this file into `supabase/migrations/` or execute it as a live migration without a new approved decision.
2. Do not silently edit this candidate in place. Any successor must have a new version, source-to-target change log and traceability to DB-01–DB-12 and the Phase 0 evidence register.
3. Migration 002 is not authorised. 018-C is a candidate mapping/ERD, not schema approval.
4. Tests must run only on a disposable isolated PostgreSQL instance with retained version, checksum, command, output and reviewer evidence.
5. Do not use real participant or commercial data before privacy, security and authorisation controls are approved and tested.
