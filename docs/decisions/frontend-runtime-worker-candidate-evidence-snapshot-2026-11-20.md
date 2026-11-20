# TC-01, TC-02 and TC-07 — initial frontend, runtime and worker evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or selection.  
**Scope:** Web frontend framework; application/API runtime; durable background jobs and queue execution.

## 1. Purpose and boundary

This record begins provider/framework-specific evidence for three components that must be designed together but assessed independently:
- TC-01: frontend and six product surfaces;
- TC-02: authoritative application/API runtime;
- TC-07: background workers, queues and durable jobs.

The canonical Developer Guide v0.1 remains unrecovered. Its Next.js + Supabase + Vercel description remains provisional and must not be treated as an approved stack. The Technical Development Manual v3.0 supports a modular-monolith-first hypothesis and names NestJS/Express-style API options; those are candidates, not decisions.

No candidate is scored, shortlisted or selected. All current workload and operating assumptions remain UNKNOWN.

## 2. Governing design constraints

- The browser/client is untrusted; it never decides authority, state, price, quantity, evidence verification or external status.
- Keep domain rules and contracts independent of frontend framework, provider SDK and deployment-specific APIs.
- Start with one well-structured modular application unless measured requirements justify separate services.
- Support the six surfaces in 024-E: public marketplace, buyer, producer/supplier, hub operations, platform operations/admin, and reviewer/assurance.
- Design responsive, accessible, localized, low-bandwidth states, including loading, stale, denied, offline, pending-sync, conflict, retry and terminal error.
- Use server-side validation, authorization, transaction boundaries, idempotency, correlation, safe error handling and audit.
- Background execution must be durable enough for the business action, bounded, idempotent, observable, attributable and recoverable.
- Queued work rechecks current authority and domain state before a material effect; a queued request is not a permanent grant.
- No cache, worker, queue, server action, function or browser store may become an alternative source of business truth.

## 3. TC-01 — Web frontend framework

### 3.1 Candidate A: Next.js App Router

**Current public release signal**
- Official Next.js release repository lists v16.4.6 as the latest stable release at evidence capture (9 November 2026).
- The App Router uses React Server Components, Suspense and Server Functions.
- Official deployment guidance says a Node.js server or Docker deployment supports all Next.js features; static export has limited feature support.
- Next.js can be deployed to any provider supporting Node.js; multi-instance deployments require attention to shared cache and tag coordination.

**Potential fit**
- Server-rendered public marketplace pages and search/discovery.
- Shared layouts/navigation across role-specific authenticated surfaces.
- Server-side data access and API/backend-for-frontend routes where the topology deliberately keeps these responsibilities inside one application.
- React ecosystem and support for ordinary CSS; no Tailwind/CSS Modules dependency is required.

**Material risks and unknowns**
- App Router cache, Server Actions, route handlers and client/server boundaries introduce security and cache-isolation complexity. A November 2026 Next.js 16.4.5 security release fixed multiple moderate issues, including cross-tenant sensitive information disclosure through caching and cache poisoning. The latest 16.4.6 patch must be used if this family is considered; cross-user/tenant cache tests remain mandatory.
- Hosting platform capabilities differ for streaming, cache coordination, ISR, image optimization and server functions.
- Next.js server features may couple frontend, application runtime and hosting if not bounded by explicit contracts.
- The Developer Guide source gap means this candidate's previously described architecture cannot yet be treated as authoritative.

**Evidence required**
- Pin exact Next.js/React/Node versions and patch policy.
- Verify authenticated cache behavior, route cache defaults, Server Action authorization and cross-tenant isolation.
- Test six surfaces, accessibility, low-bandwidth performance, localization, offline draft handling and browser compatibility.
- Demonstrate self-hosted Node/Docker deployment and exit from platform-specific adapters.
- Measure build/runtime cost and operational complexity under validated workload.

Official sources:
- [Next.js releases](https://github.com/vercel/next.js/releases)
- [Next.js App Router](https://nextjs.org/docs/app)
- [Next.js deployment options](https://nextjs.org/docs/app/getting-started/deploying)
- [Next.js platform deployment requirements](https://nextjs.org/docs/app/guides/deploying-to-platforms)
- [Next.js self-hosting and cache coordination](https://nextjs.org/docs/app/guides/self-hosting)

### 3.2 Candidate B: React SPA with Vite and a separately governed API

**Current public release signal**
- React official version page lists React 19.3; the official release repository lists v19.3.1 (14 October 2026).
- Vite official site lists v8.3.7 at evidence capture. Vite support policy currently gives regular patches to 8.3, important/security backports to 7.3 and 8.2, and security backports to 6.4 and 8.1. Older branches are unsupported.

**Potential fit**
- Clear separation between web presentation and a separately governed API/runtime.
- Smaller, straightforward client build with explicit route/data contracts.
- React ecosystem, raw CSS and PWA/offline capabilities through separately selected, tested libraries.
- Frontend can be hosted as static assets on a variety of platforms; backend remains independently deployable.

**Material risks and unknowns**
- Public marketplace SEO/server rendering may require a separate rendering strategy or pre-rendering; static assets alone do not supply the full server-rendered experience.
- More responsibility for client-side routing, authenticated state, data loading, cache invalidation and safe API interaction.
- Offline/PWA behaviour is not automatic and must be explicitly designed and tested.
- Client code and local persistence are untrusted; all business validation and authorization remain server-side.

**Evidence required**
- Pin React/Vite versions and patch policy; review plugin and build-tool supply chain.
- Test six surfaces, route-level authorization, accessibility, localization and low-bandwidth performance.
- Compare public marketplace search/indexing needs against static/SSR requirements.
- Test PWA/service-worker updates, storage eviction, shared-device privacy and pending-sync semantics.
- Demonstrate reproducible static build and independent API deployment.

Official sources:
- [React versions and release policy](https://react.dev/versions)
- [React releases](https://github.com/facebook/react/releases)
- [Vite releases and support policy](https://vite.dev/releases.html)
- [Vite documentation](https://vite.dev/)

### 3.3 Frontend disposition

Next.js and React+Vite are both credible candidate patterns. The decision depends on public SEO/SSR needs, cache safety, API separation, deployment portability, low-bandwidth experience and operating skill. The source gap prevents treating Next.js as the confirmed project baseline. No candidate is scored.

## 4. TC-02 — API/application runtime

### 4.1 Candidate A: Next.js Node.js server runtime

- Can serve UI and server-side routes/actions in one deployment; Node.js server or Docker supports all documented Next.js features.
- Useful for a tightly bounded backend-for-frontend or a deliberately modular single application.
- Must not allow Server Actions or route handlers to become undocumented domain APIs or bypass centralized authorization.
- Authenticated data cache, server action input validation, transaction boundaries, background execution limits and deployment portability require explicit proof.
- If frontend and API are separated later, domain modules and contracts must remain reusable.

Official sources:
- [Next.js deployment](https://nextjs.org/docs/app/getting-started/deploying)
- [Next.js security and data handling guidance](https://nextjs.org/docs/app/guides/data-security)

### 4.2 Candidate B: NestJS

**Current public release signal**
- NestJS official release repository lists v12.0.3 (15 September 2026).
- NestJS 12 compatibility documentation currently lists Node.js v20.19+ or v22.12+ for its supported runtime combinations. It does not explicitly list Node 24 or Node 26 in that compatibility table.
- Node.js 26 is Active LTS as of 28 October 2026; Node 24 is Maintenance LTS. This creates a version-compatibility question that must be resolved before pairing NestJS 12 with the preferred Node LTS. Do not infer compatibility from the fact that both are Node projects.

**Potential fit**
- Explicit modules, dependency injection, controllers, providers, guards, pipes, interceptors, exception filters, testing and documented lifecycle.
- Guards can access route execution context and support consistent authorization integration.
- Pipes provide a clear system-boundary validation mechanism.
- The framework includes documented patterns for queues, scheduling, events, internationalization, file storage and API documentation.

**Material risks and unknowns**
- More framework concepts and conventions than a minimal runtime; potential overengineering if modules are not kept proportional.
- Node runtime compatibility must be resolved against the supported Nest major version.
- Framework guard/pipe features do not replace the canonical Phygital authorization model or independent RLS/database controls.
- Team familiarity and support ownership remain unvalidated.

Official sources:
- [NestJS release repository](https://github.com/nestjs/nest/releases)
- [NestJS version compatibility](https://docs.nestjs.com/faq/versions)
- [NestJS techniques and application features](https://docs.nestjs.com/techniques)
- [NestJS guards](https://docs.nestjs.com/guards)
- [NestJS pipes and validation](https://docs.nestjs.com/pipes)

### 4.3 Candidate C: Express 5

**Current public release signal**
- Express release repository lists v5.3.0 (9 October 2026).
- Express support policy says only the latest version in a major release line is supported; v5.x is ongoing. Express 5 has a Node.js 18 minimum, but the actual runtime should use an Active/Maintenance LTS line.
- Node.js 26.13.0 is Active LTS through April 2029; Node.js 24 is Maintenance LTS through April 2028. Node.js 27 is Alpha and not for production.

**Potential fit**
- Lightweight, flexible Node.js HTTP application runtime.
- Allows a modular monolith using explicit domain, application, adapter and contract packages without imposing a large framework.
- Broad middleware and integration ecosystem; straightforward fit with Node background workers and standard PostgreSQL drivers.

**Material risks and unknowns**
- Authentication, authorization, validation, error handling, rate limiting, audit, API contracts, dependency injection and module conventions must be assembled and enforced by the team.
- Greater risk of inconsistent route-level enforcement or ad hoc middleware if architecture discipline is weak.
- Express 5 major support does not imply every middleware dependency or plugin is compatible; dependency lifecycle must be checked.
- Express security guidance requires TLS, secure headers, brute-force controls and dependency hygiene; these are application/hosting responsibilities.

Official sources:
- [Express releases](https://github.com/expressjs/express/releases)
- [Express version support](https://expressjs.com/en/support/)
- [Express security best practices](https://expressjs.com/en/advanced/best-practice-security/)
- [Express security updates](https://expressjs.com/en/advanced/security-updates/)
- [Node.js release schedule](https://nodejs.org/en/about/previous-releases)

### 4.4 Runtime version control observation

At evidence capture:
- Node.js 26.13.0 is Active LTS; Node 24 and 22 are Maintenance LTS; Node 27 is Alpha.
- NestJS 12's current compatibility table lists Node 20.19+ or 22.12+ and does not explicitly include Node 24/26.
- Express 5 has a Node 18 minimum and is ongoing; a current LTS line remains required.
- React 19.3.1 and Next.js 16.4.6 have recent patch/security activity.

The project must pin a supported runtime and dependency matrix only after compatibility is confirmed for the selected framework, drivers, hosting platform, worker libraries and build tooling. Do not choose a Node version from release recency alone.

## 5. TC-07 — Background workers and queue execution

### 5.1 Pattern A: PostgreSQL transactional outbox + separately hosted worker

**Model**
- Write the domain transition and outbox record in the same database transaction.
- A worker polls/claims eligible outbox rows using locking/lease semantics, performs idempotent work, records attempts and completion, and safely retries or quarantines terminal failures.
- Use a worker process on the selected application host; Render Background Workers are one candidate host pattern, not a queue product by themselves.
- A queue store may be added only where measured throughput, isolation or delivery needs justify it.

**Evidence**
- Render documents background workers as continuously running services that listen to/poll a task queue; examples include Redis-compatible Render Key Value and Node BullMQ.
- Render pricing shows a background worker compute entry from $7/month for 0.5 CPU/512 MB, with separate workspace/network/key-value costs. This is a public entry reference, not a Phygital TCO estimate.
- Render Workflows is also listed as managed durable execution with automatic retries and rapid task spin-up; exact service maturity, limits, retention, region and price need additional validation.
- A PostgreSQL outbox avoids the classic dual-write gap when business state and job publication are committed together, but the worker still needs locking, leases, retry, idempotency, poison-job handling and observability.

**Risks**
- Custom queue/worker implementation and operational ownership.
- Polling/locking load on the primary database.
- Retry and dead-letter semantics must be built and tested.
- No exactly-once external side effect; provider callbacks and idempotency keys remain essential.

Official sources:
- [Render background workers](https://render.com/docs/background-workers)
- [Render pricing](https://render.com/pricing)
- [Render Cron Jobs](https://render.com/docs/cronjobs)

### 5.2 Pattern B: Supabase Queues (pgmq) + worker consumer

**Model**
- Supabase Queues is a Postgres-native durable message queue built on pgmq.
- Messages can be enqueued in the same Postgres transaction as the domain change, avoiding a database/message dual-write gap.
- A separately hosted worker or approved function consumes messages; the queue does not remove the need for worker runtime, idempotency or operator procedures.

**Public evidence**
- Official docs describe guaranteed delivery, a visibility window, message archival, monitoring and RLS/API permissions.
- PGMQ docs explain that a message is hidden during its visibility timeout and reappears if it is not deleted/archived before timeout; this is retry behaviour.
- Supabase product page currently labels Queues **Public Alpha**. The docs' “exactly once” description is within the visibility window; it is not proof that external side effects occur exactly once or that consumer crashes cannot lead to reprocessing.
- Unlogged queues are faster but can lose messages after a crash; do not use them for material Phygital business jobs.
- Supabase Cron can schedule messages, but a worker still has to process them.

**Risks**
- Public Alpha maturity/GA status and support commitments must be verified at decision time.
- Queue data shares the database's availability, backup and capacity envelope.
- A long-running task is not suitable for a short-lived database function without checking execution limits.
- Queue message retention/archive and RLS/role boundaries must be tested.
- Integrated queue can increase Supabase coupling.

Official sources:
- [Supabase Queues](https://supabase.com/docs/guides/queues)
- [PGMQ extension](https://supabase.com/docs/guides/queues/pgmq)
- [Supabase background job guidance](https://supabase.com/kb/faqs/background-jobs/background-job-processing)
- [Supabase Queues feature stage](https://supabase.com/features/queues)

### 5.3 Pattern C: Cloudflare Queues + Workers

**Model**
- Cloudflare Queues buffers messages and delivers batches to Worker consumers.
- Supports retries/delays, pull consumers and Dead Letter Queues (DLQs).
- A Worker can process jobs near Cloudflare infrastructure; external systems can use pull consumers over HTTP.
- It is a distinct service/runtime from a Node.js API and Postgres database; transactional outbox or equivalent is needed to avoid a dual-write gap between the Phygital transaction and queue publication.

**Public evidence**
- Queue message size limit: 128 KB.
- Message retries: maximum 100; default retry behaviour is three attempts before failure.
- Consumer batch size up to 100; wall-clock consumer duration up to 15 minutes; CPU configurable up to 5 minutes.
- Paid plan retention is 4 days by default and configurable up to 14 days; Free plan retention is fixed at 24 hours.
- Paid plan includes 1 million operations/month, then $0.40 per million operations. Each 64 KB read/write/delete chunk counts as an operation; no egress or throughput charge.
- DLQ must be configured; without one, messages reaching retry limit are deleted. DLQ messages without an active consumer persist four days before deletion.
- Cloudflare docs describe guaranteed delivery, batching, retries, delays and pull consumers.

**Risks**
- Delivery is at-least-once/retry-based, not exactly-once side-effect execution; handlers must be idempotent.
- A queue message is small and should carry identifiers/correlation, not documents or sensitive personal data.
- Cloudflare Worker runtime limits and compatibility with Node libraries must be tested.
- Cross-provider data/queue publication requires an outbox/reconciliation strategy.
- Queue jurisdiction, region, subprocessors, logs, DLQ retention and data residency must be assessed separately.

Official sources:
- [Cloudflare Queues overview](https://developers.cloudflare.com/queues/)
- [Cloudflare Queues limits](https://developers.cloudflare.com/queues/platform/limits/)
- [Cloudflare Queues pricing](https://developers.cloudflare.com/queues/platform/pricing/)
- [Cloudflare batching, retries and delays](https://developers.cloudflare.com/queues/configuration/batching-retries/)
- [Cloudflare Dead Letter Queues](https://developers.cloudflare.com/queues/configuration/dead-letter-queues/)

### 5.4 Pattern D: Render worker + Key Value/BullMQ or Render Workflows

**Model**
- Render background worker is a continuously running service; it normally consumes a queue such as Render Key Value (Redis-compatible) with a library such as BullMQ.
- Render Workflows is a separate managed durable-execution option with automatic retries and task spin-up.
- Worker process, queue service, database, web service and workspace plan must be costed separately unless the Workflows product replaces part of the custom queue model.

**Public evidence**
- Render pricing currently lists 0.5 CPU/512 MB background worker compute at $7/month; Key Value 256 MB at $10/month; network bandwidth is separately metered after included quota.
- Render Workflows is listed as managed durable execution with automatic task retries; the public pricing page currently lists flexible active CPU-hour and GB-hour rates, plus fixed-size options.
- Cron Jobs support periodic tasks, retain run history/logs and guarantee at most one active run per job; a run is stopped after 12 hours. They are not a replacement for a durable queue for high-volume or long-running work.

**Risks**
- Background worker alone is not a queue; Key Value or another queue is needed.
- Render Workflows needs a separate detailed maturity/retention/region/limits/exit review.
- Workspace, compute, Key Value, bandwidth and worker costs compound.
- Region and DPA terms must match the rest of the architecture.
- A worker process must still implement business idempotency, current authority recheck and provider reconciliation.

Official sources:
- [Render background workers](https://render.com/docs/background-workers)
- [Render pricing](https://render.com/pricing)
- [Render Cron Jobs](https://render.com/docs/cronjobs)

## 6. Initial comparison — facts, not scores

| Dimension | Next.js + Node server | React + Vite + separate API | NestJS | Express 5 |
|---|---|---|---|---|
| Primary role | Frontend + possible BFF/API | Frontend only; separate API required | Structured API/application runtime | Lightweight API/application runtime |
| Main strength | SSR, shared routes/layouts, integrated server features | Clear separation and static deploy portability | Modules, DI, guards, pipes, test structure | Minimal, flexible and broad ecosystem |
| Main risk | Cache/server action security and deployment coupling | Client-state/offline complexity; separate SSR strategy for public pages | Complexity and Node version compatibility | Team must impose module, auth, validation and security discipline |
| Version signal | 16.4.6 | React 19.3.1; Vite 8.3.7 | 12.0.3; Node support table mismatch | 5.3.0 |
| Disposition | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE |

| Worker pattern | Main strength | Main risk / unresolved item | Disposition |
|---|---|---|---|
| PostgreSQL outbox + worker | Transactional consistency with domain database; portable | Custom worker/queue operations and database polling | EVIDENCE STARTED — NOT SCORABLE |
| Supabase Queues + consumer | Postgres-native queue and archival; transaction integration | Public Alpha; queue shares DB capacity/recovery; exactly-once only within visibility semantics | EVIDENCE STARTED — NOT SCORABLE |
| Cloudflare Queues + Workers | Managed retries, DLQ, pull consumers, no egress charge | At-least-once; size/time/retention limits; cross-provider outbox needed | EVIDENCE STARTED — NOT SCORABLE |
| Render worker + Key Value/BullMQ or Workflows | Long-running Node worker and managed queue/workflow options | Multiple billable services; Workflows maturity/retention/region requires confirmation | EVIDENCE STARTED — NOT SCORABLE |

## 7. Mandatory Phygital acceptance tests

### Frontend/runtime
1. Six surfaces use effective server-side permissions and never trust a client-selected role/organisation.
2. Authenticated cache isolation: cross-user and cross-tenant data cannot leak through route cache, RSC, server actions, CDN or shared cache.
3. Public marketplace routes are indexable and perform acceptably under low-bandwidth throttling.
4. Accessibility and localization checks cover high-priority journeys and errors.
5. API calls with forged role, tenant, mandate, state or quantity are denied.
6. Domain modules run/test without UI framework or provider SDK dependencies.
7. Concurrent allocation and accepted-quote snapshot rules are enforced in application/database transaction boundaries.
8. Clean build, test and deployment are reproducible from committed source.

### Workers/queues
1. Domain state and outbox/message publication are atomic or have a documented reconciliation mechanism.
2. Duplicate message delivery produces one business effect or a controlled deduplicated result.
3. Retry is bounded; poison jobs go to DLQ/quarantine and are visible to operators.
4. Replayed jobs require authorized action and preserve attempts/history.
5. Membership, mandate, batch/order state and programme gate are rechecked at execution time.
6. Worker service identity cannot access unrelated tenant data or broad privileged operations.
7. Provider timeout/late callback is reconciled without false completion or duplicate side effect.
8. Worker restart/deploy preserves acknowledged work and does not corrupt transactions.
9. Logs/traces include correlation and attempt identity without tokens, secrets or unnecessary personal data.
10. Operator can inspect queue age, retry count, terminal failures, DLQ, replay and manual resolution.

## 8. Candidate disposition and next actions

All candidates above remain **EVIDENCE STARTED — NOT SCORABLE**. No frontend framework, application runtime, queue or worker platform is shortlisted or approved.

Next:
1. Recover or formally disposition the Developer Guide v0.1 before assessing Candidate A as a complete bundle.
2. Confirm Node/framework compatibility, especially NestJS 12's current Node compatibility table.
3. Obtain Phase 0 evidence for public SEO needs, devices, languages, concurrency, job volume, task duration, retries, connectivity and operating capacity.
4. Map every logical command/query/event in 024-D to synchronous API, durable job or provider callback.
5. Confirm Supabase Queues maturity/GA status and Render Workflows current service terms.
6. Add candidate records to the TSBBF workbook with numeric scores blank.
7. Only after approval, run a synthetic vertical-slice spike comparing the chosen frontend/runtime/worker combinations.

**No framework selection, runtime provisioning, production deployment, real-user onboarding, migration, real-data processing or live provider integration is authorised by this snapshot.**
