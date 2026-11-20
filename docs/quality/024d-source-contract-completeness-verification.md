# 024-D API and integration contract source-completeness verification

**Source:** Notion 024-D — API & Integration Contract Catalogue v0.1, 19 November 2026.  
**Comparison date:** 20 November 2026.  
**Status:** Source-content verification and contract-boundary review. Draft logical contracts only; not endpoint implementation, provider selection, architecture approval, live integration authorization or test execution.

## 1. Verification performed

The current Notion 024-D source was compared with the repository's detailed logical operation catalogue, domain/event crosswalk and candidate event catalogue.

| Source element | Notion 024-D | Repository comparison | Result |
|---|---:|---|---|
| Logical API groupings | 11 (IA-01–IA-10 plus offline) | 11 represented | Match |
| Logical operations | 65 | 65 operation rows | Exact section counts and operation names match |
| IA-01 operations | 7 | 7 | Exact name match |
| IA-02 operations | 6 | 6 | Exact name match |
| IA-03 operations | 6 | 6 | Exact name match |
| IA-04 operations | 7 | 7 | Exact name match |
| IA-05 operations | 7 | 7 | Exact name match |
| IA-06 operations | 6 | 6 | Exact name match |
| IA-07 operations | 6 | 6 | Exact name match |
| IA-08 operations | 6 | 6 | Exact name match |
| IA-09 operations | 7 | 7 | Exact name match |
| Offline contract requirements | No unrestricted operation table | Explicit offline contract section represented | Scope preserved; high-risk actions prohibited by default |
| IA-10 operations | 7 | 7 | Exact name match |
| Candidate domain events | 77 | 77 | Exact event-name set match; no missing or extra names |
| API open decisions | API-OD-01–API-OD-12 (12) | All 12 represented in domain map and operation catalogue | Match |
| Integration families | 8 | 8 | All represented |
| Contract test families | 17 | 17 | All represented in source crosswalk / acceptance strategy |

The operation comparison checked the logical operation names within sections 5.1–5.9 and 5.11, not merely the aggregate count. The event comparison checked the 77 individual candidate names after expanding grouped slash-separated names in the source. The offline section is a set of constrained requirements, not a missing operation table.

## 2. Repository homes

- `docs/api/024d-logical-operation-catalogue.md` — 65 logical operations with command/query type, principal/authority and preconditions.
- `docs/api/024d-contract-domain-map.md` — 11 domain groupings, API-OD-01–12, cross-cutting rules and provider boundaries.
- `docs/api/024d-domain-event-catalogue.md` — 77 candidate event names, common event envelope, delivery/replay requirements.
- `docs/product/workflow-to-context-crosswalk.md` — WF-01–WF-18 and BR-001–BR-034 mapping.
- `docs/domain/024c-entity-to-context-crosswalk.md` and `024c-relationship-integrity-catalogue.md` — logical entities, relationships and invariants.
- `docs/quality/024g-test-catalogue-crosswalk.md` and `024g-product-acceptance-catalogue.md` — verification levels, product acceptance and evidence discipline.
- `docs/security/024f-control-and-test-crosswalk.md` — security controls and security-specific tests.

The detailed logical operation catalogue is a content-preservation artefact. It does not assign stable operation IDs where the source has none, and it does not turn illustrative operations into final routes or schemas.

## 3. Contract integrity against 024-B and 024-C

Every logical operation must be carried forward with:
- owning workflow (WF) and business rule (BR);
- principal, organisation membership, role and separate legal capacity where required;
- target entity and relationship/invariant dependencies;
- state preconditions, effective rule/terms version and evidence scope;
- command/query distinction and resulting state/event;
- object/tenant authorization and privacy classification;
- idempotency, concurrency and replay behaviour where applicable;
- safe errors, audit/correlation references and recovery behaviour;
- positive, negative, isolation, boundary and integration test evidence.

Priority integration checks:

| Contract family | Required cross-spec controls |
|---|---|
| Identity and authority | Seller/exporter separate; server-derived principal and tenant context; expiry/revocation; no self-approval |
| Supply and evidence | Service-only hub; E1–E4 separate from acquisition type; source/batch/claim provenance |
| Marketplace and commercial | Compatible backing; public allow-list; enquiry/order separation; immutable accepted quote and order-line lineage |
| Reservation and fulfilment | Atomic concurrency; reservation not movement; movement and dispatch require separate authority/evidence |
| Payment | Direct buyer-to-seller only; provider event authentication; receipt distinct from reconciliation; no wallet/escrow/funds handling |
| Trust and recall | Case/appeal independence; trace-forward/back; controlled holds and protected evidence |
| Offline | Explicit allow-list; device lifecycle; server-side authority/state/rule revalidation; idempotency and conflict review |
| Audit/reporting/fees | Restricted audit; defined metrics; evidence-backed gates; fee schedule approval and effective trigger before obligation |

## 4. Event and integration controls

The 77 candidate events are preserved as proposed vocabulary. They describe committed facts, not commands or rejected attempts. The selected implementation must still decide:
- event transport and delivery semantics;
- per-resource ordering/version strategy;
- duplicate detection and consumer idempotency;
- retry/backoff, dead-letter and poison-message handling;
- schema compatibility, retention and permitted consumers;
- missed/delayed/out-of-order reconciliation.

Eight integration families are represented: identity/email/SMS; secure file/object storage; payment provider/bank; customs/export or clearing agent; laboratory/inspection provider; logistics/carrier; mapping/geolocation; analytics/reporting.

No named provider, agency, accreditation, partner, API, service level or contract is presumed available or approved. Each future adapter requires due diligence, accountable ownership, security/privacy review, contract, secrets lifecycle, outage/reconciliation behaviour and exit path.

## 5. Open decisions and non-final contract elements

All 12 API decisions remain open:

| Decision | Subject | Safe interim boundary |
|---|---|---|
| API-OD-01 | API style, application boundaries and hosting | Keep technology-neutral |
| API-OD-02 | Authentication provider, identity proofing and recovery | No provider assumption |
| API-OD-03 | Tenant model and database-enforced isolation | Default deny; test isolation |
| API-OD-04 | Event transport, guarantees, retention and schema registry | No exactly-once assumption |
| API-OD-05 | Evidence/document storage, scanning and retention | Private storage only |
| API-OD-06 | Offline allow-list, device trust and key lifecycle | Restrict high-risk actions |
| API-OD-07 | Payment provider and direct buyer-to-seller integration | No live payment integration |
| API-OD-08 | Export/customs, laboratory and logistics integrations | No live integration or shipment |
| API-OD-09 | Commercial fee catalogue, payer, trigger, tax and producer net proceeds | No fee collection or deduction |
| API-OD-10 | Data controller/processor, lawful basis, notices, retention and rights | Synthetic data; minimise |
| API-OD-11 | Rule authority, versioning, approval and change impact | No automated legal certification |
| API-OD-12 | Stage-gate authority and permitted production actions | No live transaction capability |

The request/response/error envelopes are illustrative. The version prefix is illustrative. No REST, GraphQL, RPC, broker, microservice, endpoint path, OpenAPI/AsyncAPI schema, database or provider has been selected.

## 6. Required next work before executable contracts

1. Reconcile each operation against exact WF/BR, ENT/REL and 024-A authority requirements.
2. Resolve or explicitly gate operation-specific open questions, especially tenant enforcement, identity lifecycle, offline command allow-list, private-file handling and payment/provider ingress.
3. Define stable contract identifiers and machine-readable schemas only after the selected API style and architecture are approved.
4. Link each contract to 024-G QAT cases and 024-F ST cases without renumbering or conflating the catalogues.
5. Add executable positive/negative, tenant isolation, idempotency, concurrency, replay, privacy and recovery tests after the synthetic environment and scope are separately authorized.

This review does not authorize service provisioning, live credentials, provider connections, production deployment, Migration 001/002, live trade, custody, platform-held funds, escrow, payment initiation, dispatch or shipment. EVI-21 remains OPEN / Closure Accepted NO.
