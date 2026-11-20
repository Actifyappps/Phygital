# TC-12, TC-13 and TC-24 — recovery, offline and portability evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or implementation approval.

## 1. Purpose and governing principle

This record advances WP-03 for:
- TC-12 backup, restore and continuity;
- TC-13 offline/local persistence and synchronisation;
- TC-24 data import/export, portability and exit.

These are cross-component requirements. A database snapshot is not a full application backup; a browser cache is not a reliable operational database; and a SQL dump is not a complete export of Phygital's physical-digital evidence. The recovery/exit unit includes structured records, files, metadata, identity mapping, configuration, audit history, source code and the procedures needed to reconstruct and verify them.

No backup target, offline implementation or exit tool is selected by this record. RPO/RTO, retention and workload assumptions remain UNKNOWN.

## 2. TC-12 — Backup, restore and continuity

### 2.1 Provider backup facts already verified

| Candidate | Published recovery facts at evidence capture | Important limitations |
|---|---|---|
| Supabase | Pro daily backups retained 7 days; Team 14 days; Enterprise up to 30 days. PITR is an add-on; WAL archiving is described at two-minute intervals for the default mechanism. | Database backups do not include Storage object blobs; custom role passwords are not included; deleting the project permanently removes associated backups. |
| Neon | Free history window up to 6 hours/1 GB; Launch up to 7 days; Scale up to 30 days. History storage is billed separately. | Instant restore applies to root branches; a restore reverts all data/schema on that branch; this is not an independent full-app/object backup. |
| Render | Paid Postgres PITR: 3 days on Hobby workspace, 7 days on Pro or higher. Logical exports are retained 7 days. | PITR creates a new database instance; restore instance is separately billable; deleting database removes PITR state/exports/snapshots; Free compute has no PITR/logical backup. |

Official sources:
- [Supabase database backups — updated 12 November 2026](https://supabase.com/docs/guides/platform/backups)
- [Supabase backup feature and RPO description](https://supabase.com/features/database-backups)
- [Neon history window](https://neon.com/docs/postgres/backup-restore/history-window)
- [Neon instant restore](https://neon.com/docs/postgres/backup-restore/branch-restore)
- [Render Postgres recovery and backups](https://render.com/docs/postgresql-backups)

### 2.2 Backup pattern options

**Pattern A — managed PITR + independent encrypted export**
- Use provider PITR for fast recovery from recent logical/operational errors.
- Independently export database records on a controlled schedule to a separate account/provider.
- Export private objects and their metadata separately, with checksums and manifests.
- Preserve schema/migration source, role/policy configuration, identity mapping and operational runbooks in version control or protected evidence storage.
- This is a layered pattern, not a vendor product selection.

**Pattern B — self-managed logical backup pipeline**
- Use PostgreSQL pg_dump in custom or directory format, plus pg_dumpall or explicit global-object handling where the provider permits it.
- Use pg_restore/psql in an isolated clean target.
- Encrypt, sign, checksum, retain and monitor backup artefacts.
- Export objects from their storage provider separately.
- Requires named owner, credentials, scheduler/worker, monitoring, storage and restore discipline.

**Pattern C — provider-native replication/backup suite**
- Use provider PITR, snapshots, object versioning/replication and managed backup features.
- Add an independent copy outside the provider account/region.
- Verify retention, deletion isolation, access separation, data location and restore procedure.
- A same-account backup that can be deleted by the same compromised credentials is not sufficient independence.

### 2.3 PostgreSQL portability facts and limits

- pg_dump creates a consistent export of one database while users continue to access it; it does not block normal readers/writers.
- pg_dump supports SQL script and archive formats. Custom (-Fc) and directory (-Fd) archives support selective/reordered restore and parallel restore; directory format supports parallel dumps.
- pg_dump exports one database. It does not include cluster-wide roles and tablespaces; pg_dumpall or a separately governed globals export is needed where permitted.
- pg_dumpall can export multiple databases and global objects, but it requires high privileges and the snapshots of separate databases are not synchronized with each other.
- Restoring a dump executes SQL originating from the source database; inspect untrusted dump artefacts before restore.
- A logical dump is not automatically a complete provider exit: extensions, roles, grants, secrets, identity users, object storage, DNS, functions, scheduled jobs, network policies and platform configuration may need separate treatment.

Official sources:
- [PostgreSQL 18 pg_dump](https://www.postgresql.org/docs/18/app-pgdump.html)
- [PostgreSQL 18 pg_restore](https://www.postgresql.org/docs/18/app-pgrestore.html)
- [PostgreSQL 18 pg_dumpall](https://www.postgresql.org/docs/18/app-pg-dumpall.html)
- [PostgreSQL 18 SQL dump and backup documentation](https://www.postgresql.org/docs/18/backup-dump.html)

### 2.4 Phygital recovery unit

A complete recovery must preserve and reconcile:
1. Database schema, records, relationships, indexes, constraints, functions, policies and required extensions.
2. Users and stable internal identities; provider issuer/subject mappings; memberships and mandate references (never export password secrets).
3. Private file objects, metadata, object versions, checksums, tenant/resource scope and evidence lineage.
4. Audit history, event identities, idempotency keys, correction/reversal/supersession and source provenance.
5. Versioned reference data, units, currency rules, commodity/destination rules and policy versions.
6. Application source, lockfiles, build/deploy configuration, infrastructure definitions and migrations.
7. Secrets recovery/rotation procedures, DNS/domain, certificates, external integration references and service identities.
8. Operational runbooks, contacts, incident decisions, recovery logs and evidence of independent review.

### 2.5 Minimum synthetic restore tests

- Restore database into a clean independent PostgreSQL environment.
- Restore private object files from independent copies; compare checksums and object counts.
- Reconcile all foreign keys, entity counts, audit lineage, tenant scopes and file references.
- Confirm custom roles/grants/RLS are recreated safely; reset secrets and credentials rather than restoring old plaintext credentials.
- Verify no cross-tenant exposure after restore.
- Rebuild application from a clean commit and reconnect using new environment-scoped secrets.
- Reconcile provider events/idempotency state so that a restore does not replay external side effects.
- Measure actual restore time and data-loss window; compare to RPO/RTO only after those targets are approved.
- Have a reviewer other than the backup operator inspect evidence.
- Repeat restore after a schema change and after a provider-exit scenario.

**Status:** INCOMPLETE — NOT SCORABLE. Provider backup facts are documented, but no integrated backup plan, independent copy, restore rehearsal, RPO/RTO or accountable recovery owner exists.

## 3. TC-13 — Offline/local persistence and synchronisation

### 3.1 Candidate patterns

**Pattern A — online-first with bounded local draft queue**
- Keep the product online-first.
- Permit only explicitly allow-listed drafts/observations to be saved locally.
- Store minimal structured records in IndexedDB; queue each operation with a unique client ID, schema version, actor/device context and original capture time.
- Synchronise when the app is open/reconnected, with idempotency, current authorization checks and clear pending/accepted/rejected/needs-review status.
- This is the lowest-complexity baseline to assess; it is not a technology selection.

**Pattern B — PWA service worker + IndexedDB + background sync enhancement**
- Cache the application shell and limited non-sensitive static resources.
- Use IndexedDB for bounded structured drafts and a durable client outbox.
- Use Background Sync only as a progressive enhancement; always provide foreground/reconnect/manual sync fallback.
- Do not cache restricted documents or sensitive participant data without explicit privacy/security approval.

**Pattern C — native/local client**
- Consider only if validated device/network conditions prove that browser persistence is inadequate.
- Requires a separate assessment of device management, encryption, update/distribution, multi-platform support, backup, remote wipe, local database and support burden.
- No native client is currently justified by source evidence.

### 3.2 Browser platform facts

- IndexedDB is designed for significant amounts of structured client-side data, including files/blobs; it is transactional but is not a substitute for the authoritative server database.
- Browser-origin storage is best-effort by default. Browsers may evict it under storage pressure or users may clear it; private browsing commonly deletes data when the session ends.
- StorageManager.persist() requests persistent storage but the browser may grant or deny it. The app must inspect quota/usage and handle QuotaExceededError.
- Background Sync API has limited availability and is not supported by some widely used browsers. Current compatibility data indicates it is not supported in Safari/iOS Safari and Firefox; therefore the Phygital workflow cannot rely on it as the only sync mechanism.
- Service workers and Background Sync require secure contexts (HTTPS).

Official sources:
- [MDN IndexedDB API](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API)
- [MDN storage quotas and eviction criteria](https://developer.mozilla.org/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria)
- [MDN StorageManager.persist()](https://developer.mozilla.org/en-US/docs/Web/API/StorageManager/persist)
- [MDN Background Synchronization API](https://developer.mozilla.org/en-US/docs/Web/API/Background_Synchronization_API)
- [MDN ServiceWorker sync event](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/sync_event)

### 3.3 Mandatory Phygital offline rules

- Offline actions are explicitly allow-listed; no offline grant of authority, commercial acceptance, payment completion, dispatch, custody, release, shipment or external verification.
- Every queued operation is pending until accepted by the server; local UI never labels it verified/final.
- Server rechecks current membership, role, mandate, scope, evidence state, quantity, transaction state and phase at sync.
- Client operation IDs and idempotency are required; retries cannot create duplicate business effects.
- Conflicts are domain-specific: reject, limited merge or human review. Never silently last-write-wins material facts.
- Preserve capture time, server receipt time, actor, device context, source and sync outcome.
- Shared/lost-device and logout controls minimize/expire local data; browser storage is not treated as a secure vault.
- Queue size and attachment storage are bounded; files upload with checksum/resume/quarantine.
- Stale/revoked device or authority context is rejected/quarantined; cached JWT or old mandate does not grant permission.
- Local persistence failure/eviction must be visible; do not tell users a record is saved if the browser rejected it.

### 3.4 Minimum synthetic offline tests

1. Capture allow-listed draft offline; state remains pending.
2. Restart browser/app and verify queued data survives or clearly reports loss.
3. Trigger storage pressure/quota exceeded and verify graceful error and recovery.
4. Run on Chrome/Edge, Safari/iOS Safari and Firefox; confirm foreground sync fallback.
5. Duplicate replay and out-of-order dependencies are idempotent and safely sequenced.
6. Revoke membership/mandate while device is offline; sync denies or quarantines.
7. Change batch/order/quote state on server; stale action is rejected or reviewed.
8. Simulate clock skew; server time controls expiry and acceptance.
9. Interrupt upload; verify resume, hash and quarantine.
10. Test shared-device logout, browser data clearing and lost-device response.
11. Confirm no forbidden commercial/physical state can be created offline.
12. Test accessibility and user comprehension of pending, accepted, rejected and needs-review statuses.

**Status:** INCOMPLETE — NOT SCORABLE. No site/device connectivity evidence, local data classification approval, browser matrix, implemented queue or test results exist.

## 4. TC-24 — Data import/export, portability and exit

### 4.1 Candidate export patterns

**Pattern A — PostgreSQL native dump + object export**
- Use pg_dump custom/directory archive for the database.
- Export cluster globals/roles separately where source-provider permissions allow.
- Export object blobs and object metadata separately.
- Include schema version, export time, database version, extension list, object manifest, counts, hashes and restore instructions.
- Strong for compatible PostgreSQL-to-PostgreSQL moves; incomplete unless identity, provider configuration and file objects are also captured.

**Pattern B — versioned domain-level export package**
- Produce a documented, schema-versioned export using JSONL/CSV/JSON for domain records and a manifest for files.
- Preserve stable IDs, relationships, tenant boundaries, provenance, evidence classes, timestamps, commercial snapshots, audit/event history, revocation/supersession and correction/reversal semantics.
- Include file objects with SHA-256, byte size, media type, metadata, object ID and related entity ID.
- Use deterministic export ordering and a reconciliation report.
- This is more portable across vendors but requires design, maintenance and import validation.

**Pattern C — provider-native APIs/bulk exports**
- Use provider database/storage export APIs where available.
- Confirm completeness, pagination, throttling, retention, format, fees, and treatment of roles/policies, file objects, deleted/revoked data and audit logs.
- Provider exports are an input to the portable package, not a substitute for an independent import test.

### 4.2 Required export manifest

Each export package should include:
- unique export ID, creation time, source environment/provider/region and schema version;
- source commit and migration versions;
- PostgreSQL major version, extensions and required configuration;
- per-table record counts, stable ID strategy and relationship validation;
- per-object path/ID, byte size, media type, SHA-256, metadata and related entity references;
- identity issuer/subject to internal-user mapping (no credentials/passwords);
- audit/event history, idempotency keys, corrections/reversals and source provenance;
- retention/deletion/legal hold status;
- encryption and signing metadata, access scope and expiry;
- import instructions, compatibility caveats and reconciliation output.

### 4.3 Minimum synthetic portability tests

1. Export one complete synthetic tenant and all linked entities/files.
2. Import into a clean independent PostgreSQL environment and independent object store.
3. Compare counts, relationships, stable IDs, hashes and audit lineage.
4. Verify no cross-tenant data leakage in export jobs/packages.
5. Preserve accepted quote/order snapshots, allocations and movement distinctions.
6. Preserve seller/exporter mandate references, evidence class and revocation/supersession history.
7. Rebuild policy/access mappings without transferring secret credentials.
8. Repeat export/import and compare deterministic reconciliation.
9. Test partial/corrupt export detection and safe re-run.
10. Measure labour, downtime, transfer cost, transformation and exit complexity.
11. Verify retention/deletion and secure destruction of export packages.
12. Produce an exit runbook with sequencing, parallel run, rollback and accountable owner.

**Status:** INCOMPLETE — NOT SCORABLE. No complete database-plus-object export/import or provider exit has been demonstrated.

## 5. Cross-component recovery and offline decision gates

Before real participant data:
- approved data inventory/classification, privacy assessment and retention schedule;
- approved device/offline data scope and shared-device controls;
- tested authorization, private storage and local queue security;
- named backup/restore, incident and support owners;
- independent encrypted backup copy and documented recovery path.

Before production:
- approved RPO/RTO and retention;
- complete restore rehearsal across database, files, identity mappings, configuration and audit;
- independent review of restore evidence and remediation;
- tested export/import into independent infrastructure;
- incident/compromise response including key rotation, account revocation and provider exit.

Before live commercial/export workflows:
- legal, seller/exporter, facility, product, custody, payment, logistics and route gates pass independently;
- offline sync cannot bypass those gates;
- operational recovery and record reconstruction are proven.

## 6. Candidate disposition

- TC-12 managed PITR + independent encrypted exports: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-12 self-managed pg_dump/pg_restore pipeline: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-13 bounded online-first local draft queue: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-13 PWA + Background Sync enhancement: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-13 native/local client: **DEFERRED — NO EVIDENCE JUSTIFIES IT YET**.
- TC-24 native DB + object export: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-24 versioned domain export package: **EVIDENCE STARTED — NOT SCORABLE**.
- TC-24 provider-native export APIs: **EVIDENCE STARTED — NOT SCORABLE**.

No recovery product, offline client or export pipeline is selected. No RPO/RTO or retention target is approved.

## 7. Next actions

1. Define the full recovery inventory and propose RPO/RTO only after Phase 0 operating evidence.
2. Decide minimum independent backup architecture after database and storage candidate decisions are better understood.
3. Obtain exact retention/deletion/legal hold rules for physical-digital evidence.
4. Build a browser/device matrix and site connectivity study before expanding offline capability.
5. Define versioned export manifest and synthetic export/import tests before selecting provider-specific APIs.
6. Add candidate records to TSBBF workbook; keep numeric scores blank until evidence is complete.

**No backup provisioning, restore execution, real offline participant capture, production export, real-data transfer or provider exit is authorised by this snapshot.**
