# 024-R independent audit — repository coverage matrix

**Source:** 024-R Independent Digital Product Completeness & Consistency Audit, 19 November 2026.  
**Purpose:** Track where audit findings land in the repository. This is a coverage map, not closure of the Notion audit or approval of implementation.

| Finding | Repository home | Coverage state |
|---|---|---|
| F-01 Evidence class/provenance | docs/data/evidence-and-provenance-model.md; dictionaries and tests | Source correction recorded in 024 v0.1d; downstream conformance still required |
| F-02 Seller/exporter separate capacities | packages/domain/authority/; docs/security/; authority tests | Source correction recorded in 024-A v0.1b; actual qualification and executable policy remain open |
| F-03 Pilot level vs software stage | docs/product/maturity-axes-and-gates.md; release gates | Dedicated clarification added; downstream gate verification remains open |
| F-04 Withdrawal/recall/trace | docs/product-integrity/; domain, data, API, UI and tests | Dedicated capability added; real operations remain gated |
| F-05 Commercial services/fees/net proceeds | docs/commerce/; commercial domain and data | Dedicated design home; commercial model and 025 identity/status unresolved |
| F-06 Marketplace trust/abuse | docs/marketplace-trust/; security, UI and tests | Dedicated capability added; operating workflow and tests remain open |
| F-07 Offline/device threats | docs/architecture/offline-and-sync-architecture.md; security/tests | Design home retained; device controls and real-data gate remain open |
| F-08 Rule catalogue lifecycle | docs/compliance/; compliance-rules domain | Dedicated design home; source ownership and lifecycle validation remain open |
| F-09 Versioned commercial terms | docs/data/terms-and-fee-snapshots.md; commerce/domain/tests | Dedicated data-integrity home; legal acceptance method remains open |
| F-10 Machine-testable permissions | packages/domain/authority/; security/tests | Capacity-specific controls represented; complete tuples and enforcement remain open |
| F-11 Product operations ownership | docs/operations/service-ownership-and-support-model.md | Dedicated operations home; named owners/service levels remain open |
| F-12 Producer/buyer outcome metrics | docs/measurement/ | Dedicated measurement home; baselines and thresholds remain open |

## Audit corrections versus programme closure

The repository has explicit design homes for all 12 findings. The 19 November 2026 correction record confirms that 024 v0.1d corrected F-01 at specification level and 024-A v0.1b added separate seller/exporter capacity controls for F-02. These are source-specification corrections, not sponsor/legal approval, implementation, executed tests or audit closure.

See:
- 024r-correction-implementation-record.md for source-backed correction history and subsequent 024-B/024-C status.
- 024r-finding-to-requirement-repository-test-reconciliation.md for the full F-01–F-12 evidence chain, verification obligations and remaining gates.
- adr-0001-0002-and-synthetic-slice-readiness.md for technology/topology decision prerequisites and the entry/exit gates for a synthetic-data vertical slice.

## Current closure boundary

“Allocated” means a design home exists, not that a specification is complete. “Test designed” does not mean executed. No finding is marked implemented, verified or accepted by this matrix. Preserve Migration 001 HOLD, Migration 002 NOT AUTHORISED and EVI-21 OPEN / Closure Accepted NO.
