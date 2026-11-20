# 024-A permission-test source verification

**Source:** 024-A v0.1b, including Supplement F (seller/exporter capacity permissions), 19 November 2026.
**Status:** Draft permission requirements and synthetic test scenarios; not an approved production access policy or executed test report.

## 1. Base permission test inventory

Notion 024-A §14 defines 18 base synthetic permission tests. The repository previously contained 15 local AUTH-TEST cases and did not explicitly cover three source scenarios: hub-to-hub tenant isolation, service identity human-login/scope restriction, and session/token invalidation after authority expiry/revocation. These have now been added as AUTH-TEST-016–018.

| Source test | Required scenario | Repository-local test |
|---:|---|---|
| 1 | User with no organisation membership is denied organisation-scoped access. | AUTH-TEST-001 |
| 2 | Expired membership is denied. | AUTH-TEST-002 |
| 3 | Revoked mandate blocks new seller/exporter actions. | AUTH-TEST-002 |
| 4 | Organisation type alone does not grant seller or exporter permissions. | AUTH-TEST-003 |
| 5 | Cooperative member cannot bind the cooperative without signatory authority. | AUTH-TEST-004 |
| 6 | Seller role does not imply exporter-of-record authority. | AUTH-TEST-005 |
| 7 | Exporter authority for one commodity/destination does not imply authority for another. | AUTH-TEST-006 |
| 8 | Hub service operator can record permitted service events but cannot create custody, held stock, release or dispatch authority. | AUTH-TEST-007 |
| 9 | Buyer A cannot read Buyer B's RFQs, quotations, orders or documents. | AUTH-TEST-008 |
| 10 | Seller A cannot read Seller B's commercial records. | AUTH-TEST-009 |
| 11 | Hub A cannot read or change Hub B's assigned records. | AUTH-TEST-016 (added) |
| 12 | Marketplace operations cannot silently change accepted quotation terms or provider-originated payment evidence. | AUTH-TEST-010 |
| 13 | Platform administrator cannot use the ordinary interface to alter source evidence or audit history. | AUTH-TEST-011 |
| 14 | Reviewer can inspect authorised records but cannot edit source evidence or approve own work. | AUTH-TEST-012 |
| 15 | County/institutional user receives only the expressly authorised data scope. | AUTH-TEST-013 |
| 16 | Service identity cannot authenticate as a human user and cannot exceed its configured scope. | AUTH-TEST-017 (added) |
| 17 | Expired/revoked access invalidates applicable sessions/tokens and is reflected in backend/database enforcement. | AUTH-TEST-018 (added) |
| 18 | Break-glass access is time-limited, reason-coded, logged and independently reviewed. | AUTH-TEST-015 |

## 2. Seller/exporter supplement tests

Notion 024-A Supplement F4 defines ten additional capacity-specific synthetic tests. The repository CAP-TEST-001–CAP-TEST-010 catalogue covers all ten scenarios.

| Source test | Required scenario | Repository-local test |
|---:|---|---|
| 1 | Seller mandate alone does not permit exporter-only actions. | CAP-TEST-001 |
| 2 | Exporter mandate alone does not permit quotation issuance, seller contract acceptance or commercial invoicing. | CAP-TEST-002 |
| 3 | One organisation holding both capacities must have two separate valid records. | CAP-TEST-003 |
| 4 | Expiry or revocation of seller authority blocks seller actions without automatically changing exporter authority. | CAP-TEST-004 |
| 5 | Expiry or revocation of exporter authority blocks export-side actions without automatically changing seller authority. | CAP-TEST-005 |
| 6 | Authority for one commodity/destination scope does not permit another. | CAP-TEST-006 |
| 7 | Missing, disputed or insufficient evidence places the relevant transaction on hold; no fallback party is silently selected. | CAP-TEST-007 |
| 8 | A seller or exporter representative cannot approve their own qualification evidence. | CAP-TEST-008 |
| 9 | Neither capacity can create hub custody, stock release or dispatch permission. | CAP-TEST-009 |
| 10 | Platform operator cannot substitute itself as seller/exporter under D-01/D-02. | CAP-TEST-010 |

## 3. Coverage result

- Base 024-A tests: 18 source scenarios mapped to AUTH-TEST-001–AUTH-TEST-018. Some source scenarios intentionally share a local test where one test harness can cover multiple related conditions; retain explicit assertion-level traceability in execution records.
- Seller/exporter supplement: 10 source scenarios mapped to CAP-TEST-001–CAP-TEST-010.
- Total source test requirements: 28 (18 base + 10 capacity-specific).
- All tests remain synthetic test requirements. No execution, RLS/database enforcement, production authorization, sponsor/legal approval or independent acceptance is claimed.

## 4. Mandatory execution boundary

Tests must run in a controlled synthetic environment and record environment, schema/policy version, test identity, expected and actual result, logs and reviewer. A design catalogue, paper walkthrough or passing mock does not prove database row-level security or production authorization.

Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED; EVI-21 remains OPEN.