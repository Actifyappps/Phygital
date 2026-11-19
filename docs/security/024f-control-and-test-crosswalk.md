# 024-F security controls and test crosswalk

**Source:** 024-F v0.1 — Security, Privacy, Threat & Abuse-Control Specification.  
**Status:** Draft for specialist review; controls are requirements, not evidence of implementation or certification.

## Control requirements SEC-001–SEC-020

| Control | Requirement | Priority | Responsible review role |
|---|---|---|---|
| SEC-001 | Approved system context, asset inventory, trust-boundary and data-flow diagrams exist and are reviewed | P0 | Product/security architect |
| SEC-002 | Data inventory, classification, purpose, retention and sharing schedule approved for the intended data | P0 before real data | Data protection lead / legal reviewer |
| SEC-003 | Authentication, recovery, MFA and session design documented and tested | P0 | Identity/security lead |
| SEC-004 | Permission tuples and default-deny rules from 024-A are enforced server-side; positive and negative tests pass | P0 | Application/security lead |
| SEC-005 | Cross-tenant, object-level, file, export, search and background-job isolation tests pass | P0 | Application/database security lead |
| SEC-006 | Seller/exporter authority is independently checked; no-fallback and expiry/revocation tests pass | P0 | Commercial authority reviewer / product lead |
| SEC-007 | Privileged access, break-glass, machine identities and separation of duties are approved and auditable | P0 | Security/operations lead |
| SEC-008 | Public projections and QR endpoints expose only approved fields; restricted data remains access-controlled | P0 | Product/data lead |
| SEC-009 | Evidence provenance, E1–E4 class transitions, document integrity and audit history are tested | P0 | Evidence assurance lead |
| SEC-010 | Upload quarantine, file validation, malware scanning and secure download controls are tested | P0 before file exchange | Application/security lead |
| SEC-011 | API validation, rate limiting, idempotency, replay, concurrency and safe errors are tested | P0 | API/security lead |
| SEC-012 | Webhook/provider authenticity, secret rotation and reconciliation tests pass before any integration is enabled | P0 before integration | Integration/security lead |
| SEC-013 | Offline action allow-list, device protection, revocation and sync-conflict controls are approved and tested before real offline data | P1 | Field operations/security lead |
| SEC-014 | Abuse reporting, human review, appeal, participant protection and recall controls are operationally assigned | P1 before public/live use | Trust & safety/operations lead |
| SEC-015 | Secure SDLC, repository, dependency, build and deployment controls align with AADDG and selected stack | P0 before production | Engineering lead |
| SEC-016 | Monitoring, alerting, incident response and escalation runbooks are approved and exercised | P1 before production | Security/operations lead |
| SEC-017 | Backup, restoration, integrity validation and continuity exercises are evidenced | P1 before production | Platform operations lead |
| SEC-018 | Independent security testing and remediation/retest evidence accepted at the required risk level | P0 before production | Independent assurance reviewer |
| SEC-019 | Privacy risk assessment and any required impact assessment/contractual review are completed | P0 before real personal data | Data protection/legal reviewer |
| SEC-020 | Residual risks, exceptions, owners, expiry and authorized acceptance are recorded; no mandatory gate is silently waived | P0 | Programme sponsor / risk owner |

## Security test catalogue ST-01–ST-24

| Test | Scenario | Required result |
|---|---|---|
| ST-01 | User from Organisation A requests Organisation B record by direct ID | Denied without revealing protected details; security event recorded |
| ST-02 | User changes organisation context in a request payload | Server derives/validates context; unauthorized cross-tenant action denied |
| ST-03 | Seller-only representative attempts exporter-only action | Denied; distinct capacity evidence required |
| ST-04 | Expired/revoked mandate attempts a previously permitted action | Denied at execution time |
| ST-05 | User attempts to approve own authority or evidence | Denied or routed to independent reviewer |
| ST-06 | Public listing/QR endpoint is probed for member, batch-location or commercial fields | Only allow-listed public projection returned |
| ST-07 | User uploads renamed executable, malformed file or archive bomb | Rejected or quarantined; never executed or publicly served |
| ST-08 | Signed file link is reused after expiry or by unauthorized context | Access denied |
| ST-09 | Duplicate idempotency key with identical request | Single authoritative effect; deterministic response |
| ST-10 | Duplicate idempotency key with conflicting request | Rejected and logged |
| ST-11 | Concurrent allocation requests exceed eligible quantity | Server prevents over-allocation atomically |
| ST-12 | Replayed or forged provider webhook | Rejected; no payment state change |
| ST-13 | Buyer submits payment screenshot or browser redirect as proof | Not treated as authoritative confirmation |
| ST-14 | Offline action syncs after user/device revocation or action expiry | Rejected/quarantined; no authoritative state change |
| ST-15 | Device resubmits same queued action after timeout | Idempotent handling; no duplicate effect |
| ST-16 | Offline quantity/evidence conflicts with current server record | Conflict surfaced for review; no last-write-wins |
| ST-17 | Privileged administrator accesses restricted record | Purpose-bound, attributable, logged and reviewable |
| ST-18 | Appeal is submitted against a restriction by the original decision-maker | Independent reviewer path required |
| ST-19 | Recall/withdrawal is applied to a batch supporting multiple listings/orders | Trace-back/trace-forward scope is complete and auditable |
| ST-20 | Backup is restored after simulated loss/corruption | Integrity and critical state verified; gaps recorded before reopening |
| ST-21 | Secret is committed to source or exposed in client bundle | Automated control detects and blocks/reports; secret rotated if exposed |
| ST-22 | User enumerates IDs or scrapes public/API endpoints at abnormal rate | Rate limit/abuse control activates without exposing protected data |
| ST-23 | Logs are inspected for passwords, tokens, unnecessary personal data or file contents | No prohibited sensitive values present |
| ST-24 | Staging/test environment attempts to access production data or secrets | Denied by environment and identity boundary |

## Implementation homes
- System context, asset inventory and trust boundaries: `docs/architecture/`, `docs/security/`.
- Privacy purpose, information classes, retention and sharing: `docs/security/privacy-and-records-controls.md`, `packages/domain/privacy/`.
- Authentication, mandate, least privilege and tenant isolation: `packages/domain/identity/`, `packages/domain/organisations/`, `packages/domain/authority/`, `tests/security/`.
- Evidence, file integrity, public QR projection: `packages/domain/evidence/`, `packages/domain/documents/`, `docs/decisions/ADR-0007-public-projections-and-qr.md`.
- API, webhook, payment and provider security: `docs/api/`, `integrations/`, `packages/domain/payment-status/`.
- Offline/device controls: `packages/domain/offline-sync/`, `docs/decisions/ADR-0006-offline-and-synchronisation.md`.
- Abuse, appeals, recalls and participant protection: `packages/domain/marketplace-trust/`, `packages/domain/product-integrity/`, `packages/domain/cases/`.
- Secure SDLC, monitoring, backup and recovery: `docs/delivery/`, `docs/operations/`, `infra/`.

ST-01–ST-24 are security-specific tests. They must remain separately identifiable even where a QAT case covers similar end-to-end behaviour. A product-level QAT pass does not automatically close an ST case.
