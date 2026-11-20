# Phygital source conflict and correction register

**Purpose:** Record material inconsistencies between programme source documents without silently rewriting source records or allowing a stale statement to override a later governing decision.

| ID | Sources / location | Conflict | Reconciled treatment | Status / action |
|---|---|---|---|---|
| SRC-CONFLICT-001 | 018-A Sponsor Decision Pack; 018-C §1 and §6; 016 §2/§5/§17; 017 document control and §12; 018-B §6; 021–023 | 018-C §1 contains the sentence “No sponsor decision is assumed approved,” but the same page's introduction and §6 refer to the seven 018-A decisions as approved with conditions. The later review confirms 016, 017, 018-B, 021, 022 and 023 also correctly state that D-01–D-07 were approved with conditions on 17 November 2026. | This is an **intra-document contradiction in 018-C**, not an unresolved cross-document sponsor status. 018-A is the sponsor decision authority. D-01–D-07 are **approved with conditions**. The single blanket sentence in 018-C is stale and must not override its own §6 or 018-A. The technical recommendations, conditional ERD and Migration 002 design are not thereby approved for implementation; outstanding conditions, technical choices, evidence and reviews remain open. | Recorded for source reconciliation. Ask the 018-C owner to correct that sentence through a controlled edit. Do not alter Notion automatically or treat the conflict as permission to implement. |
| SRC-CONFLICT-002 | 015 §1; 016 §3; 018-B §1 | 015 reports 20 Migration 001 tables. 016 expressly corrects this to 22; 018-B inventories 22 tables and 230 declared columns. | Use 22 tables / 230 declared columns as the reconciled source inventory. The 015 count is a superseded counting error, not evidence of a different schema. | Reconciled in the repository migration source-provenance and design-boundary records. |

## Authority and correction rules

- A sponsor decision, technical design recommendation and implementation authorisation are different things.
- An approved-with-conditions sponsor direction is binding as a direction within its stated scope, but does not close its conditions or approve an unreviewed technical design.
- Preserve original source documents and record corrections here until the canonical source owner updates them.
- Where source wording is ambiguous, apply the governing hierarchy and record the ambiguity; do not silently choose the interpretation that enables implementation.
- This register records source consistency only. It does not grant legal authority, close evidence items, approve migrations or authorise live trade.

## Sources

- [018-A Sponsor Decision Pack D-01–D-07](https://app.notion.com/p/4136808bcd9e814981ffecf66f2d86ef)
- [015 Technical Readiness & Migration 001 Remediation](https://app.notion.com/p/4136808bcd9e81cd98aae29ae9fc79b1)
- [016 Migration 002 Design Decision Record](https://app.notion.com/p/4136808bcd9e814eb2b5ecaf5fb76a5f)
- [017 Migration 002 Detailed Technical Design](https://app.notion.com/p/4136808bcd9e81daa630ee2ab4937df6)
- [018-B Migration 001 Column Dictionary](https://app.notion.com/p/4136808bcd9e81c0bb95d27a8a034bd3)
- [018-C Conditional Target ERD](https://app.notion.com/p/4136808bcd9e8196ae03ef401018f5d1)
