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
13. Purpose of access/sharing and recipient context where personal or confidential information is involved.
14. Data classification and permitted disclosure level.

## Canonical decision tuple

`(subject, organisation, membership, role, action, resource_type, resource_id, scope, capacity, mandate, evidence_state, effective_time, phase, environment, purpose, data_classification)`

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
| AUTH-TEST-016 | Hub A user attempts to read or change Hub B assigned records | Deny; no cross-facility disclosure |
| AUTH-TEST-017 | Service identity attempts human authentication or action outside configured scope | Deny; service identity remains narrowly scoped |
| AUTH-TEST-018 | Expired/revoked authority is used through an existing session/token | Deny at backend/database boundary; invalidate applicable access and record event |

## Implementation constraints
- Evaluate authorization on the trusted service layer and database boundary.
- Resource-level checks are mandatory; do not rely on route guards or hidden buttons.
- Record policy version, decision, reason, scope and actor context.
- Re-evaluate current authority at transaction acceptance and high-risk state transitions.
- Service identities use narrow non-interactive credentials, rotation and revocation.
- Do not turn this tuple into an unreviewed universal role engine; validate with legal, security and operational reviewers.

## Role families represented in 024-A

These are logical role families, not confirmed appointments or grants: public visitor; buyer user; producer/member user; cooperative operator; seller representative; exporter representative; hub service operator; quality/laboratory provider user; logistics/clearing provider user; payment-provider integration/user; marketplace operations officer; platform security administrator; independent reviewer/auditor; county/institutional oversight viewer; and service identity.

A person may hold more than one role only after explicit grants and conflict assessment. A role family alone never supplies a mandate, legal capacity, resource scope or data-sharing purpose.

## Seller/exporter capacity-specific test catalogue

The following repository-local IDs preserve the ten additional synthetic test requirements in 024-A Supplement F4. They are not source IDs from Notion.

| Test ID | Scenario | Expected result |
|---|---|---|
| CAP-TEST-001 | Seller mandate alone attempts exporter-only action | Deny |
| CAP-TEST-002 | Exporter mandate alone attempts quotation issuance, seller contract acceptance or commercial invoicing | Deny |
| CAP-TEST-003 | One organisation holds both capacities but only one valid authority record | Only the separately approved capacity is usable |
| CAP-TEST-004 | Seller authority expires/revokes while exporter authority remains valid | Seller actions denied; exporter authority is not silently altered |
| CAP-TEST-005 | Exporter authority expires/revokes while seller authority remains valid | Export actions denied; seller authority is not silently altered |
| CAP-TEST-006 | Authority scope covers one commodity/destination but request uses another | Deny/hold |
| CAP-TEST-007 | Capacity evidence is missing, disputed or insufficient | Hold; no fallback party |
| CAP-TEST-008 | Seller/exporter representative attempts self-approval | Deny; independent reviewer required |
| CAP-TEST-009 | Seller/exporter capacity attempts to create hub custody, release or dispatch authority | Deny |
| CAP-TEST-010 | Platform operator attempts to substitute itself as seller/exporter | Deny under D-01/D-02 |


## 024-A source test reconciliation — 20 November 2026

The current Notion 024-A v0.1b source defines 18 base synthetic permission tests in §14 and ten seller/exporter supplement tests in F4. The repository now maps the 18 base scenarios to AUTH-TEST-001–018 and the ten capacity scenarios to CAP-TEST-001–010. Source-to-local mapping: `docs/security/024a-source-test-verification.md`. These remain test requirements; none is claimed executed or accepted.
