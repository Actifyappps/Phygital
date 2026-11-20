# Phase 0 work map — repository integration

**Source:** [Phygital — Phase 0 Work Map (draft for sponsor review)](https://app.notion.com/p/41b6808bcd9e8177867bc2a742d83e5e)  
**Source snapshot:** 17 November 2026.  
**Status:** Planning aid only; not a kickoff authority, appointment, approval, SOP or change to the Phase 0 GO/HOLD/NO-GO baseline.  
**Review date:** 20 November 2026.

## 1. Snapshot and interpretation

The Work Map records a 24-row Evidence Register snapshot: 0 CLOSED, 22 OPEN, 1 UNVERIFIED (CV-12) and 1 IN PROGRESS (CV-20). These are historical snapshot counts, not a claim about current live register status. Notion's Evidence Register remains the operational master.

It identifies that no buyer, producer group, exporter, facility, payment provider or regulatory pathway was then confirmed; Migration 001 had not been executed; and the Level 1 rehearsal was planned but not run. Evidence status changes only through the Evidence Register's authorised closure process.

## 2. Workstream translation

| Workstream | Required activity | Repository home | Dependency / control |
|---|---|---|---|
| A — Governance and housekeeping | Kickoff authority, named workstream roles, canonical workspace/source selection, duplicate reconciliation, evidence-label consistency, stale record updates | `docs/governance/`, `docs/delivery/` | No implied appointment; preserve canonical source register and decision history |
| B — External evidence acquisition | Buyer specification; producer/cooperative supply and qualification; qualified seller/exporter capacity; facility readiness; written commodity/destination regulatory pathway; cost/revenue evidence | `docs/operations/`, `docs/compliance/`, `docs/commerce/`, `evidence/partner-validation/` | External evidence is a hard dependency; non-response or incomplete proof means HOLD |
| C — Technical validation | Level 1 synthetic rehearsal; reconcile target data model; remediate inventory, tenant isolation, audit and event-provenance defects; evaluate architecture | `tests/level1/`, `docs/data/`, `docs/architecture/`, `docs/quality/` | Current holds supersede any earlier draft instruction to execute Migration 001 or prepare/activate Migration 002 |
| D — Legal, tax and data protection | Scoped legal review of roles/contracts/liability; licensed-provider funds-flow confirmation; payments-law status check; data-protection assessment/ODPC applicability; dispute/rejection/refund procedure | `docs/compliance/`, `docs/security/`, `docs/commerce/`, `docs/operations/` | Qualified professional and competent-authority validation required; repository notes are not legal clearance |
| E — Formal checkpoint | Scope and stop-loss approval; pilot KPI definitions; formal GO/HOLD/NO-GO record | `docs/governance/`, `docs/measurement/`, `docs/quality/` | Missing external response means HOLD, never presumed approval |

The work map's indicative day ranges are relative to a kickoff that had not been authorised in the source snapshot. They are not a schedule commitment and should not be converted into dated tasks without an approved kickoff and owners.

## 3. Five external evidence unlocks

1. **Buyer:** an identified buyer and written specification, volume, price basis and delivery terms.
2. **Producer/cooperative:** verified supply plus evidence that the entity is qualified and authorised for the relevant seller/exporter capacity.
3. **Exporter:** a named, willing and appropriately qualified exporter/adviser where the cooperative is not qualified; no automatic fallback.
4. **Facility:** an approved aggregation/handling site with defined service and custody boundaries; a hub is not presumed to hold stock.
5. **Regulatory pathway:** written commodity- and destination-specific requirements confirmed by competent authorities/advisers.

Also validate no more than the sponsor-authorised commodity/destination candidates, route feasibility and the commercial cost/revenue model. These are evidence tasks, not database features that can substitute for external proof.

## 4. Decision reconciliation and supersession

The Work Map's 17 November snapshot says D-01–D-07 were selections only and still needed approval. The current Project Home and 018-A record the sponsor decisions as **approved with conditions on 17 November 2026**. Use 018-A and the current Project Home for the present decision status; retain the Work Map wording as historical context.

The Work Map includes technical tasks that must not be followed as current authorisation:
- It mentions executing Migration 001 in a disposable database and writing Migration 002. Current repository controls state Migration 001 **HOLD** and Migration 002 **NOT AUTHORISED**.
- Any future test of a candidate migration requires a separately approved, disposable environment and explicit test authority; it does not change the hold.
- The current EVI-21 pack and Deliverable 023 record a v0.4 candidate, but browser execution and independent review remain outstanding.

## 5. Phase 0 stop conditions

- No confirmed buyer/supply/exporter/facility/regulatory pathway: HOLD the dependent pilot decision.
- Unclear seller/exporter authority, custody/title, payment role or funds flow: HOLD the dependent action.
- Unverified quality, source, document or provider evidence: do not display it as verified.
- Unresolved allocation, tenant-isolation, audit, provenance or security defect: do not progress the affected workflow.
- No accepted Level 1 evidence and independent review: EVI-21 remains OPEN.
- No explicit sponsor decision and competent legal/operational approvals: no live trade, custody, platform-held funds, escrow, live payment integration, dispatch or shipment.

## 6. Ownership and closure discipline

The Work Map distinguishes sponsor/field responsibilities (appointments, external contacts, legal/tax advice and approvals) from analytical and technical preparation. A role placeholder is not an appointment. A document, interview instrument, repository commit or test harness is not external evidence closure.

For each work item, retain: evidence ID, source/claim, accountable role, responsible actor once appointed, required artifact, acceptance authority, dependency, status, date and next action. Close only through the live Evidence Register with accepted evidence and authorised review.
