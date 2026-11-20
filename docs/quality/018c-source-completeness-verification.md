# 018-C source completeness and cross-document verification

**Source:** Notion 018-C — Migration 001 Source-to-Target Mapping & Conditional Target ERD.
**Comparison date:** 20 November 2026.
**Source status:** Candidate design for review; not approved for implementation.

## 1. Source inventory counts

| Source section | Count verified from Notion | Repository home |
|---|---:|---|
| §3 Migration 001 source-table dispositions | 22 | `docs/data/018c-source-to-target-conditional-erd.md` §3 |
| §4 candidate target entities/explicit relations | 11 | Same, §4 |
| §6 sponsor decision branches | 7 (D-01–D-07) | Same, §6 |
| §7 numbered migration/backfill rules | 10 | Same, §7 |
| §7 backfill classifications | 0 | Same, §7.1 |
| §8 design gates | 0 (G1–G8) | Same, §8 |
| §9 acceptance criteria | 9 | Same, §9 |

## 2. Source-to-repository content checks

- The complete §3 source mapping table is copied as a table, including all 22 source-table rows, target disposition, principal target change and decision dependency.
- The complete §4 candidate target-entity table is copied, including the optional nature of inventory balance snapshots and unresolved generic-versus-specialised authority modelling.
- All five logical relationship domains in §5 are preserved.
- All seven sponsor-decision branches are preserved. They are conditional target-model treatment, not fresh sponsor decisions.
- All ten migration/backfill safeguards and four record classifications are preserved.
- All eight G1–G8 gates and the nine acceptance criteria are retained.

## 3. Cross-document alignment

- 018-B remains the source of exact Migration 001 column definitions and source inventory; 018-C does not replace it.
- 017 remains the detailed conditional technical design; 018-C does not replace its work packages, proposed constraints or service behaviour.
- 018-A supplies D-01–D-07 sponsor direction approved with conditions. The conditions and evidence dependencies remain open.
- 024-C supplies the broader logical information model, including 65 entities, 34 relationships and 36 invariants. 018-C is a migration-focused source-to-target model and must not be treated as a second competing canonical domain model.

## 4. Important unresolved design points

- Generic versus specialised authority-mandate implementation remains open.
- Optional balance snapshots are projections, never the inventory source of truth.
- Exact shipment-line/fulfilment entity naming and final physical constraints remain open.
- Unit definitions, commodity unit rules and conversion governance require detailed technical review.
- The target physical ERD/data dictionary, indexes, constraints, SQL and RLS implementation are not approved by this representation.

## 5. Status boundary

This verification establishes source-content representation only. It does not establish independent design review, sponsor-condition closure, physical schema approval, SQL generation, PostgreSQL execution, migration/backfill success, concurrency/security/recovery testing or technical acceptance.

Migration 001: **HOLD**. CV-12: **UNVERIFIED**. Migration 002: **NOT AUTHORISED**. EVI-21: **OPEN**.