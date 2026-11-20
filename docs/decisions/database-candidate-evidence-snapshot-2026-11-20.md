# TC-03 relational database — initial provider evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or selection.  
**Currency:** USD, public list prices as displayed on source pages on the evidence date. Taxes, FX, credits, add-ons, support and actual workload costs are not modelled.

## 1. Purpose and scope

This is the first provider-specific evidence record under WP-03 for TC-03 (relational transaction database). It compares three credible managed PostgreSQL candidates/patterns surfaced by the current Phygital source set:

1. Supabase managed PostgreSQL as part of its integrated backend platform.
2. Neon managed PostgreSQL as a database-centric/serverless Postgres service.
3. Render managed PostgreSQL as part of an application/worker hosting platform.

The comparison is component-level. It does not assume that the bundled Auth, Storage, Functions, hosting, queue or deployment features should be adopted with the database. Those remain separate component decisions.

The three candidates are not yet fully assessed against the same validated workload, data-processing requirements, recovery objectives or operating model. No TSBBF score is assigned.

## 2. Governing requirements

The candidate must satisfy TC-03 and TDR-04, TDR-05, TDR-09, TDR-13, TDR-16 and TDR-17, including:
- relational integrity and exact transaction boundaries;
- atomic reservation and concurrent no-over-allocation;
- organisation/tenant isolation and safe RLS/service-role boundaries;
- append-only audit and movement lineage, correction/reversal semantics;
- controlled units, quantity precision and immutable accepted commercial snapshots;
- migration versioning and reproducible clean-install/upgrade paths;
- backup/restore for database plus separately stored objects/metadata;
- portable export/import, independent restore and credible exit.

The database must not make Migration 001 or Migration 002 executable/approved. Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED.

## 3. Public-source evidence snapshot

### 3.1 Supabase managed PostgreSQL

**Product shape**
- Every Supabase project has a full PostgreSQL database; Supabase documents Auth, Storage, Realtime and Edge Functions as services built around that database.
- A project is deployed to one primary region. Official region materials list APAC Singapore and multiple US, European and other APAC regions; no Kenya region is listed in the retrieved current region list.
- The database, Auth service and Storage objects are described as hosted in the chosen region. This does not mean all account, support, telemetry, CDN and subprocessor processing remains there.

**Public price/allowances observed**
- Pro plan starts at **$25/month**.
- Pro includes 8 GB disk per project, 250 GB egress, 250 GB cached egress, 100 GB file storage, daily database backups retained 7 days, and $10/month compute credits.
- The pricing page shows a Micro database compute size at $10/month, 1 GB RAM, 60 direct connections and 200 pooled connections; the first Micro instance is covered by the paid-plan compute credit.
- Pro PITR is a separate add-on. The current backup documentation lists approximately **$100/month for a 7-day PITR retention window**, with 14- and 28-day options priced higher.
- Free projects have no automatic backups or PITR and may be paused after one week of inactivity; free plan is not an equivalent production baseline.

**Backup and data-location caveats**
- Daily backups do not include objects stored through the Storage API. Database backup includes object metadata, not the object blobs; deleted objects after the backup are not restored by a database restore. File/object recovery must therefore be designed and tested separately.
- The official Data Residency and Transfers FAQ says the selected AWS region hosts primary Postgres, Auth and Storage objects/backups, but identifies out-of-region processing for account/billing information, global support access, telemetry/logs and globally distributed content delivery, depending on configuration.
- That FAQ includes a marketplace-specific processor statement identifying Supabase, Inc. as primary data processor for marketplace activities, with Supabase Pte. Ltd. supporting operations. This must be clarified against the current DPA and legal entity/contracting documents before any participant data is processed.
- Region selection is a data-location control, not proof of compliance with Kenyan law or destination-market requirements.

**Initial assessment observations**
- Strength: the integrated Postgres/Auth/Storage platform may reduce the number of separate services and integration seams.
- Risk/unknown: bundle coupling, role/service-key exposure, plan-specific feature/usage limits, PITR cost, object-backup separation, and the exact legal/data-processing posture for marketplace activity require further evidence.
- Required test: independently demonstrate export/restore of database plus Storage objects, metadata, RLS policies, roles and audit lineage; test RLS under pooled connections and privileged service contexts.

Official sources:
- [Supabase pricing](https://supabase.com/pricing)
- [Supabase database overview](https://supabase.com/docs/guides/database/overview)
- [Supabase available regions](https://supabase.com/docs/guides/platform/regions)
- [Supabase database backups](https://supabase.com/docs/guides/platform/backups)
- [Supabase data residency and transfers FAQ, version 1 — 6 October 2026](https://supabase.com/legal/privacy-resources/data-residency-and-transfers-faq)
- [Supabase security](https://supabase.com/security)

### 3.2 Neon managed PostgreSQL

**Product shape**
- Neon provides managed PostgreSQL with separation of storage and compute, branching, autoscaling and scale-to-zero. PostgreSQL compatibility does not remove the need to test extensions, connection patterns, RLS and restore/exit behaviour.
- The current official plans page is dated 12 November 2026. The official regional latency dashboard currently lists Singapore, Sydney, Frankfurt, London, São Paulo and several US regions for Neon Postgres; it is a useful current regional signal, not a substitute for confirming region availability in the project-creation flow and contractual data-location terms.
- Neon’s security page identifies Neon as part of the Databricks Platform and describes AWS/Azure infrastructure, TLS 1.2+, AES-256 at rest, SOC 2 Type II, ISO 27001/27701 and DPA availability. Obtain current Trust Center documents and exact service contracting details.

**Public price/allowances observed**
- Free: $0/month; 1 GB storage per project, 100 compute-unit hours/project, 5 GB public network transfer, scale-to-zero after 5 minutes, and up to 6 hours of instant-restore history (with a 1 GB change-history cap).
- Launch: pay-as-you-go; compute listed at **$0.106 per CU-hour**, storage **$0.35/GB-month**, 500 GB public network transfer/project included, and instant-restore history up to 7 days, with history storage billed at **$0.20/GB-month**.
- Scale: pay-as-you-go; compute listed at **$0.222 per CU-hour**, storage **$0.35/GB-month**, 500 GB public network transfer/project included, and instant-restore history up to 30 days, with history storage billed at **$0.20/GB-month**.
- Paid plans have no monthly minimum on the current plans page. Actual costs depend on compute hours/size, storage, history retention, branches, network transfer and any bundled services.

**Backup/security/operating caveats**
- Neon describes daily encrypted backups across multiple availability zones with automated integrity validation on its security page; this public summary is not a substitute for the exact plan's restore and retention terms or a customer-run restore test.
- The plans page distinguishes instant restore/history windows from snapshots and their storage costs. A database PITR/branch restore is not a complete application backup: separately stored files, metadata, secrets, identity records and configuration need their own export/recovery path.
- Current product materials describe a broader backend set (including managed Better Auth, Functions, Object Storage and Realtime beta). Treat these as separate component options and verify availability/GA status, terms and data location individually; do not infer that choosing Neon Postgres selects the rest of its backend.
- The recent platform/brand evolution and Databricks ownership make current contracting entity, product naming, DPA, subprocessor list, service-specific region options and long-term portability explicit diligence items.

**Initial assessment observations**
- Strength: PostgreSQL-centric database service with branching and usage-based compute may be attractive for controlled development, migration rehearsal and scale-to-zero workloads.
- Risk/unknown: scale-to-zero cold-start impact, predictable production cost under continuous activity, exact restore and independent export completeness, legal/subprocessor terms, and integrated backend maturity/GA status require validation.
- Required test: measure wake latency and transaction latency under the proposed app runtime; exercise branch-based migration rehearsals; export/import schema, data, roles, policies and extensions into independent PostgreSQL.

Official sources:
- [Neon plans and pricing](https://neon.com/docs/introduction/plans)
- [Neon security and compliance](https://neon.com/security)
- [Neon regional latency dashboard](https://neon.com/demos/regional-latency)
- [Neon restore/history-window documentation](https://neon.com/docs/postgres/backup-restore/history-window)
- [Neon product update — 10 November 2026](https://neon.com/blog/whats-new-with-the-neon-backend)

### 3.3 Render managed PostgreSQL

**Product shape**
- Render provides managed PostgreSQL and also offers web services, private services, background workers, cron jobs and private networking. It may therefore support a cohesive application + worker + database deployment, but this bundle must be compared against separate service choices.
- Officially listed regions include Oregon, Ohio, Virginia, Frankfurt and Singapore. Existing databases cannot simply be moved to a different region; a new database and migration are required.
- New Render Postgres instances can use supported PostgreSQL major versions 13–18 in the current connection guide. Verify extension availability and exact engine version at provisioning.

**Public price/allowances observed**
- Flexible Postgres compute plans are separate from storage. Current public prices include:
  - 0.1 CPU / 256 MB RAM: **$6/month**;
  - 0.5 CPU / 1 GB RAM: **$19/month**;
  - 1 CPU / 2 GB RAM: **$40/month**;
  - 1 CPU / 4 GB RAM: **$55/month**;
  - 2 CPU / 4 GB RAM: **$75/month**;
  - 2 CPU / 8 GB RAM: **$100/month**.
- Storage is listed at **$0.30/GB-month**, with 1 GB SSD included.
- Free Postgres has 256 MB RAM and 100 connections, but no PITR or managed logical backup. It is not an equivalent production/recovery baseline.
- Paid database instances provide PITR; recovery window is 3 days on Hobby workspace and 7 days on Pro or higher. Logical exports are retained for 7 days after creation.

**Security/region/recovery caveats**
- Render documents AES-256 encryption at rest for databases and backups, and TLS for external connections.
- External database access is open to any IP by default if credentials are valid; IP allow-listing or disabling external access must be explicitly configured. Same-region Render services can use private networking.
- Internal connections support TLS optionally using self-signed certificates; this must be configured deliberately.
- The region list includes Singapore and Frankfurt but no Kenya region. Render states that existing services/databases cannot change region in place.
- Deleting a database removes its backups/snapshots; export and independent retention are required before deletion.
- Hobby/Pro workspace charges are separate from database compute and storage; do not treat the $6/$19 compute price as the complete workspace/application TCO.

**Initial assessment observations**
- Strength: managed PostgreSQL, transparent compute/storage separation, IP allow-list controls, private networking and colocated worker/application options.
- Risk/unknown: minimum paid compute is modest, workspace costs and network charges add to TCO, default public access needs hardening, region changes require migration, and storage/file recovery remains separate.
- Required test: verify external-access restrictions, private network/TLS configuration, RLS/transaction behaviour, restore and independent export; assess combined database + web/API + worker + bandwidth costs.

Official sources:
- [Render pricing](https://render.com/pricing)
- [Render Postgres creation and connection](https://render.com/docs/postgresql-creating-connecting)
- [Render regions](https://render.com/docs/regions)
- [Render Postgres recovery and backups](https://render.com/docs/postgresql-backups)
- [Render private networking](https://render.com/docs/private-network)
- [Render Postgres compute plans](https://render.com/docs/compute-plans)

## 4. Initial comparison — facts, not scores

| Dimension | Supabase Postgres | Neon Postgres | Render Postgres |
|---|---|---|---|
| Core model | Managed Postgres bundled with Auth/Storage/Realtime/Functions | Serverless managed Postgres with separated compute/storage and branching | Managed Postgres within app/worker hosting platform |
| Closest listed region for Kenya | Singapore | Singapore | Singapore |
| Public paid entry reference | Pro $25/mo; first Micro compute instance offset by $10 credits | Launch pay-as-you-go; $0.106/CU-hour plus storage/other usage | $6/mo 0.1 CPU/256 MB compute plus storage; workspace plan separate |
| Backup/PITR reference | Pro daily backups 7 days; PITR add-on ~ $100/mo for 7 days | Free 6h; Launch 7d; Scale 30d; history storage billed | Paid PITR 3d Hobby / 7d Pro+; logical export retention 7d |
| Main potential advantage | Integrated backend reduces service count | Branching, scale-to-zero and usage-based database compute | Co-location/private networking with app and workers |
| Main diligence risk | Bundle coupling, separate object recovery, marketplace-specific processor wording | Brand/platform evolution, compute cold starts/cost, service-specific terms | Low-end capacity, public-access default, workspace/region migration costs |
| Current TSBBF score | UNKNOWN | UNKNOWN | UNKNOWN |

**No weighted ranking is calculated.** Price references are list-price snapshots, not comparable total cost estimates. Supabase's Pro plan, Neon's pay-as-you-go Launch and Render's compute-only database price do not provide equivalent service levels, storage, support, recovery, egress or application services.

## 5. Evidence gaps before any score or shortlist

### 5.1 Legal, privacy and data location
- Obtain current DPA, contracting entity, subprocessor list, incident/breach notification commitments, deletion/retention terms and support-access controls for each candidate.
- Confirm lawful data location and cross-border transfer basis for Kenyan participants and relevant destination-market counterparties.
- Clarify Supabase's marketplace-specific processor wording with its legal team and DPA; do not infer compliance or non-compliance from the FAQ alone.
- Confirm exact project-region availability, region migration process and whether backups, logs, support and object storage share the same location commitments.

### 5.2 Technical and operational
- Verify supported PostgreSQL versions, required extensions, connection pooler behaviour, transaction isolation, advisory locks, row-level security, role/grant semantics and privileged bypass paths.
- Execute schema/constraint tests only in an approved synthetic environment; Migration 001 remains HOLD and must not be used as an approved migration.
- Test atomic allocation, deadlock/retry, concurrent updates, pooled connection tenant context and audit immutability.
- Test backup/restore, point-in-time recovery, independent logical export/import and file/object recovery.
- Determine whether snapshots/PITR include all needed database objects, roles, extensions, policies and configuration; record exclusions.
- Obtain support SLA, availability terms, maintenance windows, incident communications and lifecycle/deprecation commitments.

### 5.3 Commercial/TCO
- Rebuild low/base/high 12/24/36-month estimates only after Phase 0 validates users, concurrency, data growth, file sizes, bandwidth, retention, job volume and operating capacity.
- Include app/API/worker hosting, database compute/storage, backup/PITR, object storage, egress, logs, support, migration labour, maintenance, incident response and exit.
- Verify price/quotas on the exact region/plan at decision time; record retrieval date and currency.
- Treat free tiers as test-only unless a separate documented risk decision supports a bounded pilot.

## 6. Candidate disposition

- Supabase: **EVIDENCE STARTED — NOT SCORABLE**.
- Neon: **EVIDENCE STARTED — NOT SCORABLE**.
- Render: **EVIDENCE STARTED — NOT SCORABLE**.

The evidence is sufficient to establish credible candidates and identify material differences, but not to rank them. The TSBBF workbook remains blank. No database provider is shortlisted or approved.

## 7. Next actions

1. Obtain the complete current DPA/subprocessor/region terms for the three candidates.
2. Confirm supported PostgreSQL versions and extension compatibility against the Phygital logical model.
3. Add the three candidates as separate TC-03 workbook records with evidence references, leaving numeric scores blank.
4. Reconcile validated Phase 0 workload assumptions before calculating comparable TCO.
5. Seek separate authorization for a synthetic database spike only after the candidate evidence and Developer Guide source gap are dispositioned.

**No procurement, provisioning, migration execution, production database creation or real-data processing is authorised by this snapshot.**
