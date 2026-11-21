# EVI-29 — Recovery objectives, retention and restore-test readiness assessment 001

**Review date:** 21 November 2026  
**Evidence item:** EVI-29 — Approve recovery objectives and retention controls; execute a witnessed restore test  
**Status:** IN PROGRESS — requirements mapped; objectives and operational evidence not approved or executed  
**Production status:** NO-GO for production/real-data readiness on this control  
**Scope:** Phygital Export Marketplace only

## 1. Executive finding

The source set establishes the required control principles but does not establish operational recovery readiness.

- 024-F requires backup scope, frequency, encryption, access, retention, location and restoration objectives to be defined after architecture and business-impact analysis; backups must be protected and restoration tested.
- 024-G requires recovery testing and states that RTO/RPO and availability objectives must come from a business-impact decision, not invention.
- 024-C requires retention, archival, deletion/anonymisation, legal hold and cross-border transfer rules to be defined with specialist advice.
- The repository's current backup/restore note explicitly states that no backup capability is claimed.
- The data classification/retention design prohibits inventing statutory retention periods and requires legal, contractual and operational review.

**Disposition:** No RTO/RPO values, backup frequency, retention periods, data region, restore owner, backup service or restore-test results can be approved from current evidence. EVI-29 remains IN PROGRESS.

## 2. Source coverage

| Source | Requirement | Current state |
|---|---|---|
| 024-F v0.1 | Backup scope/frequency/encryption/access/retention/location/objectives; separate backup administration; protect from deletion/ransomware; validate restored audit, authority, transaction, evidence and idempotency state | Requirements specified; no implementation/test evidence |
| 024-G v0.1 | Resilience/recovery tests, integrity validation, reconciliation and authorized reopening; RTO/RPO require business-impact decision | Test requirements specified; thresholds/results absent |
| 024-C v0.1 | Retention, archival, deletion/anonymisation, legal hold and cross-border transfer rules with specialist advice | Logical requirements specified; no approved schedule |
| Data classification and retention design | Classify by sensitivity/criticality; define purpose, owner, trigger, period and disposal; no invented statutory periods | Design baseline exists; category-specific periods and lawful disposition unresolved |
| Privacy and records controls | Retention, legal hold, correction, export, deletion/anonymisation and backup expiry; data-subject and incident workflows | Control index exists; operational schedule/owners unconfirmed |
| Incident response template | Evidence preservation, impact assessment, recovery, reconciliation, safe reopening and exercise evidence | Template exists; no staffed/exercised capability claimed |
| Backup and restore baseline | No backup capability is claimed | Current repository explicitly says none is claimed |

## 3. Recovery scope to validate

The proposed asset inventory is for business-impact and architecture review, not a claim that backup services exist.

| Asset class | Recovery concern | Required validation |
|---|---|---|
| Authoritative relational transaction data | Orders, quotes, batch/inventory states, authority, audit lineage, reservations and state transitions | Transactionally consistent recovery point; integrity and referential checks |
| Private evidence/document blobs | Certificates, inspection records, identity/authority evidence and transaction files | Object version/recovery, hash verification, access controls, metadata/blob reconciliation |
| Evidence metadata and access history | Ownership, classification, hash, review, expiry, revocation and access audit | No orphaned/mislinked files; access history and revocation state preserved |
| Job/outbox and integration state | Pending/retried jobs, provider callbacks, idempotency keys, reconciliation | Prevent duplicate external side effects; replay only through controlled idempotent handling |
| Identity and authorization configuration | Identity tenant configuration, roles, memberships, mandates, scopes and service identities | Restore/rotate configuration safely; no secrets restored into uncontrolled environments |
| Application configuration and migrations | Versioned code, schema migrations, environment config and deployment definitions | Reproducible rebuild; migration compatibility; secrets kept in approved secret management |
| Audit, incident and security records | Material action history, incident evidence, privileged access and recovery logs | Integrity, restricted access, legal hold and chain of custody |
| Public projections/caches | QR/public batch page output and caches | Regenerate from authoritative state; stale/revoked content must not reappear |

## 4. Recovery objective decisions — values intentionally unassigned

RTO/RPO must be determined by a documented business-impact analysis and approved by the authorized programme/service owner with technical, legal, security and operational input. No values are inferred here.

| Service/data class | RTO | RPO | Rationale / approval |
|---|---|---|---|
| Transaction database | NOT SET | NOT SET | Business-impact assessment absent |
| Private evidence/document store | NOT SET | NOT SET | Evidence criticality and revalidation impact not assessed |
| Identity/authorization configuration | NOT SET | NOT SET | Access restoration and revocation risks not assessed |
| Audit/security/incident records | NOT SET | NOT SET | Legal/assurance retention and integrity analysis outstanding |
| Job/outbox/integration state | NOT SET | NOT SET | Replay, duplicate side-effect and reconciliation impact not assessed |

Do not set one generic objective for all classes without a documented rationale. Availability targets, support hours and recovery objectives are distinct decisions.

## 5. Backup-control requirements

Before selecting or operating a backup service, define and approve scope/consistency across databases, object blobs, metadata, audit, job/outbox and configuration; frequency/retention; encryption and key custody; access separation; storage location/subprocessors/transfers; integrity monitoring and alert ownership; protection from deletion/ransomware; restore runbooks; deletion/legal hold/backup expiry; and provider exit/export.

Secrets and encryption keys must not be copied into ordinary backup archives or public repository history. Their backup, escrow/recovery, rotation and access model belongs in an approved secrets/key-management design with separation of duties.

## 6. Retention and deletion model

Do not invent statutory or contractual retention periods. Define a category-specific schedule only after qualified Kenyan and destination-market legal/data-protection review. Each category must record purpose, owner, classification, lawful authority, retention trigger, approved period, legal/audit/dispute hold, archive access, deletion/anonymisation method, backup expiry and evidence of disposition.

Potential categories include identity/mandate records, member/personal data, buyer/supplier commercial records, quotations/orders, inventory/batch/shipment lineage, certificates/evidence files, payment-status references, audit/security logs, incident records, support communications and synthetic test data.

A legal hold must be authorized, scoped, periodically reviewed and released when no longer justified. Backup retention must not defeat an approved deletion indefinitely. A deletion request must not destroy records that must lawfully be retained for transaction integrity, audit, dispute or legal obligations.

## 7. Synthetic witnessed restore-test protocol — design only

No restore test is claimed as executed. Once backup capability, an isolated environment and explicit test authorization exist:
1. Approve test scope, fixtures, environment, witness and stop conditions.
2. Seed known synthetic records across transaction data, evidence metadata/files, audit and job/outbox state.
3. Capture baseline counts, relationships, file manifests/hashes, event IDs and invariant checks.
4. Simulate loss/corruption only in the isolated environment.
5. Restore database and object storage to a clean isolated target.
6. Verify counts, relationships, quantity/order/batch invariants, authority/revocation state, audit lineage, file hashes, access restrictions and metadata/blob reconciliation.
7. Verify job/outbox and provider-event state; mock/disable external side effects and prove retries cannot duplicate live actions.
8. Measure actual recovery time and data-loss point; compare only with objectives approved before the test.
9. Record failures, missing/corrupt data, exposure, duplicate events, manual interventions and deviations.
10. Remediate/retest; obtain independent witness sign-off and authorized reopening/readiness decision.
11. Preserve logs, timestamps, build/environment IDs, scripts, manifests, hashes, reviewer comments and cleanup evidence.
12. Destroy the isolated environment and test data under the approved cleanup procedure.

## 8. Roles and approvals

Proposed role responsibilities, not appointments:
- Service/business owner: approves business-impact analysis and recovery objectives.
- Data Protection/Legal reviewer: approves lawful retention, transfer, legal-hold and deletion requirements.
- Security lead: reviews backup access, encryption, key management and threat controls.
- Platform/Operations lead: owns backup/restore runbooks, monitoring and execution.
- Independent witness/reviewer: observes restore test and validates evidence.
- Authorized programme decision-maker: approves residual risk and readiness disposition.

No individual is appointed by this assessment. No target, retention period or test result is approved.

## 9. Closure blockers

EVI-29 cannot close until service/data inventory and business-impact analysis are approved; RTO/RPO and backup frequency/retention are explicitly approved; storage location, encryption, access separation, key management and monitoring are evidenced; category-specific retention/legal-hold/deletion and backup-expiry schedule is reviewed; accountable operations roles are confirmed; a reproducible isolated synthetic restore test is executed; integrity/privacy/authority/lineage/idempotency checks pass; defects are remediated/retested; an independent witness accepts the evidence; and an authorized residual-risk disposition is recorded.

## 10. Boundaries

This assessment does not select a backup provider, set RTO/RPO values, approve statutory retention periods, establish production backup capability, authorize real-data processing or claim a successful restore. It does not replace a DPIA, legal advice, data-processing agreement or provider assurance.

**Current disposition:** EVI-29 IN PROGRESS; no recovery objectives or retention periods approved; no backup capability or restore test claimed.

[Notion assessment](https://app.notion.com/p/41f6808bcd9e81669670fa582196e324).
