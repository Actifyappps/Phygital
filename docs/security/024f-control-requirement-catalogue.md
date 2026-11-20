# 024-F security threat, control and test catalogue

**Source:** 024-F — Security, Privacy, Threat & Abuse-Control Specification v0.1, dated 19 November 2026.
**Status:** Draft for sponsor, technical, operational, legal, data-protection and independent assurance review. This catalogue is not a production security policy, implemented control baseline, penetration-test report, privacy impact assessment or security certification.

## 1. Threat and abuse register

All 20 source threat records (TH-01–TH-20) are preserved below with their stated impact, control direction and initial priority. Initial priorities are not residual-risk ratings or accepted risk decisions.

| ID | Threat / abuse case | Primary impact | Required control direction | Initial priority |
| TH-01 | Credential theft, phishing, credential stuffing or account takeover | Unauthorized transactions, data exposure, impersonation | MFA for privileged/high-impact roles, rate limits, recovery hardening, session revocation, anomaly alerts | P0/P1 |
| TH-02 | Cross-tenant/object-level access flaw | Disclosure or alteration of another organisation's data | Default-deny authorization, tenant isolation, RLS and API negative tests, safe exports and file checks | P0 |
| TH-03 | Forged or expired organisation mandate; seller/exporter impersonation | Invalid commercial commitment or export representation | Separate authority records, source checks, effective dates, independent review, no fallback, expiry/revocation enforcement | P0 |
| TH-04 | Cooperative representative discloses member data without authority | Privacy harm, trust loss, unlawful disclosure | Separate representation and disclosure authority, minimisation, purpose-bound sharing, aggregate default | P0 before real member data |
| TH-05 | Fabricated, altered or misrepresented evidence/certificate | Buyer deception, unsafe or non-conforming product, legal exposure | Provenance, E1–E4 controls, issuer/scope checks, immutable review history, quarantine and appeal | P0 |
| TH-06 | Listing manipulation, duplicate supply or false availability | Over-selling, buyer loss, reputational harm | Seller authority, batch backing, compatibility checks, quantity invariants, double-count prevention, stale listing holds | P0 |
| TH-07 | Quantity/measurement manipulation or instrument tampering | Disputes, loss, incorrect commercial commitments | Method/unit/precision/calibration metadata, independent checks where required, reconciliation and anomaly review | P0 |
| TH-08 | Allocation race, replay or duplicate command | Oversubscription or false reservation | Atomic server-side constraints, idempotency, concurrency tests, audit and reversal lineage | P0 |
| TH-09 | Hub operator or insider creates false custody/release/dispatch record | False physical-control assertion and liability | Service-only UI/API model, deny custody semantics, separation of duties, audit and exception escalation | P0 |
| TH-10 | Quote, price, terms or order-line tampering | Unauthorized commercial commitment or dispute | Seller authority, versioned immutable terms snapshot, one accepted quote/order, buyer/seller acceptance evidence | P0 |
| TH-11 | Payment spoofing through screenshot, redirect, email or forged webhook | False paid status, financial loss | Provider-authenticated event verification, replay protection, reconciliation, no client-side confirmation | P0 before payment integration |
| TH-12 | Shipment or export-status spoofing | False assurance, premature buyer reliance | Authorized source, evidence-linked milestone, provider verification and correction history | P0 before shipment workflow |
| TH-13 | Lost device, offline queue theft or replay | Personal-data exposure or unauthorized action | Encryption, minimal local cache, device revocation, expiry, idempotency, sync revalidation | P1 before offline real data |
| TH-14 | Malicious upload, malware, archive bomb or unsafe preview | Account compromise, service compromise, data exfiltration | File allow-list, signature validation, quarantine, scanning, safe storage/preview, size limits | P0 before uploads |
| TH-15 | Insider privilege misuse or support impersonation | Data theft, unauthorized change, evidence manipulation | Least privilege, named accounts, approval separation, privileged logging, periodic review | P0 |
| TH-16 | Abuse reports, appeals or complaints manipulated to silence participants | Unfair restriction, retaliation, loss of trust | Human review, reasoned decisions, separation of reporter/subject access, appeal, anti-retaliation controls | P1 |
| TH-17 | Automated scraping, enumeration, spam or denial of service | Availability loss, commercial intelligence leakage | Rate limits, bot controls, safe public projections, pagination limits, monitoring and response | P1 |
| TH-18 | Dependency, build pipeline, secret or deployment compromise | System-wide compromise or persistent access | Protected branches, dependency scanning, secret scanning, reproducible builds, restricted deployment and rollback | P0 before production |
| TH-19 | Backup compromise, deletion or failed restoration | Confidentiality loss or prolonged outage | Encryption, access separation, backup monitoring, restore tests, retention and incident runbooks | P1 before production |
| TH-20 | Cross-environment or test-data contamination | Real data exposed in development/test or synthetic records mistaken as real | Environment separation, synthetic-only baseline, access restrictions, data reset and release checks | P0 |

## 2. Security control requirements

All 20 source security control requirements (SEC-001–SEC-020) are preserved below, including priority and proposed accountable role. These are acceptance requirements, not evidence that controls are configured or have passed.

| Control ID | Requirement / acceptance evidence | Priority | Proposed accountable role |
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

## 3. Minimum security test catalogue

All 24 source security tests (ST-01–ST-24) are preserved below with scenario and expected result. They are test specifications only; no test execution is claimed.

| Test ID | Scenario | Expected result |
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

## 4. Stage-gated security assurance

- **Stage A — Discovery and synthetic design:** threat modelling, data mapping, control design, vendor/security documentation review and synthetic security test planning are permitted within bounded Phase 0 work.
- **Stage B — Before real participant data or controlled field use:** approved purpose/data map, privacy review, access model, authentication/session controls, tenant isolation, device/offline policy, file security, incident process and relevant P0/P1 acceptance evidence are required.
- **Stage C — Before production exposure:** selected architecture, secure SDLC/deployment controls, independent security testing, remediation/retest, monitoring, backup/restore evidence, incident runbooks, access review, operational ownership and residual-risk acceptance are required.
- **Stage D — Before live commercial/export workflow:** all applicable commercial, legal, exporter, facility, product, custody, payment, logistics, privacy, security and operational gates must independently pass.

## 5. Required status discipline

Threat records, controls and test cases being present in this document does not establish implementation, configuration, execution, independent review, acceptance or certification. Record actual evidence, owner, version/environment, defect and retest before changing status.

Current programme boundaries remain: synthetic data baseline; Migration 001 HOLD; Migration 002 NOT AUTHORISED; EVI-21 OPEN; no live trade, custody, platform-held funds, escrow, live payment integration or shipment.