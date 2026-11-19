# Sponsor decisions D-01–D-07 — approved with conditions

**Source:** 018-A Sponsor Decision Pack — Commercial Role, Custody & Data Relationships.  
**Decision date:** 17 November 2026.  
**Status:** APPROVED WITH CONDITIONS. The decisions constrain design; they do not close external evidence, authorize live trade or appoint named parties.

| Decision | Approved direction | Implementation and evidence conditions |
|---|---|---|
| D-01 Marketplace operator role | Platform operator acts as coordinator/service provider; not default seller, payee or funds custodian | Contracts, disclosures, payer/payee roles, service ownership and fee model must be validated; no platform-held sale proceeds |
| D-02 Seller and exporter of record | Seller and exporter are distinct legal/transaction capacities; a producer/cooperative may hold either only if independently qualified and authorised | Separate authority records and checks; no automatic fallback; named cooperative/exporter and fallback decision remain open |
| D-03 Hub custody and control | Hub is service-only in the baseline | No assumed custody, title, stock held, release, dispatch or export authority; any later custody model requires a new approved legal/operational design |
| D-04 Listing-to-batch cardinality | Compatible multi-batch backing may be supported with traceability and no double-counting | Pilot starts with one batch; compatibility, allocation and split/merge traceability must be tested before multi-batch use |
| D-05 Order-to-quotation cardinality | One accepted quotation per pilot order | Each order item links to an accepted quote line and immutable commercial terms snapshot; later changes use controlled amendments |
| D-06 Inventory authority and reservation meaning | Allocation is a reservation only | Reservation does not prove physical movement, custody, stock release or dispatch; physical movement requires separate authorised evidence |
| D-07 Payment and funds flow | Direct buyer-to-seller payment through an appropriately authorised provider/bank | Platform records instructions, references, source-backed status and reconciliation only; no wallet, pooled funds, escrow, platform-held funds or default payout capability |

## Conditions that remain open
- D-02: named seller/exporter entity, evidence of qualification/authority and sponsor-approved fallback if the preferred entity cannot lawfully perform the role.
- D-03: any physical service beyond digital coordination requires site permission, scope, operator mandate, liability, insurance, safety and regulatory validation.
- D-04: multi-batch listing requires product/specification/unit compatibility, lineage and concurrent quantity controls; initial pilot remains one batch.
- D-05: exact quote-line and commercial snapshot model must be implemented and tested.
- D-06: authoritative inventory ledger and physical-movement evidence model remain design/test requirements.
- D-07: provider, payment terms, legal scope, reconciliation and exception handling remain unverified; no integration is selected.

## Engineering consequence
These decisions are invariant constraints across domain packages, API contracts, UI, database design, provider adapters, test cases and operations. Any proposed change must identify the affected decision, obtain the authorised review, and preserve the superseded decision history. A code change cannot amend a sponsor decision.
