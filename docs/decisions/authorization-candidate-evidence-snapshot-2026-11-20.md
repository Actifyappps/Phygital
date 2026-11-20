# TC-05 authorisation and policy enforcement — initial evidence snapshot

**Evidence date:** 20 November 2026  
**Assessment status:** Initial public-source evidence captured; NOT A SCORECARD, shortlist or selection.  
**Scope:** Application policy enforcement, PostgreSQL row-level security, relationship-based authorization and policy-as-code.

## 1. Purpose and non-negotiable boundary

This is the first provider/approach evidence record for TC-05. It compares three complementary authorization patterns:

1. Application-owned authorization tuple service, reinforced by PostgreSQL RLS.
2. OpenFGA for relationship-based and fine-grained authorization.
3. Open Policy Agent (OPA) for general policy-as-code and contextual policy decisions.

These are not mutually exclusive products. PostgreSQL RLS is a data-plane enforcement mechanism; OpenFGA and OPA are policy decision engines; the application service remains responsible for enforcing the decision at each trusted command/query boundary.

**Non-negotiable:** Phygital must retain an application-owned canonical authority model. No database policy, identity provider, role engine or relationship graph may independently grant legal/contractual seller or exporter capacity, hub custody, reviewer appointment, provider qualification, payment authority or programme-stage permission.

## 2. Phygital authorization source model

The repository's 024-A authorisation tuple model evaluates:

(subject, organisation, membership, role, action, resource_type, resource_id, scope, capacity, mandate, evidence_state, effective_time, phase, environment, purpose, data_classification)

The decision must return allow, deny or hold/review with reason code and audit reference. Missing, ambiguous, expired, conflicting or unverified authority defaults to deny/hold.

The 024-A tuple contains more than ordinary role-based access:
- identity/session and active organisation membership;
- role family plus explicit action;
- resource and transaction scope (hub, case, listing, batch, quote, order, document, review mandate);
- separate buyer, producer, seller-of-record, exporter-of-record, hub, provider, reviewer, operations and service capacities;
- legal/contractual mandate, professional/provider qualification and evidence state;
- effective dates, expiry, suspension, dispute and revocation;
- commodity, product form, destination, route and facility scope;
- separation of duties, programme phase, pilot maturity, environment, purpose and data classification.

Seller and exporter authority are separate, independently evidenced and effective-dated. Hub service role does not grant custody/release/dispatch. Platform operations does not grant seller/payee/funds-holder capacity. These are source constraints, not optional policy-engine configuration.

## 3. Candidate pattern A — application-owned policy service plus PostgreSQL RLS

### Model
- Keep the canonical tuple, policy evaluation and reason codes in a tested application-domain authorization module.
- Enforce every command/query at the trusted API/service boundary.
- Use PostgreSQL GRANT/REVOKE and RLS as defense-in-depth for row access and mutation.
- Treat database owners, superusers and any BYPASSRLS/service roles as privileged trust boundaries.
- Where a platform exposes a Data API, independently govern schema/table grants and every RLS policy.

### Public technical evidence
- PostgreSQL RLS policies can restrict row visibility and INSERT/UPDATE/DELETE. If RLS is enabled and no policy permits access, the default is deny.
- PostgreSQL documentation explicitly states that superusers and BYPASSRLS roles always bypass RLS; table owners normally bypass unless FORCE ROW LEVEL SECURITY is applied.
- Supabase documentation requires RLS on exposed tables and notes that the service-role secret bypasses RLS. Its current guidance says that secret must remain server-side and that storage objects have their own independent RLS policies.

### Strengths
- No separate policy engine or additional network dependency is required.
- Strong data-boundary protection for tenant-scoped tables and files when implemented correctly.
- Application-owned policy model can express the full 024-A tuple and return Phygital-specific reason codes.
- Lower operational complexity than adding a separate authorization service.

### Risks and unknowns
- Policy logic can drift or be omitted from a new API, job, export, webhook, cache or file path unless enforcement is centralized and tested.
- RLS cannot by itself determine whether a real-world mandate or qualification is genuine; source verification and effective-state logic remain application/domain responsibilities.
- Owner, superuser, BYPASSRLS and service-role credentials can defeat row policies.
- Pooled connections and transaction/session context must be handled safely; tenant context cannot leak across requests.
- Policies may become difficult to review if complex business rules are duplicated across SQL and application code.

### Evidence required
- Policy inventory by table/action/role and a trace from each 024-A action to API and RLS enforcement.
- Role/grant review proving ordinary runtime roles are not owners/superusers/BYPASSRLS.
- Connection-pool context tests and explicit reset/transaction scoping.
- Tests for direct SQL, Data API, file/storage, exports, search, worker and webhook paths.
- Policy performance plans, index needs, policy-versioning and audit of changes.
- Independent review of service-role usage and privileged break-glass operations.

## 4. Candidate pattern B — OpenFGA relationship-based authorization

### Model
OpenFGA is an open-source, CNCF Incubating authorization system inspired by Google's Zanzibar. It models object types, relations and relationship tuples, then provides APIs such as Check/ListObjects to evaluate whether a subject has a relation to an object.

### Public technical evidence
- OpenFGA's official project site describes it as an open-source fine-grained authorization system for relationship-based access control, with support for RBAC/ABAC use cases.
- Its repository is licensed Apache-2.0 and supports HTTP/gRPC APIs, SDKs and PostgreSQL/MySQL storage backends.
- Check decisions use an authorization model plus explicit relationship tuples and optional contextual tuples. The API has a consistency option that trades additional latency for higher consistency.
- OpenFGA's September 2026 Dynamic Conditions announcement describes runtime CEL expressions attached to tuples as an experimental feature.

### Potential Phygital fit
- User-to-organisation membership and delegated relationship graphs.
- Organisation-to-resource relationships (e.g. a member of a cooperative assigned to a listing, batch, hub or review case).
- Hierarchical or inherited access where the domain model explicitly approves such inheritance.
- Reusable checks across API surfaces and services.

### Strengths
- Explicit relationship model and central check API can reduce duplicated relationship logic across services.
- Apache-2.0 self-hosting offers source and deployment control.
- Model and tuple changes can be tested/versioned independently from application code.

### Risks and unknowns
- It is a relationship graph, not the source of truth for legal authority. Tuple synchronization with Phygital membership/mandate records creates a consistency and revocation problem.
- Cached decisions and tuple propagation can produce stale access unless consistency is explicitly selected and tested.
- Dynamic Conditions are experimental in the cited 2026 announcement; do not rely on experimental runtime conditions for critical time-bounded mandates or legal authority.
- It adds a service, database, API credentials, deployment, backup, monitoring and incident path.
- A relationship graph may not efficiently or safely express every 024-A contextual attribute (evidence state, commodity/destination, purpose, data classification, programme phase) without application-side evaluation.
- No managed OpenFGA hosting price or support SLA is established in this snapshot.

### Evidence required
- Model mapping from every 024-A tuple dimension to OpenFGA relations, conditions or application-side checks.
- Atomic/safe tuple synchronization with membership, mandate, suspension, dispute, expiry and revocation events.
- Consistency-mode and cache tests under revocation and concurrent writes.
- Model versioning, migration, rollback, audit and tuple export/restore.
- API authentication, network restriction, service-to-service identity and failure mode.
- Performance/load test against validated resource and relationship volumes.
- Named operational owner, supported release policy and full self-host TCO.

## 5. Candidate pattern C — Open Policy Agent (OPA)

### Model
OPA is a general-purpose, open-source policy engine. The application supplies structured input; OPA evaluates policy-as-code written in Rego and returns a decision or structured result. OPA separates policy decision-making from the enforcement point.

### Public technical evidence
- OPA is a graduated CNCF project and its repository is Apache-2.0 licensed.
- OPA supports local/embedded evaluation, REST API, WebAssembly and distributed deployment.
- Its management architecture supports policy bundles, agent status/health and decision logs. OPA does not supply a complete central control plane out of the box; the team must implement or operate the policy distribution and telemetry endpoints.
- Decision logs can include policy path, input, result, policy bundle revision, trace identifiers and metrics. Sensitive inputs must be minimized or masked before logging.
- The official release page lists OPA v1.22.4 (12 November 2026) as latest at evidence capture and notes a security fix for CVE-2026-97054 in Go's HTTP/1 server. Version pinning and patch response are required.

### Potential Phygital fit
- Complex contextual ABAC decisions combining organisation, action, resource, mandate, effective time, evidence state, destination, purpose, phase and data classification.
- Central policy-as-code review, test and version control.
- Reusable policy checks across API, worker, CI and integration boundaries.

### Strengths
- Flexible structured-input evaluation can represent the full 024-A context.
- Policy is separated from enforcement and can be tested independently.
- Decision logs can provide model/policy revision and trace evidence.
- Apache-2.0 and self-host/embedded options reduce dependence on a proprietary authorization SaaS.

### Risks and unknowns
- Rego is an additional language and requires team skills, testing and review.
- Policy bundles and input data need a secure, versioned distribution/control plane; OPA does not provide that service out of the box.
- Distributed OPA instances may have different policy/data revisions unless rollout, status and fail-closed semantics are governed.
- OPA does not automatically secure database rows or files; the application must enforce the decision and database RLS remains separately relevant.
- Decision logs may contain sensitive user/resource/mandate context and require masking, minimization and access controls.
- OPA adds service/sidecar/library lifecycle, performance, availability and operating burden.

### Evidence required
- Rego model for the full 024-A tuple, including allow/deny/hold and reason codes.
- Policy test coverage, mutation testing, static linting, review and release process.
- Bundle signing/versioning, rollout/rollback, stale-policy detection and health monitoring.
- Decision-log minimization/masking and audit integration.
- Failure tests for OPA unavailable, stale bundle, malformed input, timeout and partial deployment.
- Latency/throughput under validated request volumes and high-cardinality contexts.
- Version pinning, CVE response, operating owner and TCO.

## 6. Comparative facts — no score

| Dimension | App policy + PostgreSQL RLS | OpenFGA | OPA |
|---|---|---|---|
| Primary model | Application-owned tuple plus row filters | Relationship graph / ReBAC | General policy-as-code / ABAC |
| Database enforcement | Native row-level enforcement | No; requires app/RLS integration | No; requires app/RLS integration |
| 024-A complex context | Full fit possible in application code | Some dimensions require application-side checks | Structured input can represent full context |
| Relationship inheritance | Custom implementation | Core strength | Can be modeled, but policy data/logic is custom |
| Time-sensitive mandate | App must check current time/state | Requires explicit condition/consistency design; dynamic conditions experimental in cited source | Can evaluate time/context supplied by trusted server |
| Service dependency | No additional policy service | Additional service and tuple store | OPA runtime plus policy/data distribution and logs |
| License / cost | PostgreSQL licence and application maintenance; no extra engine | Apache-2.0; hosting/operator cost unknown | Apache-2.0; hosting/operator cost unknown |
| Main failure mode | Missed endpoint/RLS bypass or policy drift | Stale/missing tuples, service outage, consistency gap | Stale bundle/input, engine outage, policy drift |
| Status | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE | EVIDENCE STARTED — NOT SCORABLE |

**No weighted score or architecture recommendation is produced.** The likely baseline pattern may combine application-owned policy checks with RLS; whether OpenFGA or OPA adds enough value must be established through requirements mapping and a separately authorized synthetic spike.

## 7. Mandatory Phygital tests

The 024-A local test catalogue AUTH-TEST-001–018 and CAP-TEST-001–010 remains the minimum source-mapped baseline. 024-F ST-01–ST-05 and ST-14–ST-15 are also directly relevant. At minimum, any proposed authorization implementation must demonstrate:

1. Cross-tenant direct-ID read/write denied for every resource family.
2. No membership, expired membership and revoked membership deny access.
3. Role without exact action permission denies.
4. Seller mandate cannot authorize exporter action; exporter mandate cannot authorize seller action.
5. Scope mismatch (commodity, destination, route, hub, resource, purpose) denies/holds.
6. Expired, suspended, disputed, missing or unverified mandate denies/holds immediately at the authoritative server boundary.
7. Hub service operator cannot create custody/release/dispatch.
8. Platform operator cannot substitute as seller, exporter, payee or funds holder.
9. Reviewer cannot edit source evidence or approve own work.
10. Break-glass requires reason, expiry, minimal scope, audit and independent review.
11. A revoked mandate is denied through existing access token, cached policy result, background job, file link and provider callback.
12. Database owner, superuser, BYPASSRLS/service key and connection-pool context cannot be reached by ordinary users or cause cross-tenant leakage.
13. Policy engine outage, stale model/bundle or missing input fails closed or enters an explicitly approved hold/review state.
14. Every material decision records policy version, actor/service, scope, reason code and correlation/audit reference without exposing unnecessary personal data.

## 8. Candidate disposition and next actions

- Application-owned policy + PostgreSQL RLS: **EVIDENCE STARTED — NOT SCORABLE**.
- OpenFGA: **EVIDENCE STARTED — NOT SCORABLE**.
- OPA: **EVIDENCE STARTED — NOT SCORABLE**.

Next:
1. Complete a line-by-line mapping from the canonical 024-A tuple and 28 local tests to each candidate pattern.
2. Decide which authorization decisions are data-row visibility, which are business/mandate decisions and which are relationship graph checks.
3. Model revocation, effective dates, disputed evidence and service identities before any engine comparison.
4. Add candidate records to the TSBBF workbook with numeric scores blank.
5. Only after source/workload and architecture gates, seek approval for a synthetic authorization spike; no real participants or production access.

**No policy engine, RLS implementation, authorization grant, provisioning or production access is approved by this snapshot.**
