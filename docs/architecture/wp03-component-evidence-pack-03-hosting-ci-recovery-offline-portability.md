# WP-03 component evidence pack 03 — hosting, CI, recovery, offline and portability

**Review date:** 20 November 2026  
**Work package:** WP-03, ADR-0001 / ADR-0002 evidence closure  
**Scope:** TC-09 hosting/deployment; TC-10 CI/source control/build artifacts; TC-12 backup/restore; TC-13 offline/synchronisation; TC-24 data portability and exit.  
**Status:** Source-derived assessment specification only. No candidate has been scored, selected, provisioned or tested. No production or migration authorisation is created.

## 1. Decision boundary

This pack completes the written evidence briefs for the P0 components in these five areas. GitHub is the governed source-control home under AADDG; that does not select an application host, database or worker host. Supabase and Vercel remain candidates/defaults in the operating standard, not a completed Phygital technology decision. The repository remains technology-neutral.

ADR-0001 and ADR-0002 remain OPEN. The canonical Developer Guide v0.1 remains unrecovered, so Candidate A is provisional. Migration 001 remains HOLD; Migration 002 is NOT AUTHORISED. The synthetic spike plan is not an execution record or environment approval. No real-data processing, production deployment or live commercial workflow is authorised.

## 2. Source basis

- **AADDG v1.0 and Level 1 extensions:** GitHub source-of-truth discipline; reproducible source/configuration; PLAN → CODE → COMMIT → BUILD → TEST → ACCEPT → DEPLOY; secrets, worker, webhook, physical-digital integrity, backup/restore and release gates.
- **TSBBF v1.0:** portability/exit, security/privacy, reliability, TCO, licence, integration and operability assessment.
- **Technical Development Manual v3.0:** modular-monolith-first, staged delivery and deferred infrastructure complexity.
- **024-D:** idempotent commands, provider events, retries, concurrency and integration boundaries.
- **024-F / 024-G:** offline, deployment, secret, backup, incident and acceptance requirements.
- **Offline and sync architecture:** allow-listed offline actions, pending-sync status, server authority, idempotency, conflict handling, revocation and provenance.
- **Technology workload/TCO register:** actual workload, connectivity, file volume, operating capacity, RTO/RPO and costs remain UNKNOWN.
- **Repository architecture:** technology-neutral seams for web, packages, workers, integrations, infrastructure, tests, fixtures and evidence.

Canonical sources:
- [Technical Development Manual v3.0](https://app.notion.com/p/7ba6808bcd9e82be811781eca90484ce)
- [024-D — API & Integration Contract Catalogue](https://app.notion.com/p/41d6808bcd9e81fc91d5f462eb3deb8a)
- [024-F — Security, Privacy, Threat & Abuse-Control](https://app.notion.com/p/41d6808bcd9e817d8d16d37bc31c063e)
- [024-G — Test Strategy, Quality Engineering & Acceptance Evidence](https://app.notion.com/p/41d6808bcd9e81c78dfdfa7919489c30)

## 3. Cross-component requirements

1. Deployable environments must be reproducible from committed, reviewed source and versioned configuration; no undocumented dashboard-only state.
2. Secrets, signing keys, database credentials and service-role credentials must never enter source control or client bundles.
3. Environments must be isolated, with least-privilege access and explicit data-classification rules.
4. Releases must be traceable to commit/build identity, test evidence, approvals, configuration and rollback path.
5. Backup is not proven until restore is completed and data/file relationships reconciled.
6. Offline records are untrusted pending submissions; the server remains authoritative for permissions, workflow state, quantities and acceptance.
7. Export is not proven until records, relationships, metadata, files and audit lineage can be reconstructed independently.
8. RTO/RPO, retention, availability, operating hours and service levels remain UNKNOWN until evidenced and approved.

## 4. TC-09 — Hosting and deployment

**Required capability:** Host the approved application and worker responsibilities with secure environment separation, region transparency, reliable release/rollback, observability, recovery and a sustainable operating model. Avoid unnecessary microservices and hidden runtime limits.

**Source-derived requirements**
- Host frontend, application/API and any durable workers according to an approved topology; separate deployables require evidence-based reasons.
- Keep modular-monolith-first available unless validated workload, isolation, reliability or operational needs justify distribution.
- Separate development, test/staging and production environments; control promotion and prohibit uncontrolled data copying.
- Protect and rotate environment-scoped secrets; privileged credentials never enter client code.
- Support TLS, private database/storage access where applicable, service identity, outbound integration controls and administrative access logging.
- Deploy reproducibly from GitHub source with health/readiness checks, rollback and configuration versioning.
- Expose execution, concurrency, bandwidth, storage, request, build and egress limits.
- Provide monitoring, incident diagnostics, alerting and log export/redaction.
- Confirm commercial-use terms permit the intended marketplace activity.
- Confirm region, replication, subprocessors, deletion, incident notification, support and exit terms.
- Critical schema, access policy and runtime behaviour must not depend solely on undocumented dashboard configuration.

**Candidate classes**
- Managed application/web platform.
- Container-based managed runtime.
- Integrated backend/frontend platform bundle.
- Self-managed infrastructure only where named skills, budget and operational capacity exist.

**Evidence required:** exact service/version/region/plan and terms; build/deploy/rollback mechanics; request duration, memory, CPU, concurrency, cold-start, payload, bandwidth, storage and egress limits; network/TLS/secret controls; data location and subprocessors; support/SLA exclusions; pricing/overages/suspension; portability of code/configuration/functions/jobs; measured exit effort.

**Minimum synthetic tests**
1. Reproduce deployment from a clean commit and documented configuration.
2. Prove staging and production credentials/data are isolated.
3. Verify no secret appears in client bundle, repository, build logs or errors.
4. Test health/readiness, graceful restart, failed deployment and rollback.
5. Simulate runtime limit, database outage and provider failure; fail safely.
6. Confirm region, egress and storage behaviour against candidate evidence.
7. Verify correlated, redacted logs/traces.
8. Reconstruct required configuration in a clean target where feasible.

**Status:** INCOMPLETE — NOT SCORABLE. No host, region, plan, deployment test, commercial review or workload-based cost comparison exists.

## 5. TC-10 — CI, source control and build artifacts

**Required capability:** Make source reproducible, reviewable and testable while preventing secrets, untrusted changes and mutable dependencies from compromising builds/releases. GitHub Actions is not selected merely because the repository is on GitHub.

**Source-derived requirements**
- Version code, technical documentation, appropriate configuration, migrations, tests, synthetic fixtures and release evidence.
- Commit dependency manifests and lockfiles together; pin/govern action and tool versions.
- Use review controls and branch protection proportionate to risk.
- Separate untrusted pull-request validation from privileged release workflows.
- Apply least privilege to CI tokens; do not expose secrets to untrusted code or forked pull requests.
- Prefer short-lived/federated deployment credentials where supported and justified.
- Run reproducible install/build, unit, contract, security, lint/type and relevant integration/accessibility checks before promotion.
- Preserve test outputs, artifact identity, commit SHA, dependency inventory and release approvals.
- Scan dependencies/artifacts for vulnerabilities, secrets and licence issues as appropriate.
- Do not execute production migrations as an incidental side effect of general build/deploy.
- Keep synthetic fixtures separate from real operational/analytics data.

**Candidate classes:** GitHub-native CI; independent hosted CI; self-hosted runners. Compare permission model, OIDC, isolation, artifacts, quotas, costs and maintenance.

**Evidence required:** plan-specific minutes/concurrency/artifact retention; job/token permissions and OIDC; runner isolation/network egress; action supply-chain controls; build provenance; fork threat handling; scanning; logs/artifact export; cost and operator burden.

**Minimum synthetic tests**
1. Clean checkout builds from committed manifests/lockfiles.
2. Build is tied to exact commit and dependency inventory.
3. Untrusted PR cannot read deployment secrets or mutate privileged state.
4. CI tokens have least privilege.
5. Synthetic canary secrets are detected and excluded from artifacts/logs.
6. Dependency/action version policy is reproducible.
7. Failed tests block promotion; promoted artifact is the tested artifact.
8. Production migration/deploy requires separate authorization.
9. Independent reviewer can retrieve test evidence.
10. Rollback to a known prior artifact/configuration is demonstrable.

**Status:** INCOMPLETE — NOT SCORABLE. GitHub is the repository platform; CI runner selection, controls, limits and release evidence remain unassessed.

## 6. TC-12 — Backup, restore and continuity

**Required capability:** Recover structured data, private objects, metadata, audit history, configuration and key dependencies. Backup status alone is insufficient; recovery must be demonstrated against approved RPO/RTO and integrity requirements.

**Source-derived requirements**
- Define scope across database, objects/files, metadata, audit, configuration, source, infrastructure definitions and operational records.
- Define frequency, retention, encryption, access separation, immutability/independent copies and deletion.
- Set RPO/RTO only after business impact, volumes, staffing, provider capabilities and costs are validated.
- Protect backup credentials and encryption keys separately from ordinary runtime credentials.
- Prevent a compromised production account from deleting every recovery copy.
- Include point-in-time recovery where justified by transaction/audit needs.
- Restore into a clean isolated environment; preserve relationships, file references, hashes, evidence provenance and tenant boundaries.
- Document restore dependencies: identity, secrets, storage, configuration, DNS and external reconnection.
- Record actual restore time, data-loss window, defects, reviewer and corrective actions.
- Test provider outage/exit recovery, not just accidental deletion inside the same service.

**Candidate classes:** managed database backup/PITR plus object versioning; independent encrypted exports/object copies; cross-region or cross-provider replication. Compare completeness, independence, data residency, recovery lag and operating burden.

**Evidence required:** backup scope/schedule/retention; encryption and key recovery; restore granularity; independent export formats; measured recovery performance; approved RPO/RTO; test ownership/cadence; reconciliation methods; incident support.

**Minimum synthetic tests**
1. Restore database and private objects into a clean isolated environment.
2. Reconcile row/object counts, checksums, relationships, metadata, access scope and audit history.
3. Recover to a selected point in time and record actual data-loss window.
4. Demonstrate separately protected and recoverable backup credentials/keys.
5. Simulate primary dataset deletion/corruption and recover from an independent copy.
6. Reconstruct configuration and verify access boundaries.
7. Measure elapsed recovery time; do not claim SLA compliance without an approved target.
8. Independent reviewer inspects evidence and defects.

**Status:** INCOMPLETE — NOT SCORABLE. Existing backup-restore documentation explicitly states no backup capability is claimed; no RPO/RTO or restore rehearsal exists.

## 7. TC-13 — Offline/local persistence and synchronisation

**Required capability:** Narrowly support field work under intermittent connectivity while preserving the difference between a local capture and a server-accepted fact. Stale permissions or local manipulation must never authorize a prohibited action.

**Source-derived requirements**
- Explicitly allow-list offline actions. Sensitive approvals, authority grants, commercial acceptance and externally verified claims may require connectivity/re-review.
- Each queued operation carries a unique client operation ID and device/session context for duplicate detection/provenance.
- Queued data is visibly pending sync, never server-accepted or verified.
- Server remains authoritative for permissions, state, quantity, commercial snapshots and acceptance.
- Synchronisation is idempotent and ordered where dependencies require it.
- Conflict policy is domain-specific: reject, merge only non-conflicting metadata or create a human review task; never silently overwrite material facts.
- Revalidate membership, role, mandate, resource state, quantity and programme gate at sync time.
- Handle clock skew, device loss, shared-device exposure, revoked membership, expired mandate, changed batch/order state, interrupted upload and checksum mismatch.
- Preserve original capture time, server receipt time, actor, device context, correction history and sync outcome.
- Minimize/protect local data; apply expiry, logout/remote revocation and shared-device clearing under approved privacy/security policy.
- No offline queue may authorize dispatch, custody, payment, export or another prohibited transition.

**Candidate classes:** browser PWA with IndexedDB/service worker; online-first client with bounded local draft queue; native/local application. Compare quota/eviction, encryption, update model, device support, queue durability, background-sync limits and lifecycle cost.

**Evidence required:** actual site/device connectivity observations; browser/OS/device matrix; local data protection and device-loss behaviour; service-worker lifecycle; queue durability across restart/update; conflict and idempotency semantics; upload resume/checksum; user comprehension; bandwidth cost; privacy review.

**Minimum synthetic tests**
1. Capture an allow-listed synthetic draft offline; it remains pending.
2. Restart/update client and verify queue preservation or safe loss reporting.
3. Replay operation; confirm idempotent outcome.
4. Submit out-of-order dependent operations; confirm safe ordering/hold.
5. Revoke membership/mandate offline; sync denies or quarantines stale action.
6. Change server batch/order/quote state before sync; stale action is rejected/reviewed.
7. Simulate clock skew; server time remains authoritative.
8. Interrupt attachment upload; verify checksum/resume/quarantine.
9. Create conflicting material edits on two devices; no silent last-write-wins.
10. Test logout/shared-device clearing and lost-device response.
11. Confirm queue cannot dispatch, release stock, accept terms or record payment completion.
12. Show clear sync result and resolution route.

**Status:** INCOMPLETE — NOT SCORABLE. Requirements exist, but site/device conditions, implementation, privacy review and candidate tests are absent.

## 8. TC-24 — Data import/export, portability and exit

**Required capability:** A credible exit path preserves the full business record, not just a database dump: entities, relationships, files, metadata, audit lineage, identifiers, configuration and interpretation of historical status.

**Source-derived requirements**
- Export structured records in documented machine-readable formats with stable identifiers and schema/version metadata.
- Export private objects with metadata, hashes, evidence/claim links, classification, retention and related entity IDs.
- Preserve foreign-key relationships, tenant scope, provenance, audit events, correction/reversal history and accepted commercial snapshots.
- Include configuration, rule versions, reference data and integration mappings needed to interpret records.
- Document identity-provider subject mapping without exporting secrets or improperly transferring password hashes.
- Support repeatable export/import with validation and reconciliation.
- Protect export packages as sensitive data: encryption, scoped access, logging, retention and secure deletion.
- Record provider-specific formats, limits, downtime/consistency requirements, migration effort and replacement cost.
- Demonstrate restoration into an independent compatible environment.
- Distinguish technical portability from legal permission to transfer/retain/process each data category.

**Candidate classes:** standard relational export/import plus object export; provider APIs/bulk export; custom documented export pipeline. Compare completeness, rate/size limits, metadata/lineage, repeatability, fees and independent restore.

**Evidence required:** exact export scope/formats; rate/size/cost limits; stable IDs and schema evolution; deleted/revoked/superseded record treatment; object hashes/metadata; encryption/access/audit; independent import tooling; measured exit labour/downtime/cost; legal/privacy transfer review.

**Minimum synthetic tests**
1. Export synthetic tenant records and linked objects with stable IDs and metadata.
2. Import into clean independent environment; validate relationships, counts, hashes and audit history.
3. Confirm no cross-tenant leakage in export jobs/packages.
4. Preserve evidence class, acquisition type, issuer, validity, revocation and supersession.
5. Preserve accepted quote/order snapshots and allocation/movement distinction.
6. Reconstruct role/mandate references without transferring secret credentials.
7. Repeat export/import and compare deterministic reconciliation.
8. Measure operator time, downtime, storage/egress and transformation effort.
9. Test retention/deletion and secure disposal of export packages.
10. Produce an exit runbook with dependencies, sequence, rollback/parallel run and accountable owner.

**Status:** INCOMPLETE — NOT SCORABLE. No provider-specific export/restore demonstration, legal transfer review or measured exit cost exists.

## 9. Shared evidence record and unresolved inputs

For each candidate retain exact service/version/plan/region; evidence source/date; applicable terms; quotas and failure limits; configuration; test commit/build identity; raw results; defects/retests; TCO/operator effort; blockers; reviewer and disposition.

Unresolved inputs: user/transaction/file/bandwidth/device/offline volumes; retention and lawful transfer requirements; availability/RPO/RTO/support expectations; named release/CI/backup/incident/recovery operators; provider region/plan/overage/support/export terms; canonical Developer Guide v0.1 recovery/disposition; authorized scope, budget and reviewers for a synthetic spike.

## 10. Disposition

This pack completes written P0 evidence briefs for TC-01–TC-07, TC-09–TC-10, TC-12–TC-13 and TC-24 across packs 01–03. It does not mean provider evidence has been collected or components have passed tests. All five components in this pack remain INCOMPLETE — NOT SCORABLE.

Next: reconcile packs against TSBBF source/workbook, verify candidate-specific current terms, gather Phase 0 workload/operating evidence, and only then propose a shortlist and separately authorized synthetic comparison spike.

**No technology selection, procurement, provisioning, production deployment, migration, real-data processing or live integration is authorised by this pack.**
