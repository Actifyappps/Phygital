# Requirements traceability and coverage control

## Purpose
Maintain a verifiable chain from governing intent to implemented behaviour and acceptance evidence:

**Source / decision → requirement ID → actor and authority → domain rule/state → data invariant → API/event → screen → test case → execution evidence → reviewer disposition.**

No requirement is considered implemented merely because a corresponding page, field, endpoint or table exists.

## Source namespaces
- `CP`: Concept Paper v1.1 strategic requirement.
- `D-01` … `D-07`: sponsor decision constraints from 018-A.
- `P024`: product blueprint requirement.
- `A024`: identity, organisation, role and authority.
- `B024`: workflow/state/business rule.
- `C024`: logical data/information requirement.
- `D024`: API/integration contract.
- `E024`: screen/interaction requirement.
- `F024`: security/privacy/abuse control.
- `G024`: test/acceptance requirement.
- `EVI`: project evidence-register item.
- `ADR`: approved engineering decision.

## Required traceability fields
| Field | Required content |
|---|---|
| Requirement ID | Stable source ID; never recycle |
| Source and version | Canonical document, section and version |
| Statement | Testable requirement, not an implementation assumption |
| Priority / gate | P0/P1/P2 and phase applicability |
| Actor / authority | Human or service identity, organisation, capacity, mandate and scope |
| Domain owner | Bounded context responsible for rule |
| Data invariant | What must always be true |
| Interface contract | Command/query/event or explicit not-applicable reason |
| UI surface | Screen/interaction or not-applicable reason |
| Verification | Test level, case ID, fixture and expected result |
| Evidence | Immutable run reference, environment, build and artefacts |
| Reviewer / status | Role, disposition, date, defect links |

## Coverage rules
- Every D-01–D-07 constraint must have positive and negative tests where behaviour can be tested.
- Every high-risk authority, evidence, inventory, commercial and funds-flow requirement needs a denied-path test.
- Every material workflow transition must trace to server-side validation and audit evidence.
- Every integration must have contract, timeout, retry, idempotency, failure and reconciliation coverage before activation.
- Every data migration must have source-to-target mapping, preconditions, integrity checks, rollback/recovery plan and independent review.
- A requirement without a test must be explicitly marked not yet testable, deferred with authority, or blocked—not omitted.
- Acceptance status must never be inferred from code coverage percentage alone.

## Change impact
A source change triggers an impact review across domain model, schema, permissions, API contracts, UI, fixtures, tests, runbooks, privacy/security controls and operational procedures. Preserve prior test results as historical evidence; rerun affected and regression cases.
