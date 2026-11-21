# Backup, restore and recovery controls — design only

**Status:** No backup capability is currently claimed. No RTO/RPO, backup frequency, retention period, backup provider, production restore process or witnessed restore result is approved.

## 1. Purpose and authority

This document records minimum design and evidence requirements for EVI-29. Apply 024-F for security/privacy controls, 024-G for resilience and acceptance evidence, 024-C for data/retention semantics, the data classification and retention design, incident response controls, TSBBF and AADDG.

This is a design baseline, not an operating procedure for an existing production service. It does not prove that backups exist or authorize production/real-data use.

## 2. Backup scope to assess

The business-impact and architecture review must determine the exact scope and consistency model for:
- authoritative relational transaction data, including authority, batch/inventory, quote/order, reservation and audit lineage;
- private evidence/document blobs and their object metadata, hashes, access scopes and review/expiry state;
- job/outbox and integration state, including idempotency and reconciliation references;
- identity/authorization configuration, memberships, mandates and service identities;
- versioned application code, migrations and deployment configuration;
- audit, security, incident and recovery evidence.

Secrets and encryption keys must not be copied into ordinary backup archives or public repository history. Their backup, escrow/recovery, rotation and access model must be handled through an approved secrets/key-management design with separation of duties.

## 3. Recovery objectives — not set

RTO and RPO require a documented business-impact analysis and explicit approval by the authorized service/programme owner with technical, operational, security, legal and data-protection input.

| Service/data class | RTO | RPO | Rationale / approver |
|---|---|---|---|
| Transaction database | NOT SET | NOT SET | Business-impact analysis and approval outstanding |
| Private evidence/document store | NOT SET | NOT SET | Evidence criticality and revalidation impact outstanding |
| Identity/authorization configuration | NOT SET | NOT SET | Access restoration and revocation risk assessment outstanding |
| Audit/security/incident records | NOT SET | NOT SET | Legal/assurance retention and integrity analysis outstanding |
| Job/outbox/integration state | NOT SET | NOT SET | Replay, duplicate side-effect and reconciliation impact outstanding |

Do not substitute provider defaults or generic “best practice” numbers for approved objectives. Availability, support hours, RTO and RPO are separate decisions.

## 4. Backup control requirements

Before selecting or operating a backup service, approve:
1. Scope, consistency and capture order across database, files, metadata, audit and job/outbox state.
2. Frequency and retention based on approved RPO and legal/contractual obligations.
3. Encryption in transit/at rest where supported; key custody, rotation and recovery.
4. Least-privilege access and separation between backup administration and routine application administration.
5. Approved storage locations, subprocessors, cross-border transfer and jurisdiction.
6. Monitoring, failure alerting, integrity checks and accountable response ownership.
7. Protection against accidental deletion, compromised credentials and ransomware where supported.
8. Restore runbook, prerequisites, recovery credentials, clean target and reconciliation steps.
9. Retention, legal hold, deletion/anonymisation, backup expiry and auditable disposal.
10. Export, portability, replacement effort and provider-exit procedure.

## 5. Retention and deletion

Do not invent statutory or contractual retention periods. Define a category-specific schedule only after qualified Kenyan and destination-market legal/data-protection review. Each category must record purpose, owner, classification, lawful authority, retention trigger, approved period, legal/audit/dispute hold, archive access, deletion/anonymisation method, backup expiry and evidence of disposition.

A legal hold must be authorized, scoped, periodically reviewed and released when no longer justified. Backup retention must not defeat an approved deletion indefinitely. A deletion request must not destroy records that must lawfully be retained for transaction integrity, audit, dispute or legal obligations.

## 6. Restore test — synthetic, isolated and witnessed

No restore test is claimed as executed. Once a backup capability, isolated environment and explicit test authorization exist:
1. Approve test scope, fixtures, environment, witness and stop conditions.
2. Seed known synthetic records across transaction data, evidence metadata/files, audit and job/outbox state.
3. Capture baseline counts, relationships, file manifests/hashes, event IDs and invariant checks.
4. Simulate loss/corruption only in the isolated environment.
5. Restore the database and object storage to a clean isolated target using the documented runbook.
6. Verify counts, relationships, quantity/order/batch invariants, authority/revocation state, audit lineage, file hashes, access restrictions and metadata/blob reconciliation.
7. Verify job/outbox and provider-event state; mock/disable external side effects and prove retries cannot duplicate live actions.
8. Measure actual recovery time and data-loss point; compare only with objectives approved before the test.
9. Record failures, missing/corrupt data, exposure, duplicate events, manual interventions and deviations.
10. Remediate and retest; obtain independent witness sign-off and an authorized reopening/readiness decision.
11. Preserve logs, timestamps, build/environment IDs, scripts, manifests, hashes, reviewer comments and cleanup evidence.
12. Destroy the isolated environment and test data under the approved cleanup procedure.

## 7. Closure gate

EVI-29 remains open until approved service/data inventory and business-impact analysis; approved RTO/RPO and backup/retention schedule; evidenced storage location, encryption, access separation, key management and monitoring; qualified legal/data-protection review; named accountable roles; a reproducible synthetic restore test; integrity/privacy/authority/lineage/idempotency checks; remediation/retest; independent witness acceptance; and an authorized residual-risk disposition are all recorded.

**Current disposition:** No backup capability claimed; RTO/RPO and retention periods NOT SET; no restore test executed. See [EVI-29 Recovery Objectives, Retention & Restore-Test Readiness Assessment 001](https://app.notion.com/p/41f6808bcd9e81669670fa582196e324).
