# 024-F — security, privacy, threat and abuse-control crosswalk

**Source:** [024-F — Security, Privacy, Threat & Abuse-Control Specification v0.1](https://app.notion.com/p/41d6808bcd9e817d8d16d37bc31c063e)  
**Source date:** 19 November 2026  
**Status:** Draft for sponsor, technical, operational, legal, data-protection and independent assurance review. Not a production security policy or implementation authorization.  
**Review:** 20 November 2026

## 1. Purpose and authority

024-F translates the 024 digital product and companion specifications into a security/privacy control baseline. It is a requirements specification, not a penetration-test report, privacy impact assessment, legal opinion, security certification, approved production policy or authorization to process real participant data.

Authority hierarchy:
1. Concept Paper v1.1 (strategic baseline).
2. 018-A sponsor decisions D-01–D-07 (approved with conditions).
3. 024 product blueprint and 024-A–E companion requirements.
4. AADDG v1.0 engineering/repository/deployment standard and TSBBF v1.0 technology-selection standard.
5. 024-F security/privacy requirements, to be traced into design, implementation, operation and assurance.
6. Applicable law, regulator direction, contracts and competent professional advice where stricter.

## 2. Non-negotiable boundaries

Security must preserve the sponsor constraints:
- Platform coordinator is not default seller, exporter, custodian, payee or funds holder.
- Seller and exporter authority are separate, scoped, effective-dated and revocable; no automatic fallback.
- Hub service-only baseline; a hub record does not imply custody, title, stock held, release or dispatch.
- Batch identity, compatibility and double-count prevention are mandatory.
- One accepted quotation per pilot order; order items retain accepted quote-line and commercial snapshot lineage.
- Allocation is reservation only, not movement, dispatch or title transfer.
- Buyer pays seller directly through a validated provider/bank route; platform records instructions/status/references/verified events/reconciliation and does not hold funds or provide escrow.
- Synthetic data remains the baseline until real-data security/privacy gates are approved.
- No live trade, custody, platform-held funds, escrow, live payment integration or shipment is authorized by 024-F.

## 3. Trust boundaries and data protection

The specification applies to public marketplace, buyer, producer/supplier, hub operations, programme administration and reviewer/assurance surfaces, plus APIs, databases, object storage, identity, notifications, analytics, logs, backups, repositories, deployment pipelines, integrations and field/offline devices.

Treat as distinct trust boundaries:
- public/unauthenticated visitors;
- authenticated external users and the platform;
- each organisation/tenant and other organisations;
- organisation membership versus delegated authority/capacity;
- privileged staff/support and ordinary users;
- client/device and trusted server;
- platform and external provider/API/webhook;
- online server and offline local queue;
- public QR projection and restricted source records;
- development, test, staging, rehearsal and production environments.

Information classes include public, internal operational, confidential commercial, personal/member-linked, sensitive identity/authority, financial-reference and security-restricted records. Apply data minimisation, purpose limitation, least privilege, controlled sharing, retention/deletion schedules, secure export, correction and access logging. Member data must not be disclosed merely because a cooperative representative has an account; representation authority and disclosure authority are separate.

A privacy/data-protection impact assessment, legal applicability analysis, data-sharing/processing agreements and retention schedule remain external review requirements where applicable; this crosswalk does not assert completion.

## 4. Identity, authority and access

Authentication is not authority. Every material action must be checked server-side against a machine-testable tuple: actor, organisation, role, capacity, mandate, resource scope, action, purpose, workflow state and effective time. Use default-deny access; validate organisation context server-side; recheck mandate expiry/revocation at action time; enforce tenant and object-level isolation in APIs, files, search, exports, jobs and background workers.

Privileged access requires named accounts, least privilege, separation of duties, auditable support access, controlled break-glass and periodic review. MFA, secure recovery, session expiry/revocation and anomaly/rate controls are required according to risk. Self-approval of authority/evidence must be blocked or routed to independent review.

## 5. Evidence, documents, QR and transaction integrity

Evidence class and provenance must remain distinct. Record source, issuer, scope, method, date, reviewer and limitations. E1–E4 semantics remain those of Framework 008; acquisition method is not an evidence class. Preserve review history and quarantine expired, contradictory, altered or out-of-scope material.

File controls: allow-list formats, validate actual file signatures, size limits, malware scanning/quarantine, safe preview, private storage, short-lived scoped download links, access logging and controlled retention. QR/public endpoints expose only explicitly allow-listed public projections; never leak member identity, private batch location, commercial terms or internal notes.

APIs require schema validation, authorization, safe errors, rate limits, idempotency, replay protection and concurrency controls. Provider webhooks must be authenticated using provider-specific verification, timestamp/nonce or equivalent replay protection, secret rotation and reconciliation. A screenshot, redirect or client-side claim is not payment evidence. Offline actions must be allow-listed, minimal, encrypted, attributable, expiry-bound, idempotent and re-authorized on sync; revoked/stale actions are rejected or quarantined, and conflicts must not use unsafe last-write-wins.

## 6. Threat register coverage

024-F identifies 20 initial threat families. These are initial model inputs, not an exhaustive assessment or final residual-risk rating.

| Threat IDs | Threat family | Repository control homes |
|---|---|---|
| TH-01 | Credential theft, phishing, account takeover | `docs/security/`, identity tests |
| TH-02 | Cross-tenant/object-level access | `docs/security/024a-authorisation-tuple-model.md`, `tests/security/` |
| TH-03 | Forged/expired seller-exporter mandate | `docs/commerce/`, `docs/security/`, authorization tests |
| TH-04 | Unauthorized member-data disclosure | `docs/security/privacy-by-design.md`, privacy assessments |
| TH-05 | Fabricated/altered evidence | `docs/product-integrity/`, `docs/security/` |
| TH-06 | Listing manipulation/duplicate supply | `docs/marketplace-trust/`, `docs/data/` |
| TH-07 | Quantity/measurement manipulation | `docs/domain/`, `docs/operations/`, `tests/` |
| TH-08 | Allocation race/replay | `docs/data/`, `docs/quality/014-technical-test-harness-crosswalk.md` |
| TH-09 | False hub custody/release/dispatch | `docs/operations/physical-digital-service-boundaries.md` |
| TH-10 | Quote/price/order tampering | `docs/commerce/`, `docs/domain/` |
| TH-11 | Payment spoofing/forged webhook | `docs/integrations/`, `docs/commerce/` |
| TH-12 | Shipment/export-status spoofing | `docs/integrations/`, `docs/compliance/` |
| TH-13 | Lost device/offline queue replay | `docs/architecture/offline-and-sync-architecture.md` |
| TH-14 | Malicious upload/malware | `docs/security/`, `docs/integrations/` |
| TH-15 | Insider privilege misuse/support impersonation | `docs/security/`, `docs/governance/` |
| TH-16 | Abuse-report/appeal manipulation | `docs/marketplace-trust/` |
| TH-17 | Scraping/enumeration/spam/DoS | `docs/security/`, API controls |
| TH-18 | Dependency/build/secret/deployment compromise | `docs/delivery/actify-engineering-operating-standards.md` |
| TH-19 | Backup compromise/restore failure | `docs/delivery/`, operational runbooks |
| TH-20 | Cross-environment/test-data contamination | `docs/delivery/`, `docs/quality/` |

## 7. Marketplace trust and participant protection

The product must support reporting fake identities, forged authority/evidence, misleading product/origin/quantity claims, duplicate/withdrawn listings, manipulated measurements, coercion, bribery, retaliation, payment/shipment spoofing and safeguard bypass.

Case handling requires a unique reference, severity, owner role, timestamps, evidence references, need-to-know access, preserved audit history, proportionate temporary restriction with scope/reason/authority/duration/review date, human review for material restrictions, reasoned outcome, appeal/correction route and anti-retaliation protections. An allegation or open case must not be published as a finding of fraud or non-compliance.

Recall/withdrawal must preserve affected batch/listing/order scope, trace-back/trace-forward, notification recipients, actions and closure evidence. An ordinary listing administrator cannot silently remove a safety hold.

## 8. Security controls and minimum test coverage

024-F defines SEC-001–SEC-020 covering system context/data flows, data inventory/privacy, identity/session, server-side authorization, tenant isolation, seller/exporter mandate, privileged access, public projections, evidence provenance, upload security, API controls, provider verification, offline security, abuse/appeal/recall, secure SDLC, monitoring/incident response, backup/restore, independent testing, privacy assessment and risk/exception acceptance.

Its ST-01–ST-24 catalogue includes:
- cross-tenant direct-ID and forged-context denial;
- seller/exporter separation, expired mandate and self-approval;
- QR/public projection privacy;
- malicious upload and expired file link;
- idempotency, conflicting key, allocation concurrency;
- forged/replayed provider webhook and screenshot/redirect;
- offline revoked device, duplicate sync and conflict;
- privileged access, independent appeal and recall lineage;
- backup restoration, secret leakage, enumeration/rate controls;
- sensitive log leakage and environment isolation.

These test IDs must be retained and mapped to 024-G and executable tests; do not silently renumber or duplicate them.

## 9. Stage gates and current disposition

- **Stage A — Discovery/synthetic design:** threat modelling, data mapping, control design, vendor review and synthetic security test planning are permitted.
- **Stage B — Before real participant data/field use:** approved purpose/data map, privacy review, identity/tenant/file/device controls, incident process and relevant P0/P1 acceptance evidence required.
- **Stage C — Before production exposure:** selected architecture, secure SDLC, independent security testing, remediation/retest, monitoring, backup/restore, runbooks, access review and residual-risk acceptance required.
- **Stage D — Before live commercial/export workflow:** all applicable commercial, legal, exporter, facility, product, custody, payment, logistics, privacy, security and operational gates independently pass.

Current status: draft specification; controls not represented as implemented or accepted; stack/providers unselected; synthetic data baseline; Migration 001 HOLD; Migration 002 NOT AUTHORISED; EVI-21 OPEN; no live trade/custody/funds/escrow/payment/shipment authority.

## 10. Repository acceptance

- [x] Security/privacy requirement families, 20 threats, SEC-001–020 and ST-01–24 mapped.
- [x] Abuse reporting, human review, appeal, recall and offline controls represented.
- [x] Stage gates and current restrictions preserved.
- [ ] No penetration test, privacy assessment, certification or control implementation is claimed.
- [ ] Threat model, residual-risk acceptance and real-data/production gates remain open.


## Detailed source catalogue

The complete 024-F threat register (TH-01–TH-20), security control requirements (SEC-001–SEC-020) and minimum security tests (ST-01–ST-24), including source descriptions, priorities, accountable roles and expected outcomes, are preserved in `docs/security/024f-control-requirement-catalogue.md`. This crosswalk remains the summary/implementation map; the detailed catalogue is the source-level index. None of the listed controls/tests is thereby implemented or executed.
