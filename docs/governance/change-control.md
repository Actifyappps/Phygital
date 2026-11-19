# Controlled change and decision management

## Change classes
1. **Editorial correction:** no requirement, authority, risk or behaviour change.
2. **Requirement clarification:** resolves ambiguity without changing governing intent.
3. **Product change:** changes scope, workflow, role, data, interface or acceptance.
4. **Architecture decision:** selects or changes technology, topology, provider or trust boundary.
5. **Operational/legal change:** changes custody, seller/exporter, payment, route, facility, provider or regulatory assumptions.
6. **Emergency security change:** narrowly scoped containment with retrospective evidence and authorised review.

## Minimum change record
- Unique change ID, requester role and date.
- Source requirement and reason.
- Current versus proposed behaviour.
- Affected organisations, capacities, workflows and data.
- Security, privacy, safety, legal, commercial and operational impact.
- Dependencies and alternatives considered.
- Required approvals and evidence.
- Traceability/test/runbook impact.
- Rollback or compensating-action plan.
- Decision, conditions, effective date and superseded records.

## Non-waivable controls
A schedule or convenience argument cannot waive seller/exporter authority, hub custody boundaries, inventory integrity, payment/funds-flow boundaries, legal eligibility, data protection, access control or mandatory acceptance evidence.

## Repository procedure
Open an issue; link source IDs; obtain required disposition; implement on a branch; update ADR/docs/tests; review diff; merge only after required checks and approvals. Never edit main to make an unresolved decision appear settled.
