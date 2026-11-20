# WP-03 component evidence pack 02 — frontend, application runtime and workers

**Review date:** 20 November 2026  
**Work package:** WP-03, ADR-0001 / ADR-0002 evidence closure  
**Scope:** TC-01 web frontend; TC-02 API/application runtime; TC-07 background workers.  
**Status:** Source-derived assessment specification. No candidate has been scored, shortlisted, selected, procured, provisioned or tested. This pack is not an implementation or production authorisation.

## 1. Purpose and decision boundary

This pack defines what must be established before selecting the user-interface framework, application runtime or background execution model. It complements WP-03 pack 01 (TC-03–TC-06) and must be assessed alongside the same TDR-01–TDR-18 baseline and validated workload assumptions.

The three components are assessed separately:
- frontend choice does not determine the authoritative location of business rules;
- API/runtime choice does not automatically decide database, identity or hosting;
- background work may run within an application runtime initially, but durable asynchronous responsibilities must be explicit and independently tested.

**Current boundary:** ADR-0001 and ADR-0002 remain OPEN; no stack or topology is selected. The Developer Guide v0.1 canonical source remains unrecovered. Technical Development Manual v3.0 supports a modular-monolith-first hypothesis, not an approved framework. Synthetic spike plan is not an execution record or environment authorisation.

## 2. Source basis

| Source | Relevant requirements | Limitation |
|---|---|---|
| Concept Paper v1.1 | Four staged technology pillars and the user-facing digital coordination purpose | Strategic authority, not UI or framework selection |
| Technical Development Manual v3.0 | Modular-monolith-first, single well-structured backend, relational database; defer queues/microservices until evidence | Candidate implementation plan only |
| 024-E v0.1 | Six surfaces, screen inventory, navigation, role-sensitive journeys, status/evidence presentation, responsive/accessibility/localisation/low-bandwidth and error/offline states | Logical experience specification, not final visual design or frontend choice |
| 024-A / 024-B | Server-side authority, roles, state transitions, workflow stop conditions and permissions | Draft source specifications |
| 024-C / 024-D | Domain entities, API commands/queries/events, idempotency, concurrency and integration boundaries | Logical contracts, not final API style or implementation |
| 024-F / 024-G | Threat model, security controls, quality and acceptance evidence chain | Draft specifications; controls not implemented by documentation |
| Offline and sync architecture | Explicit offline allow-list, pending-sync status, server authority, idempotency, conflict and revocation handling | Architecture requirements; no production offline client authorised |
| TSBBF v1.0 / AADDG v1.0 | Component scoring, reproducible builds, dependency governance, secrets, deployment, operations and exit | Standards, not vendor choices |

Canonical source links:
- [Technical Development Manual v3.0](https://app.notion.com/p/7ba6808bcd9e82be811781eca90484ce)
- [024-E — Screen, Navigation & Interaction Specification](https://app.notion.com/p/41d6808bcd9e816d8acdce8763dedf25)
- [024-A — User, Organisation, Role, Authority & Permission Matrix](https://app.notion.com/p/41d6808bcd9e81deaf78fe3ab8514043)
- [024-B — End-to-End Workflow, State & Business Rules Catalogue](https://app.notion.com/p/41d6808bcd9e8111b08cc0c3006e22b8)
- [024-D — API & Integration Contract Catalogue](https://app.notion.com/p/41d6808bcd9e81fc91d5f462eb3deb8a)
- [024-F — Security, Privacy, Threat & Abuse-Control](https://app.notion.com/p/41d6808bcd9e817d8d16d37bc31c063e)
- [024-G — Test Strategy, Quality Engineering & Acceptance Evidence](https://app.notion.com/p/41d6808bcd9e81c78dfdfa7919489c30)

## 3. Cross-component rules

1. The client is untrusted. It may improve usability, but it cannot be the authority for identity, organisation, role, mandate, quantity availability, workflow state, price, evidence verification or external status.
2. Keep domain rules independent of UI framework and provider SDKs. The browser must call explicit application contracts; it must not write directly to privileged tables or bypass server-side policy.
3. A single coherent application can contain multiple modules and surfaces. Separate deployables, microservices or runtimes require demonstrated security, workload, reliability or operational justification.
4. All surfaces must reflect effective permissions and active organisation context; a user-selected role label is not authority.
5. Network failure, offline capture, stale data, denied action, conflict and terminal error states must be designed, visible and testable.
6. Background execution must be idempotent, bounded, observable, attributable and recoverable. An accepted job is not proof that its external effect occurred.
7. Build, test, release and runtime configuration must be reproducible from committed source; no undocumented dashboard state may be required for correctness.

## 4. TC-01 — Web frontend and product surfaces

### 4.1 Required capability

The frontend must provide a coherent, responsive and accessible experience across six role-specific surfaces while keeping public disclosure, organisation context, authority and workflow status precise. The experience must work on small screens and constrained connectivity without weakening server-side security.

### 4.2 Source-derived requirements

- Support the six surfaces: public marketplace; buyer portal; producer/supplier portal; hub operations portal; platform administration/operations console; reviewer/assurance workspace.
- Assemble landing pages, navigation, search, deep links and visible actions from effective access and active organisation context.
- Show seller and exporter capacities separately where relevant; missing, expired or disputed authority must show a hold/stop condition rather than a silent fallback.
- Distinguish declared, documentary, independently verified and assumption/unknown evidence. Avoid generic green ticks or claims of certification.
- Make the physical-digital boundary explicit: a digital service record is not proof of custody, title, stock held, release or dispatch; allocation is reservation, not movement.
- Preserve the one-accepted-quotation-per-pilot-order rule and show the accepted quote-line/commercial snapshot in the order journey.
- Show payment status as provider-sourced/verified information; never present a platform wallet, escrow balance or release control.
- Provide empty, loading, success, denied, validation, conflict, stale, offline, pending-sync, retry and terminal-error states.
- Support responsive layouts, keyboard access, screen-reader semantics, focus management, sufficient contrast, accessible forms and error identification.
- Support localization and plain-language explanations; do not hard-code assumptions about language, literacy, device capability or connectivity.
- Avoid leaking inaccessible record existence through search, breadcrumbs, notifications, counts, autocomplete or deep-link errors.
- Preserve safe return paths, unsaved-change warnings and accessible task/status explanations.
- Provide a visible synchronization state for approved offline workflows; queued actions must be labelled pending sync and never as accepted or verified.

### 4.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Server-rendered React framework / full-stack web framework | Route/data boundaries, server/client split, rendering/cache behaviour, runtime limits, accessibility ecosystem, deployment portability | Framework conventions accidentally become business architecture; serverless limits, cache leakage, provider coupling |
| Client-rendered React SPA with separately governed API | Clean API boundary, offline/PWA support, independent deployability, routing, accessibility and performance | More client-side state/security complexity; duplicated validation; API versioning and deployment coordination |
| Other maintained web framework | Equivalent surface coverage, skills, accessibility, security lifecycle and portability | Smaller ecosystem/team familiarity, migration and support burden |

Next.js is one candidate named in the unrecovered Developer Guide hypothesis, not a selected frontend. React is named in current architecture materials as a candidate class. No framework is preferred by this pack.

### 4.4 Evidence required before scoring

- Exact framework version, support lifecycle, security advisory process and upgrade policy.
- Server/client execution boundaries, routing, caching and safe handling of authenticated/private data.
- Accessibility conformance evidence, component ecosystem health and ability to test keyboard/screen-reader journeys.
- Low-bandwidth performance, bundle size, route/data loading, image/document behaviour and graceful degradation.
- PWA/offline support and limits, service-worker update/security model, local persistence and shared-device data clearing.
- Localization/internationalization support and right-to-left or complex-script handling where required.
- Browser/device support and compatibility for likely field devices.
- Authentication/session integration and protection against XSS, CSRF, clickjacking, unsafe redirects and cache leaks.
- Build/deploy portability, runtime requirements, vendor-specific APIs and exit effort.
- Licence, commercial-use terms, maintainer health, vulnerability response and realistic team skills.
- Low/base/high operating and maintenance costs, including build minutes, bandwidth, image delivery and monitoring.

### 4.5 Minimum synthetic acceptance tests

1. Each of the six surfaces shows only the permitted navigation and data for synthetic roles.
2. Deep links and direct route access re-check server-side permission; hidden UI controls are not treated as access control.
3. Cross-tenant record IDs, search terms, breadcrumbs and notifications reveal no inaccessible data.
4. Evidence class and provenance labels remain distinct and understandable.
5. Seller/exporter and hub service-only boundaries are represented without misleading action labels.
6. Accepted quote snapshot, reservation status and payment-source status display correctly and cannot be locally altered into authoritative facts.
7. Keyboard-only, screen-reader and responsive checks cover high-priority journeys and error states.
8. Throttled/unstable network tests confirm meaningful loading, retry, offline and pending-sync behaviour.
9. Offline data on shared/lost device is minimized, protected and cleared/expired according to approved policy.
10. Build and route behaviour are reproducible from a clean checkout; authenticated responses are not leaked through shared caches.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No frontend candidate version, accessibility review, performance evidence, browser matrix, commercial terms or candidate comparison is recorded.

## 5. TC-02 — API and application runtime

### 5.1 Required capability

The application runtime must host authoritative business logic and trusted interfaces, preserve clear domain boundaries, enforce validation and authorization, coordinate database transactions and expose stable contracts. The initial shape should remain proportionate to the pilot; separate services are not a default.

### 5.2 Source-derived requirements

- Support a modular-monolith-first logical design unless evidence justifies additional deployables.
- Keep domain logic and contracts independent from framework, database driver, identity provider and vendor SDKs.
- Implement the logical commands, queries, domain events and projections described in 024-D without assuming that every logical operation must become a separate service.
- Validate all client input server-side, including identifiers, quantities, units, currency, state transitions, evidence references and expected resource versions.
- Enforce authentication, membership, role, resource scope, legal mandate, separation of duties and programme-stage gate at the trusted boundary.
- Use atomic transactions for material state transitions and safe concurrency/idempotency for retries and duplicate requests.
- Provide consistent errors, correlation/causation IDs, audit events and safe diagnostics without leaking secrets or sensitive policy internals.
- Support replaceable provider adapters; untrusted callbacks must be authenticated, validated, deduplicated and reconciled before trusted state changes.
- Keep public projections deliberately allow-listed; do not derive them by removing a few fields from private domain records.
- Support versioned contracts and compatibility tests. The API style (REST, RPC, GraphQL, asynchronous messaging or hybrid) remains open.
- Ensure worker/service identities have narrow permissions and cannot use a broad privileged key as a substitute for policy.
- Provide secure configuration, secret management, rate limiting, input/output controls and operational health/readiness behaviour.
- Keep database migrations and runtime releases separate from live operation approvals.

### 5.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Full-stack framework server runtime | Whether UI and server logic can remain modular, testable and portable; transaction/runtime limits; deployment coupling | Framework lock-in, execution ceilings, accidental coupling of UI and domain |
| Structured application framework (e.g., NestJS class) | Dependency injection/module boundaries, validation, testability, support, runtime footprint and team skills | Overengineering, framework conventions, package/lifecycle burden |
| Lightweight application framework (e.g., Express class) | Ability to establish disciplined modules, validation, auth, error handling, security defaults and maintainability | Inconsistent conventions and reliance on team discipline/plugins |
| Other maintained runtime | Equivalent evidence for security, support, transaction behaviour, portability and operation | Less familiar ecosystem and integration burden |

NestJS and Express are candidate examples in the Technical Development Manual context, not selections. The full-stack Next.js server option remains provisional until the Developer Guide source is recovered or dispositioned.

### 5.4 Evidence required before scoring

- Supported runtime versions, security lifecycle, release cadence and dependency health.
- Request, execution, memory, payload, timeout, concurrency and connection limits for the actual hosting model.
- Transaction orchestration and connection-pool safety; no assumption that long-running work fits request/response execution.
- Authentication middleware and authorization enforcement coverage across all routes and resource types.
- Validation, schema/versioning, error handling, idempotency, optimistic concurrency and rate-limit support.
- Testability of domain modules without live provider/database dependencies; dependency injection or equivalent seam quality.
- Background task support and safe separation of request lifecycle from durable jobs.
- Observability, correlation, redaction, health checks, graceful shutdown and incident diagnostics.
- API documentation/contract generation and backward-compatibility tooling.
- Secure secret/configuration handling and environment separation.
- Portability, deployment targets, licence, commercial terms, skills, support and low/base/high TCO.

### 5.5 Minimum synthetic acceptance tests

1. Domain invariants execute independently of UI and provider SDK packages.
2. Direct API calls with forged organisation/role/authority context are denied.
3. Invalid, stale, expired and conflicting state transitions fail with stable safe errors.
4. Duplicate command retries are idempotent; conflicting reuse of an idempotency key is rejected.
5. Concurrent reservations remain atomic and never exceed eligible quantity.
6. Provider adapter failure or timeout does not fabricate a completed payment/shipment state.
7. Public projections return only allow-listed fields.
8. Sensitive values are absent from logs, traces, errors and client bundles.
9. A clean build and test run can be reproduced without manual dashboard changes.
10. Graceful shutdown, connection exhaustion, request timeout and runtime restart do not corrupt transactions or lose acknowledged durable work.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No runtime candidate has been tested against workload, limits, security, support, portability or TCO.

## 6. TC-07 — Background workers and durable jobs

### 6.1 Required capability

Background processing must handle work that cannot safely depend on a browser session or a single HTTP request. It must be durable enough for its business importance, safe under duplicate delivery and retry, observable to operators and governed by scoped service identities.

### 6.2 Source-derived requirements

- Identify which tasks truly require asynchronous execution; do not introduce a queue or separate worker merely for architectural fashion.
- Support bounded retry with backoff, idempotency, duplicate detection and terminal failure visibility.
- Define delivery semantics and ordering requirements for each job type; do not claim exactly-once execution where only at-least-once delivery is available.
- Preserve correlation, causation, source event, actor/service identity, attempt count, schedule time and completion/failure evidence.
- Support poison-message/dead-letter or equivalent quarantine and controlled replay with authorization.
- Keep provider credentials and secrets in server-side secret storage; use narrowly scoped service identities.
- Re-authorize sensitive actions at execution time where current authority/state matters; a queued command is not a permanent grant.
- Prevent stale jobs from executing after mandate revocation, transaction cancellation, batch hold or other relevant state change.
- Make external side effects idempotent or explicitly reconciled; a timeout must not be interpreted as proof that the external action failed or succeeded.
- Provide operator visibility, safe retry/cancel controls, alerting, retention and audit.
- Keep long-running, scheduled and event-triggered work distinct in the design where their semantics differ.
- Ensure queue/outbox consistency with database transactions if durable event publication is required.

### 6.3 Candidate classes to compare

| Candidate class | Questions to prove | Main risks / evidence needed |
|---|---|---|
| Managed job/function runtime | Durability, scheduling, retry, concurrency, execution ceiling, region, observability and cost | Plan limits, cold starts, retry semantics, vendor lock-in and insufficient control |
| Queue-backed worker runtime | Delivery guarantees, visibility timeout, dead-letter, ordering, scaling, replay and operations | Extra components, operational burden, queue cost and message duplication |
| Database-backed job/outbox pattern | Atomicity with domain transaction, polling/locking behaviour, throughput and retention | Database load, custom worker ownership, cleanup, lock contention and operational design |
| Platform-native background functions | Integration with chosen host and data platform; secret scoping; execution and retry limits | Tight provider coupling, limited portability, hidden quotas and deployment coupling |

### 6.4 Evidence required before scoring

- Delivery model, retry policy, backoff, timeout, concurrency and ordering guarantees.
- Duplicate delivery and idempotency primitives; dead-letter, quarantine and replay controls.
- Atomic outbox or equivalent strategy to avoid database-commit/message-publish gaps.
- Scheduled execution reliability, missed-run handling and timezone semantics.
- Runtime limits, payload sizes, memory/CPU, maximum duration, region and scaling behaviour.
- Service identity and secret rotation; permission scoping per job type.
- Logs, metrics, traces, alerting, correlation and sensitive-data redaction.
- Job retention, deletion, audit and operator access controls.
- Cost drivers: invocations, duration, concurrency, queue operations, storage, egress and support.
- Recovery and portability: export pending/failed jobs where needed, replay semantics and provider exit.
- Named operational owner and incident/reconciliation procedures.

### 6.5 Minimum synthetic acceptance tests

1. Duplicate delivery produces one business effect or a controlled deduplicated result.
2. Transient failure retries within bounded policy; permanent failure becomes visible and quarantined.
3. Poison job does not block unrelated work.
4. Job replay requires authorized operator action and preserves prior attempts/history.
5. Authority revoked or relevant transaction state changed after enqueue is rechecked before execution.
6. Worker service identity cannot access unrelated tenant data or invoke unrelated commands.
7. Database transaction and event/outbox publication cannot silently diverge.
8. Provider timeout followed by late callback is reconciled without duplicate or false completion.
9. Worker restart/deploy during execution produces safe recovery and no lost acknowledged work.
10. Logs and traces allow reconstruction with no leaked tokens, secrets or unnecessary personal data.
11. Scheduled jobs handle timezone, missed run and duplicate trigger safely.
12. Operator can identify queue age, retry count, terminal failures and required manual decision.

**Scoring status:** INCOMPLETE — NOT SCORABLE. No worker/queue/job candidate, delivery semantics, cost, operator ownership or recovery evidence is recorded.

## 7. Cross-component synthetic slice

Once candidates are evidence-ready and a separately authorized spike is approved, the following tests should be exercised together:
- frontend sends an untrusted request to the application runtime;
- runtime derives identity and checks permission, mandate, scope and workflow state;
- runtime commits a domain transition atomically in the database;
- durable job/event is recorded without a database/message gap;
- worker processes it under a narrow service identity and rechecks relevant state;
- status is returned to the frontend with correlation and safe failure semantics;
- network interruption/retry does not create duplicate business effects.

This cross-component slice complements, but does not replace, the detailed SPIKE-01–SPIKE-18 acceptance matrix. It must use synthetic data only.

## 8. Dependencies and unresolved inputs

1. Canonical Developer Guide v0.1 recovery or formal disposition.
2. Validated pilot surfaces, user journeys, devices, browsers, languages and accessibility needs.
3. Validated transaction, job, event, file, concurrency and connectivity assumptions.
4. Named product, application, security and operational owners.
5. Current candidate versions, licensing, terms, limits, data region, support and costs.
6. Approval of the synthetic spike environment, scope, budget and independent reviewers.
7. Clear decision on what can run synchronously in the modular monolith and what requires durable asynchronous execution.

## 9. Disposition

This pack establishes the assessment basis for TC-01, TC-02 and TC-07. It does not select Next.js, React, NestJS, Express, a queue, serverless functions, a job platform or any hosting provider. All three components remain INCOMPLETE — NOT SCORABLE. The next pack should address remaining P0 platform/delivery foundations: hosting/deployment, CI/build, backup/restore, offline/synchronisation and data portability.

**No technology selection, procurement, provisioning, production deployment, migration, real-data processing or live integration is authorised by this pack.**
