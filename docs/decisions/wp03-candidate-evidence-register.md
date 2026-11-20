# WP-03 candidate evidence register

**Review date:** 20 November 2026  
**Purpose:** Consolidated index of component-level candidates and the first public-source evidence snapshots.  
**Status:** Evidence register only. No candidate is scored, shortlisted, selected, procured, provisioned or tested unless a separate record explicitly says so.

## 1. How to read this register

- Candidate entries identify credible alternatives or architecture patterns for evidence collection. They are not a shortlist.
- A provider bundle does not collapse separate component decisions. For example, choosing a database product does not automatically select its Auth, Storage, hosting or worker services.
- Some patterns are complementary rather than mutually exclusive. PostgreSQL RLS, an application policy module and a relationship/policy engine have different enforcement roles.
- **EVIDENCE STARTED** means public documentation was inspected and recorded. It does not mean contractual, legal, security, cost, operational or synthetic-test evidence is complete.
- **UNASSESSED** means only a candidate class is recorded, without enough provider-specific evidence to assess it.
- **DEFERRED** means no current source evidence justifies progressing that option.
- All TSBBF numeric scores remain blank. No candidate is eligible for a weighted score while critical evidence is unknown.

## 2. Candidate register

| Component | Candidate / pattern | Evidence snapshot | Status | Main outstanding evidence |
|---|---|---|---|---|
| TC-01 Frontend | Next.js App Router | [Frontend/runtime/worker snapshot](frontend-runtime-worker-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | Developer Guide source, cache isolation, hosting portability, accessibility, SEO, workload |
| TC-01 Frontend | React SPA + Vite | Same | EVIDENCE STARTED — NOT SCORABLE | Public SEO/SSR strategy, PWA/device matrix, low-bandwidth tests, API boundary |
| TC-02 Runtime | Next.js Node.js server / BFF | Same | EVIDENCE STARTED — NOT SCORABLE | Server-action/API boundaries, cache isolation, runtime limits, portability |
| TC-02 Runtime | NestJS 12 | Same | EVIDENCE STARTED — NOT SCORABLE | Node 24/26 compatibility not explicit in current matrix, skills, TCO, runtime tests |
| TC-02 Runtime | Express 5 | Same | EVIDENCE STARTED — NOT SCORABLE | Application conventions, validation/auth coverage, dependency lifecycle, operations |
| TC-03 Database | Supabase PostgreSQL | [Database snapshot](database-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | DPA/processor terms, region, object recovery, RLS/pool tests, PITR/TCO |
| TC-03 Database | Neon PostgreSQL | Same | EVIDENCE STARTED — NOT SCORABLE | Contracting entity/region, restore/exit, compute behaviour, extensions, TCO |
| TC-03 Database | Render PostgreSQL | Same | EVIDENCE STARTED — NOT SCORABLE | DPA/region, access hardening, recovery/export, combined workspace/app TCO |
| TC-04 Identity | Supabase Auth | [Identity snapshot](identity-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | Session revocation, DPA/region, MFA/SSO cost, identity export |
| TC-04 Identity | Clerk | Same | EVIDENCE STARTED — NOT SCORABLE | US-only residency acceptability, DPA/subprocessors, MRU/B2B costs, identity export |
| TC-04 Identity | Auth0 | Same | EVIDENCE STARTED — NOT SCORABLE | Exact B2B/private-cloud quote, region/SKU, session feature entitlements, DPA |
| TC-04 Identity | Keycloak | Same | EVIDENCE STARTED — NOT SCORABLE | Named operator, HA/patch/backup/incident plan, supported release, full TCO |
| TC-05 Authorisation | Application policy module + PostgreSQL RLS | [Authorisation snapshot](authorization-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | 024-A mapping, RLS bypass/pool tests, endpoint coverage, independent review |
| TC-05 Authorisation | OpenFGA | Same | EVIDENCE STARTED — NOT SCORABLE | Tuple sync/revocation consistency, model coverage, operating burden, cost |
| TC-05 Authorisation | OPA | Same | EVIDENCE STARTED — NOT SCORABLE | Rego skills, policy bundle control plane, decision-log privacy, stale-policy tests |
| TC-06 Storage | Supabase Storage | [Storage snapshot](storage-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | Object backup, signed URL revocation, access audit, DPA/region, export |
| TC-06 Storage | Cloudflare R2 | Same | EVIDENCE STARTED — NOT SCORABLE | APAC residency guarantee, no Object Lock, data access audit, DPA/exit |
| TC-06 Storage | Amazon S3 | Same | EVIDENCE STARTED — NOT SCORABLE | Region/DPA, IAM/KMS complexity, Object Lock policy, full cost and exit |
| TC-07 Workers | PostgreSQL transactional outbox + worker | [Frontend/runtime/worker snapshot](frontend-runtime-worker-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | Polling/locking, retry/DLQ, named operator, workload and failure tests |
| TC-07 Workers | Supabase Queues (pgmq) + consumer | Same | EVIDENCE STARTED — NOT SCORABLE | Public Alpha maturity, consumer runtime, delivery/idempotency, limits |
| TC-07 Workers | Cloudflare Queues + Workers | Same | EVIDENCE STARTED — NOT SCORABLE | At-least-once effects, 128 KB/retention/runtime limits, jurisdiction, outbox |
| TC-07 Workers | Render worker + Key Value/BullMQ or Workflows | Same | EVIDENCE STARTED — NOT SCORABLE | Workspace/service TCO, Workflows maturity, queue persistence and recovery |
| TC-09 Hosting | Vercel | [Hosting/CI snapshot](hosting-ci-candidate-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | Commercial plan, region, cache isolation, usage TCO, DPA/support |
| TC-09 Hosting | Cloudflare Pages/Workers | Same | EVIDENCE STARTED — NOT SCORABLE | Node compatibility, data locality, runtime limits, deploy retention, DPA |
| TC-09 Hosting | Render | Same | EVIDENCE STARTED — NOT SCORABLE | Pro workspace + service cost, region, scaling, support and data terms |
| TC-10 CI | GitHub Actions | Same | EVIDENCE STARTED — NOT SCORABLE | Actual repository-owner plan, workflow threat review, artifact retention, OIDC |
| TC-10 CI | Platform-native Git build/deploy | Same | EVIDENCE STARTED — NOT SCORABLE | Separation from full CI, evidence retention, protected release gates |
| TC-10 CI | Independent hosted/self-hosted CI | Same | UNASSESSED | Specific provider, isolation, OIDC, cost, maintenance and exit |
| TC-12 Recovery | Managed PITR + independent encrypted export | [Recovery/offline/portability snapshot](recovery-offline-portability-evidence-snapshot-2026-11-20.md) | EVIDENCE STARTED — NOT SCORABLE | Full database+object restore, independent copy, RPO/RTO, owner |
| TC-12 Recovery | Self-managed pg_dump/pg_restore pipeline | Same | EVIDENCE STARTED — NOT SCORABLE | Secure automation, globals/roles, object export, restore test, operator |
| TC-12 Recovery | Provider-native replication/backup suite | Same | EVIDENCE STARTED — NOT SCORABLE | Independent account/region, deletion protection, costs, full recovery |
| TC-13 Offline | Online-first bounded local draft queue | Same | EVIDENCE STARTED — NOT SCORABLE | Site/device connectivity, local data classification, eviction/revocation tests |
| TC-13 Offline | PWA + IndexedDB + Background Sync enhancement | Same | EVIDENCE STARTED — NOT SCORABLE | Browser support gaps, foreground fallback, storage privacy and device tests |
| TC-13 Offline | Native/local application | Same | DEFERRED — NOT JUSTIFIED | No validated requirement that browser-based bounded drafts are insufficient |
| TC-24 Portability | PostgreSQL native dump + object export | Same | EVIDENCE STARTED — NOT SCORABLE | Full identity/config/audit/file export, independent import and reconciliation |
| TC-24 Portability | Versioned domain-level export package | Same | EVIDENCE STARTED — NOT SCORABLE | Schema/version manifest, implementation cost, import/export acceptance |
| TC-24 Portability | Provider-native APIs/bulk exports | Same | EVIDENCE STARTED — NOT SCORABLE | Completeness, quotas, format, fees, deleted data and independent import |

## 3. P1 business-capability candidates

| Component | Candidate / pattern | Evidence snapshot | Status | Main outstanding evidence |
|---|---|---|---|---|
| TC-14 QR/public projection | Standard QR encoder + opaque token resolver | [P1 business-capability pack](../architecture/wp03-p1-business-capability-evidence-pack-01.md) | EVIDENCE STARTED — NOT SCORABLE | Token lifecycle, cache revocation, projection allow-list, physical anti-cloning limitations |
| TC-14 QR/public projection | Blockchain-backed public record | Same | DEFERRED | No demonstrated benefit over controlled resolver; separate privacy/correction/governance gate |
| TC-15 Notifications | Africa's Talking SMS | Same | EVIDENCE STARTED — NOT SCORABLE | Current quote, sender ID approval, DLR reliability, DPA, coverage and volume |
| TC-15 Notifications | Twilio SMS | Same | EVIDENCE STARTED — NOT SCORABLE | Local sender route/price, carrier fees, DPA, coverage and volume |
| TC-15 Notifications | Amazon SES email | Same | EVIDENCE STARTED — NOT SCORABLE | Domain reputation, region, DPA, bounce/complaint and deliverability tests |
| TC-16 Payment status | CBK-authorized PSP/bank adapter; directory candidates include Safaricom, Cellulant, Pesapal, Direct Pay, Paystack and dLocal | Same | EVIDENCE STARTED — NOT SCORABLE | Exact licence scope, seller account, cross-border settlement, FX, direct buyer-to-seller contract and webhooks |
| TC-18 Lab/inspection | KENAS-scope-verified laboratory with controlled manual intake | Same | EVIDENCE STARTED — NOT SCORABLE | Specific lab, commodity/method scope, validity, sample chain and report verification |
| TC-18 Lab/inspection | Provider portal/API integration | Same | EVIDENCE STARTED — NOT SCORABLE | Provider identity, API/data contract, authentication, corrections and revocation |
| TC-20 Analytics | Governed SQL views and controlled exports | Same | EVIDENCE STARTED — NOT SCORABLE | Metric owners/definitions, data quality, access and privacy review |
| TC-20 Analytics | Apache Superset | Same | EVIDENCE STARTED — NOT SCORABLE | Hosting/operator, tenant isolation, read-only DB and support burden |
| TC-20 Analytics | Metabase Open Source / Cloud / Pro | Same | EVIDENCE STARTED — NOT SCORABLE | AGPL/embedding licence, multi-tenant security, SSO/audit tier and TCO |

## 4. Consolidated blockers to scoring

These apply across multiple components and prevent honest weighted scoring:

1. **Developer Guide v0.1:** canonical source remains unrecovered. Candidate A cannot be scored as a complete bundle until recovered or formally dispositioned.
2. **Phase 0 workload:** users, organisations, concurrency, listings, batches, files, connectivity, retention, job volumes, staffing and support remain unvalidated. Provider price snippets cannot become comparable TCO.
3. **Legal/privacy:** current DPAs, contracting entities, subprocessors, data location, cross-border transfers, deletion, support access and incident terms remain outstanding for the exact plans/SKUs.
4. **Operating ownership:** named people/roles, skills, support hours, patching, backup/restore, incident response and escalation are not validated.
5. **Recovery:** no integrated database + object + identity/configuration restore has been demonstrated; RPO/RTO are not approved.
6. **Security tests:** candidate-specific tenant isolation, session revocation, RLS bypass, signed URL, malware, cache, webhook and worker tests have not been executed.
7. **Commercial terms:** exact plan, seats, MAU/MRU, compute, storage, egress, support, overage, suspension, tax and exit costs require verification at decision time.
8. **Synthetic spike:** no candidate spike is authorised or executed. The 18-test plan remains a prepared plan only.
9. **Independent review:** no candidate score or technology recommendation has received the required independent review/decision-owner approval.

## 4. Decision-readiness rule

A candidate may move from EVIDENCE STARTED to **READY FOR SCORING** only when:
- source requirements and versions are reconciled;
- current legal/commercial/security/privacy evidence is linked;
- region and subprocessor position is known;
- workload and operator assumptions are comparable;
- backup, restore, portability and exit are evidenced;
- critical limitations and mitigations are owned;
- acceptance tests are defined and any required synthetic tests are separately authorized.

A candidate may move from READY FOR SCORING to **SCORED** only after every critical criterion has evidence and a TSBBF scorecard is completed. A high score is not approval. Approval remains with the authorised decision owner through the relevant ADR.

## 5. Current overall disposition

- Candidate inventory and public-source evidence have advanced across the P0 components.
- No component candidate has been shortlisted or selected.
- No numeric TSBBF score has been entered.
- ADR-0001 and ADR-0002 remain OPEN.
- Developer Guide v0.1 recovery/disposition remains OPEN.
- Phase 0 workload/TCO values remain UNKNOWN.
- Production provisioning, migrations, real participant data, live integrations and live trade remain unauthorized.
