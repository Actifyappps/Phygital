# 024-A authorisation tuple model

**Source:** 024-A v0.1b, 018-A D-01–D-07 and 024-R F-02/F-10.  
**Status:** translation of draft permission requirements into a testable engineering shape; not a final policy engine or grant of production access.

## Decision inputs

Every authorization decision evaluates the complete context, not a role label alone:

1. Authenticated subject and account/session status.
2. Active organisation membership and represented party.
3. Role family and explicit action.
4. Resource type, identifier and controlling organisation.
5. Resource/transaction scope (organisation, hub, case, listing, batch, quote, order, document, review mandate).
6. Legal/contractual mandate and professional/provider qualification.
7. Capacity: buyer, producer/source representative, seller of record, exporter of record, hub service operator, provider, reviewer, platform operations or service identity.
8. Commodity, product form, destination, route, facility and service scope where applicable.
9. Effective-from, expiry, suspension, dispute and revocation.
10. Required evidence and independent approval status.
11. Separation-of-duties/conflict checks.
12. Programme phase, pilot maturity level and environment.

## Canonical decision tuple

`(subject, organisation, membership, role, action, resource_type, resource_id, scope, capacity, mandate, evidence_state, effective_time, phase, environment)`

The policy result is **allow**, **deny** or **hold/review**, with a reason code and audit reference. Missing, ambiguous, expired, conflicting or unverified authority defaults to deny/hold. Authentication is not authorization; UI visibility is not enforcement.

## Seller/exporter separation
- Store seller and exporter capacities as separate scoped authority records.
- A seller mandate cannot satisfy an exporter action; exporter qualification cannot satisfy seller authority.
- The same organisation may hold both only when each is independently evidenced and approved for the exact commodity/product form/destination/route/transaction scope.
- If either required capacity is absent, expired, suspended, disputed or out of scope, hold the transaction. Never infer an alternative party.
- Neither capacity grants custody, storage, release, dispatch or carrier authority.

## Separation-of-duties rules
- No self-approval of authority, seller/exporter qualification or high-risk evidence.
- A creator/editor cannot be sole approver of a sensitive record.
- Seller representative cannot independently verify their own quality evidence.
- Hub operator cannot create custody/release authority under D-03.
- Payment-event submitter cannot self-approve reconciliation mismatch.
- Platform administrator cannot alter accepted terms, source evidence, audit history or provider-originated facts.
- Reviewer cannot edit source records being reviewed.
- Break-glass access must be time-limited, reason-coded, minimally scoped, logged and post-reviewed.

## Repository-local negative/positive test catalogue

These IDs are repository-local test identifiers, not source IDs from Notion.

| Test ID | Scenario | Expected result |
|---|---|---|
| AUTH-TEST-001 | No organisation membership attempts organisation-scoped action | Deny |
| AUTH-TEST-002 | Expired/revoked membership or mandate | Deny; preserve history |
| AUTH-TEST-003 | Organisation type alone attempts seller/exporter action | Deny |
| AUTH-TEST-004 | Cooperative member without signatory authority attempts binding act | Deny |
| AUTH-TEST-005 | Seller-only mandate attempts exporter action | Deny |
| AUTH-TEST-006 | Exporter scope does not cover commodity/destination/route | Deny/hold |
| AUTH-TEST-007 | Hub service operator attempts custody, release or dispatch | Deny |
| AUTH-TEST-008 | Buyer A attempts Buyer B record access | Deny |
| AUTH-TEST-009 | Seller A attempts Seller B confidential commercial record | Deny |
| AUTH-TEST-010 | Operations officer attempts to alter accepted terms or provider event | Deny; open case if required |
| AUTH-TEST-011 | Platform administrator attempts to alter source evidence/audit history | Deny |
| AUTH-TEST-012 | Reviewer attempts to edit source evidence or approve own work | Deny |
| AUTH-TEST-013 | County/institutional viewer requests unapproved personal/member data | Deny |
| AUTH-TEST-014 | Payment integration attempts to initiate or hold platform funds | Deny |
| AUTH-TEST-015 | Break-glass grant has no expiry/reason/reviewer | Deny |

## Implementation constraints
- Evaluate authorization on the trusted service layer and database boundary.
- Resource-level checks are mandatory; do not rely on route guards or hidden buttons.
- Record policy version, decision, reason, scope and actor context.
- Re-evaluate current authority at transaction acceptance and high-risk state transitions.
- Service identities use narrow non-interactive credentials, rotation and revocation.
- Do not turn this tuple into an unreviewed universal role engine; validate with legal, security and operational reviewers.
