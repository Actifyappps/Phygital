# 024-R correction implementation record — Notion-to-repository reconciliation

**Source authority:** 024-R Independent Digital Product Completeness & Consistency Audit and its 19 November 2026 Correction Implementation Record; corrected 024 v0.1d; 024-A v0.1b.
**Snapshot:** 20 November 2026.
**Status:** Source-specification corrections recorded in Notion and represented here. Sponsor/legal review, detailed downstream design, implementation, test execution and audit acceptance remain open.

## 1. Why this record exists

The original 024-R audit identified critical and important product-definition defects. Its later correction record confirms that the user approved the correction sequence and that two P0 specification corrections were made in Notion on 19 November 2026.

The repository's earlier coverage matrix stated that the underlying Notion specifications had not been amended. That statement is now stale. This record preserves the updated status without treating a specification correction as implementation or evidence closure.

## 2. Verified source correction record

| Source | Confirmed change in Notion | What this resolves | What it does not resolve |
|---|---|---|---|
| 024 v0.1d | E1–E4 evidence-class definitions corrected to align with Framework 008 §4.1; evidence class distinguished from Evidence Register acquisition-method/type classification; 024-A status reference updated; audit requirements allocated across 024-A–H | F-01 source-taxonomy conflict corrected at product-specification level; requirements assigned to existing specification sequence | Sponsor/legal review, implementation, downstream schema/API/UI/security/test verification and evidence closure |
| 024-A v0.1b | Separate seller/exporter capacity controls and permission matrix; separate authority records; ten synthetic positive/negative permission tests; version/disposition clarified | F-02 capacity distinction now explicit in the access-control specification | Qualification of any actual entity; approved production access policy; machine-testable permission tuples; executed tests or sponsor/legal approval |
| Project Home | Updated to identify corrected specifications and next controlled design step | Project navigation/status reflects the correction sequence | Does not approve later specifications or authorize implementation |

The correction record in 024-R states that 024-B should be prepared with stable requirement IDs, source traceability, state transitions, authority/permission checks, exception paths and independent gate logic. It explicitly says not to begin technical implementation or execute migrations as part of that design step.

## 3. Finding-by-finding disposition

| Finding | Corrected source status | Repository representation | Remaining work / gate |
|---|---|---|---|
| F-01 Evidence class versus provenance | Corrected in 024 v0.1d against Framework 008 and Evidence Register protocol | `docs/data/evidence-and-provenance-model.md`; this record; quality crosswalk | Keep vocabulary aligned in all downstream 024-B–G artefacts; verify schema/API/UI/test treatment |
| F-02 Seller versus exporter capacity | Separate controls added in 024-A v0.1b | `packages/domain/authority/`; security docs/tests; this record | Sponsor/legal review; permission tuples; 024-B/C/D/E/F/G propagation; no assumed qualified party |
| F-03 Pilot maturity versus software delivery stages | Allocated for 024-B–H | `docs/product/maturity-axes-and-gates.md`; release gates | Preserve independent axes in workflow and release gates |
| F-04 Withdrawal, recall and trace-forward/back | Allocated for 024-B–H | `docs/product-integrity/` and cross-domain homes | Detailed transitions, lineage, notification, tests and competent-authority boundaries |
| F-05 Fees, service catalogue and producer net proceeds | Design home required; 025 not located in current targeted workspace search | `docs/commerce/` | Confirm whether 025 is planned/stored elsewhere/re-numbered; sponsor, legal and tax review before fee-engine implementation |
| F-06 Marketplace trust and abuse | Allocated for 024-B–H | `docs/marketplace-trust/` and security/quality homes | Detailed reporting, moderation, appeals, listing integrity and tests |
| F-07 Offline/device threats | Allocated for 024-D/E/F/G | `docs/architecture/offline-and-sync-architecture.md` and security/tests | Device binding, local data protection, expiry/revocation, conflict and loss/recovery tests |
| F-08 Commodity/destination rule lifecycle | Allocated for 024-B/C/D/E/G/H | `docs/compliance/` | Versioned ownership, approval, effective dates, supersession and evidence |
| F-09 Binding commercial terms snapshot | Allocated for 024-B/C/D/G | `docs/data/terms-and-fee-snapshots.md` | Exact accepted version, authority, amendment and legal acceptance method |
| F-10 Machine-testable permissions | 024-A v0.1b adds capacity-specific controls and ten synthetic tests; broader tuple model remains open | `packages/domain/authority/`, security/tests | Complete tuples, explicit deny rules, tenant/RLS and API enforcement tests |
| F-11 Commercial/operational ownership | Allocated for 024-H | `docs/operations/service-ownership-and-support-model.md` | Named accountable owners, service support and escalation model |
| F-12 Producer/buyer outcome measures | Allocated for 024-G/H and measurement design | `docs/measurement/` | Baselines, metric owners, producer cost/net proceeds and buyer outcomes; numeric targets not invented |

**Important:** “Allocated” means a specification workstream has a design home. It does not mean the relevant detailed specification is complete or approved.

## 4. 024-R correction sequence and current programme position

1. **P0 evidence semantics:** source correction recorded in 024 v0.1d.
2. **P0 seller/exporter distinction:** source correction recorded in 024-A v0.1b.
3. **Project navigation:** Project Home updated.
4. **025 commercial design home:** still unresolved; 024-R's later targeted search did not locate a dedicated 025 page. This is a search result, not proof that no draft exists elsewhere.
5. **F-03–F-12:** allocated across 024-B–H; detailed design and verification remain open.
6. **024-B:** next controlled specification action identified by 024-R; prepare with stable requirement IDs, source traceability, state transitions, authority checks, exceptions and independent gates. This is specification work, not permission to code or run migrations.

No new 024-I is justified by 024-R; its conclusion is to use the existing 024-A–H sequence and keep the commercial design reference separately controlled if 025 is confirmed.

## 5. Controls that remain unchanged

- 018-A D-01–D-07 remain approved with conditions.
- D-01: platform coordinator only; not default seller, exporter, custodian or funds holder.
- D-02: seller and exporter qualifications are distinct; no automatic fallback.
- D-03: hub service-only; no implied custody, title, stock held, release or dispatch.
- D-04: compatible multi-batch capability is a target; pilot begins with one batch where practical.
- D-05: one accepted quotation per pilot order.
- D-06: allocation/reservation is not physical movement.
- D-07: direct buyer-to-seller payment; platform does not hold funds or provide escrow.
- Migration 001 remains **HOLD**; Migration 002 remains **NOT AUTHORISED**.
- EVI-21 remains **OPEN**, Closure Accepted = **NO**; DEF-L1-001 and DEF-L1-002 remain **OPEN**.
- No live trade, custody, platform-held funds, escrow, live payment initiation, dispatch or shipment is authorised.
- No real buyer, producer, seller, exporter, facility, regulator or provider qualification/appointment is inferred.

## 6. Status vocabulary

- **Source corrected:** the relevant Notion source specification has been amended as stated in its correction record.
- **Represented:** repository crosswalk or design home records the requirement.
- **Allocated:** a downstream specification has been identified as the home for further design.
- **Implemented:** reviewed code/configuration exists in the selected architecture.
- **Verified:** relevant tests have actually run and evidence is retained.
- **Accepted:** authorised reviewers have accepted the evidence and gate.

The first three statuses must never be presented as the last three.