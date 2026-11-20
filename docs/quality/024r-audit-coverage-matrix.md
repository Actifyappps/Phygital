# 024-R independent audit — repository coverage matrix

**Source:** 024-R Independent Digital Product Completeness & Consistency Audit, 19 November 2026.  
**Purpose:** Track where audit findings land in the repository. This is a coverage map, not closure of the Notion audit or approval of implementation.

| Finding | Repository home | Coverage state |
|---|---|---|
| F-01 Evidence class/provenance | `docs/data/evidence-and-provenance-model.md`; dictionaries and tests | Design home established; canonical vocabulary must remain aligned with 008 and Evidence Register protocol |
| F-02 Seller/exporter separate capacities | `packages/domain/authority/`; `docs/security/`; authority tests | Existing domain home strengthened; mandate and capacity must be separate |
| F-03 Pilot level vs software stage | `docs/product/maturity-axes-and-gates.md`; release gates | Dedicated clarification added |
| F-04 Withdrawal/recall/trace | `docs/product-integrity/`; domain, data, API, UI and tests | Dedicated capability added; real operations still gated |
| F-05 Commercial services/fees/net proceeds | `docs/commerce/`; commercial domain and data | Dedicated design home added; model and identifier 025 remain unresolved |
| F-06 Marketplace trust/abuse | `docs/marketplace-trust/`; security, UI and tests | Dedicated capability added |
| F-07 Offline/device threats | `docs/architecture/offline-and-sync-architecture.md`; security/tests | Existing home retained and cross-linked |
| F-08 Rule catalogue lifecycle | `docs/compliance/`; compliance-rules domain | Dedicated design home added |
| F-09 Versioned commercial terms | `docs/data/terms-and-fee-snapshots.md`; commerce/domain/tests | Dedicated data-integrity home added |
| F-10 Machine-testable permissions | `packages/domain/authority/`; security/tests | Existing home strengthened; executable tuples await approved model |
| F-11 Product operations ownership | `docs/operations/service-ownership-and-support-model.md` | Dedicated operations home added |
| F-12 Producer/buyer outcome metrics | `docs/measurement/` | Dedicated measurement home added |

## Audit corrections versus programme closure
The repository provides explicit homes for all 12 findings. Notion's 19 November 2026 correction record subsequently confirms that 024 v0.1d corrected F-01 at specification level and 024-A v0.1b added separate seller/exporter capacity controls for F-02. These are source-specification corrections, not sponsor/legal approval, implementation, executed tests or audit closure. F-03–F-12 remain allocated to downstream 024-B–H design and verification. See `docs/quality/024r-correction-implementation-record.md` for the source-backed disposition. Preserve EVI-21 and migration holds.
