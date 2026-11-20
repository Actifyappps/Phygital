# WP-04 — Application topology assessment and conditional target shape

**Review date:** 20 November 2026  
**Related ADR:** ADR-0002 — Application topology (OPEN)  
**Decision status:** Assessment and proposed direction for authorised review only. No topology, framework, host, database, identity provider, storage service or runtime is approved by this document.

## 1. Executive assessment

The strongest source-supported direction for the controlled pilot is a **modular monolith with one authoritative relational transaction database, private object storage, replaceable integration adapters and a database-backed job/outbox pattern**. Keep one authoritative application repository and one primary application deployment by default. A separately deployed worker process may be introduced only where execution limits, reliability, isolation or operating evidence justify it; it must use the same governed repository and release controls.

This direction is consistent with Technical Development Manual v3.0, the staged pilot in Concept Paper v1.1 and AADDG v1.0. It is a logical architecture recommendation, not a vendor or framework selection. ADR-0002 remains OPEN pending authorised decision, workload validation, candidate evidence and independent review.

The current source set does not justify microservices, multiple operational databases, a mandatory message broker, a service mesh, event sourcing, blockchain infrastructure, live IoT bridges or provider-led escrow.

## 2. Source authority and constraints

| Source | Topology-relevant statement | Constraint |
|---|---|---|
| Concept Paper v1.1 | Controlled pilot: one commodity, one hub, limited producers and buyers; prove supply → enquiry → quote → order → documents → shipment/payment tracking | Site, participants, route, commodity, buyer and partners remain unconfirmed; no numeric load target |
| Technical Development Manual v3.0, sections 1 and 3 | Explicit modular-monolith-first; one well-structured backend application and relational database; add queues/microservices only when operational evidence justifies them | Supporting implementation plan, not production approval |
| Technical Development Manual v3.0, section 3.1 | Next.js/React/TypeScript frontend; one backend framework (NestJS or Express); PostgreSQL; private S3-compatible object storage; established authentication provider; database-backed job pattern; Redis/RabbitMQ optional | Candidate stack only; do not build parallel NestJS and Express implementations |
| Technical Development Manual v3.0, section 3.2 | Web/API layer → authentication/authorization → modular backend → PostgreSQL/private storage/background jobs → replaceable external integration adapters | Logical diagram, not final deployable boundaries |
| AADDG v1.0 | One authoritative GitHub repository, one primary deployment and one authoritative backend by default; extra runtimes/services require documented reason and ownership | Does not force Supabase or Vercel; alternatives remain open |
| TSBBF v1.0 | Component-level, evidence-backed build/buy/reuse decisions and a credible exit path | No provider or framework may be selected from convenience alone |
| 024-A–G | Server-side authorization, explicit authority/mandates, workflow invariants, stable contracts, private evidence, security and acceptance controls | Requirements are not proof of implementation |
| 018-A sponsor decisions D-01–D-07 | Platform coordinator only; seller/exporter distinction; hub service-only; one accepted quote/order; allocation is reservation; direct buyer-to-seller payment | Approved with conditions; does not authorize live trade, custody or funds handling |
| Technology workload/TCO assumptions register | Users, concurrency, files, connectivity, retention, staffing, cost, RPO/RTO remain UNKNOWN | No quantitative capacity or cost comparison can be inferred |

Canonical references:
- [Concept Paper v1.1](https://app.notion.com/p/afe6808bcd9e837c8636810cb305d97f)
- [Technical Development Manual v3.0](https://app.notion.com/p/7ba6808bcd9e82be811781eca90484ce)
- [Phase 0 Work Map](https://app.notion.com/p/41b6808bcd9e8177867bc2a742d83e5e)
- [AADDG/TSBBF source verification record](../decisions/actify-technology-standards-source-verification.md)
- [Technology decision requirements baseline](technology-decision-requirements-baseline.md)
- [WP-03 candidate evidence register](../decisions/wp03-candidate-evidence-register.md)

## 3. Topology alternatives assessed

### Option A — Integrated full-stack managed platform

**Logical shape**
- One full-stack web framework handles public and authenticated web surfaces plus selected server-side application endpoints.
- Managed PostgreSQL, identity, object storage and deployment are bundled or tightly integrated.
- Background tasks use provider-native functions/queues or a separate worker only if necessary.

**Potential benefits**
- Fewer initial integration seams and simpler developer onboarding.
- Integrated authentication/database/storage policies may reduce glue code.
- Git-driven preview/deployment and managed operations can reduce infrastructure work.

**Risks and constraints**
- Bundling can couple identity, data, files, functions, region and deployment; each component still needs its own TSBBF assessment.
- A provider service-role key or privileged server function can bypass data-layer policies if misused.
- Object storage backups may be separate from database backups.
- Function/runtime limits and cache behaviour may be unsuitable for durable work or private multi-tenant pages unless tested.
- Exit may require replacement of multiple platform-specific APIs at once.
- The Developer Guide v0.1 canonical source remains unrecovered; its Next.js/Supabase/Vercel bundle is therefore provisional and not scoreable.

**Disposition:** Credible candidate bundle for comparison, not the selected logical topology.

### Option B — Modular monolith with a replaceable service boundary

**Logical shape**
- One responsive web product with six role-specific surfaces.
- One authoritative modular backend application, with explicit domain/application/integration modules and versioned API contracts.
- One PostgreSQL operational source of truth for transactional state.
- One private object store for file blobs; object metadata, ownership, evidence class and lineage remain in PostgreSQL.
- One established identity provider, with Phygital-owned memberships, mandates and authorization decisions.
- A database-backed job/outbox pattern initially; add a separate worker deployment or managed queue only when required.
- External payment, logistics, inspection/lab, notification and other provider interactions sit behind replaceable adapters.
- One GitHub repository; one primary app deployment by default. A worker may be a second deployment only with a documented operational reason.

**Potential benefits**
- Preserves atomic transactions for allocation, order snapshots, audit and inventory invariants.
- Avoids distributed transactions and cross-service authorization drift.
- Keeps provider-specific integrations replaceable.
- Matches the Manual v3.0's explicit modular-monolith-first recommendation.
- Can be deployed as a full-stack Node app or as a web client plus one API, without changing the logical domain boundaries.
- A separate worker process can scale/restart independently without creating separate domain microservices.
- Lower initial operating burden than a distributed architecture.

**Risks and constraints**
- Requires disciplined module boundaries and clear ownership of shared tables/transactions.
- A single backend can become a large codebase if modules are not enforced and tested.
- A single database is a shared failure domain; backups, restore and access controls must be robust.
- A worker deployment adds release/secret/monitoring responsibilities; queue/outbox semantics need careful idempotency.
- Independent scaling of modules is limited; if measured demand or isolation needs change, extraction may be considered later.

**Disposition:** Preferred logical direction for the controlled pilot, subject to authorised ADR-0002 approval and the closure conditions below. This does not select Next.js, NestJS, Express, Supabase, Neon, Render, Vercel or any other provider.

### Option C — Distributed microservices

**Logical shape**
- Separate deployable services for identity, organisations, catalogue, batch/inventory, quality, enquiries/quotes, orders, documents, payments, shipment, notifications and reporting.
- Each service may own separate data and communicate through synchronous APIs/events.

**Potential benefits**
- Independent scaling, deployment and failure isolation where service boundaries are stable and workload justifies them.
- Team autonomy and stronger isolation for genuinely separate trust/compliance domains.

**Risks and constraints**
- Adds network failure, service-to-service identity, distributed authorization, event consistency, idempotency, retries, observability and incident-response complexity.
- Cross-domain workflows such as accepted quotation → order snapshot → reservation require careful consistency and compensation.
- More infrastructure, deployments, secrets, databases, backups, on-call responsibilities and provider costs.
- No validated throughput, team structure or independent scaling requirement currently justifies this complexity.
- It conflicts with the Manual v3.0's explicit “modular-monolith first” default unless new evidence is produced.

**Disposition:** DEFER. Do not implement for the pilot. Reconsider only if measured bottlenecks, isolation/legal requirements, availability or independent team ownership justify service extraction.

## 4. Conditional target logical architecture

The proposed target is a single coherent application, not a set of microservices. It separates responsibilities in code and contracts while keeping transactional state under one database authority.

```text
Six web surfaces
(public / buyer / producer / hub / operations / reviewer)
                         |
                         v
             Web presentation + API boundary
                         |
                         v
           Identity verification + application policy
                         |
                         v
              Modular backend application
       ┌──────────────┬───────────────┬───────────────┐
       |              |               |               |
       v              v               v               v
  PostgreSQL     Private object   Job/outbox      Provider
  source of      storage          records         adapters
  truth          (blobs)           |               |
       |              |            v               +-- payments
       |              |         Worker process     +-- logistics
       |              |         (same repo)        +-- labs/inspection
       |              |            |               +-- notifications
       └──────────────┴────────────┴───────────────+
                         |
                         v
             Audit, reporting and monitoring
```

### 4.1 Frontend and API

- Six surfaces share a common design system and route/data contracts; they are not six applications.
- Logical separation between UI and application/domain services is mandatory.
- Deployment may be one full-stack web/API application or a static/client frontend plus one API service, depending on selected framework, SEO, cache safety, hosting and operating evidence.
- The browser never enforces authority or business invariants. All protected actions reauthorize on the server.
- Do not let Server Actions, route handlers, UI state or provider SDKs become an undocumented alternative business API.

### 4.2 Backend modules

Initial bounded modules:
1. Identity references, organisations and memberships.
2. Authority and mandates (including seller/exporter separation).
3. Producer/cooperative profiles.
4. Product catalogue and listings.
5. Hub intake and service records.
6. Batch, measurement and inventory.
7. Quality/evidence review.
8. Buyer enquiries and quotations.
9. Orders, accepted commercial snapshots and reservations.
10. Documents and compliance records.
11. Shipment events and exception handling.
12. Payment records and reconciliation.
13. Notifications and provider adapters.
14. Audit, administration and descriptive reporting.

Modules should own clear responsibilities and expose documented application contracts. Shared transactional operations may use a single database transaction. Do not create a network service boundary simply because a folder or module exists.

### 4.3 Data and file boundaries

- PostgreSQL is the single operational source of truth for business transactions, state, relationships and audit references.
- Private object storage contains file blobs; PostgreSQL contains metadata, access scope, hashes, evidence status and entity relationships.
- Public QR/batch pages are explicit allow-listed projections, not direct database/file exposure.
- Identity provider stores credentials/authentication; Phygital stores internal user mapping, memberships, mandates and business authority.
- No second operational database, data lake or event store is justified for the initial pilot. Reporting can start from controlled views/exports with access controls.

### 4.4 Background work

- Start with a database-backed job/outbox pattern for durable work that must survive request termination.
- Every job has a unique identity, correlation/causation reference, actor/service identity, bounded retry, idempotency, terminal failure state and operator visibility.
- Recheck current authority and domain state before material side effects.
- A worker can run within the selected backend environment initially if the platform supports durable execution; otherwise deploy a separate worker process from the same repository.
- Add Redis, RabbitMQ, managed queues or a workflow engine only after measured throughput, retry, isolation or platform limits justify the extra component.
- No external provider side effect is treated as complete until authenticated evidence and reconciliation support it.

### 4.5 External integrations

- Use adapters with stable internal contracts and provider-specific credentials/configuration.
- Keep payment status, logistics, inspection/lab, notification and government integration replaceable.
- Pilot baseline may use controlled manual/provider-verified reconciliation where no partner API or contract is approved.
- No direct funds custody, escrow, payout, customs clearance, shipment booking or live provider integration is authorized by this topology assessment.

### 4.6 Deployment units

Default:
- **Primary application deployment:** web/API responsibilities, using one authoritative backend application.
- **Managed data services:** one PostgreSQL database and one private object store, chosen separately through TSBBF.
- **Identity service:** chosen separately; application authorization remains authoritative.
- **CI/build:** governed from the authoritative GitHub repository.

Conditional:
- **Worker deployment:** a second deployable only if durable execution cannot safely run in the primary application environment or operational isolation is justified. Same repository, versioned code, same release traceability and separate least-privilege credentials.
- **Separate frontend host:** permitted if the selected framework/hosting or public SEO requirements justify it; it does not create a second backend authority.
- **Queue service:** only if database-backed jobs are insufficient under measured load or failure requirements.

## 5. Why the modular monolith is proportionate now

| Decision factor | Current evidence | Implication |
|---|---|---|
| Pilot scale | One commodity, one hub, limited producers and buyers; actual counts unknown | No evidence for independently scaling domain services |
| Transaction integrity | Allocation, quotation/order snapshots, inventory and audit require strong consistency | One relational transaction boundary is advantageous |
| Team/operations | Named staffing, support and on-call capacity unvalidated | Minimize deployables and operational burden |
| Integration maturity | Buyers, exporter, facility, payment, lab and logistics partners unconfirmed | Keep adapters replaceable; avoid live distributed integrations |
| Security/authority | Complex organisation, mandate, seller/exporter and hub boundaries | Centralize policy evaluation and audit |
| Offline | Intermittent connectivity is a design requirement, but devices/sites/durations are unvalidated | Keep sync API and local queue explicit; no distributed offline authority |
| Cost/TCO | Workload and operating costs UNKNOWN | Avoid premature broker, microservice, data lake and multi-region costs |
| Future scale | National/cross-border expansion is an ambition conditional on pilot evidence | Preserve module boundaries so services can be extracted later if justified |

## 6. Extraction triggers — when to revisit topology

A module may be extracted into a separate service only when one or more of the following is evidenced and approved:
- independent scaling requirement that cannot be met economically within the monolith;
- distinct legal/data-residency or security isolation requirement;
- a different availability/release lifecycle with a clear operational owner;
- sustained resource contention or latency bottleneck supported by measurements;
- external provider/partner boundary requires a separately isolated adapter;
- a team is accountable for the service, its data, on-call, backup/restore, security and SLOs.

Before extraction, define service ownership, API/event contracts, data ownership, idempotency, consistency/compensation, authorization propagation, observability, deployment, recovery, exit and cost. A folder boundary or expected future growth is not sufficient.

## 7. Open questions and closure conditions

ADR-0002 cannot close until:
1. Developer Guide v0.1 is recovered or formally dispositioned; its absence does not prevent a logical recommendation but blocks scoring Candidate A as a bundle.
2. Phase 0 validates the pilot participants, transactions, files, connectivity, devices, operating hours, support and cost assumptions.
3. TC-03–TC-06 candidate evidence establishes a viable database, identity, authorization and private storage combination.
4. TC-01/02/07 evidence establishes a viable frontend/API/runtime/worker combination and resolves Node/framework compatibility.
5. TC-09/10/12/13/24 evidence establishes deployability, secure release, recovery, offline behaviour and exit.
6. Legal/privacy review confirms data location, processing roles, retention, transfer and partner obligations.
7. Named operations owner(s), support arrangements, incident process and backup/restore responsibilities are confirmed.
8. A synthetic vertical slice is separately authorized, tested and independently reviewed.
9. The authorised decision owner records selected logical topology, exceptions, conditions, owner, review trigger and rollback/exit path.

## 8. Proposed ADR-0002 disposition for review

**Proposed logical direction:** Option B — modular monolith, one authoritative PostgreSQL operational database, private object storage, Phygital-owned authorization model, replaceable integration adapters and a database-backed job/outbox pattern. A separate worker process is conditional; no microservices or mandatory broker at pilot start.

**Decision status:** NOT APPROVED — pending authorised review and closure conditions. ADR-0002 remains OPEN.

**Not selected:** Next.js, React/Vite, NestJS, Express, Supabase, Neon, Render, Vercel, Cloudflare, AWS, any identity provider, queue or worker vendor.

**No authority created:** This assessment does not authorize production provisioning, migrations, real participant data, live integrations, live trade, custody, platform-held funds, escrow, payment initiation or shipment.
