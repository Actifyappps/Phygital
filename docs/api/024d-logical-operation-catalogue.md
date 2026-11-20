# 024-D logical API operation catalogue

**Source:** 024-D — API & Integration Contract Catalogue v0.1, dated 19 November 2026.
**Status:** Draft logical contract specification; not a selected API protocol, final endpoint schema, provider contract, implementation or production authorization.
**Purpose:** Preserve the source's logical operations and their authority/precondition expectations in the repository before technology-specific API design.

## 1. Source coverage

The Notion source defines 11 logical API groupings across IA-01–IA-10 and the offline capability. Its domain tables contain **65 logical operations**. The catalogue below preserves the operation name, command/query/integration classification, principal/authority and key preconditions/result as written in the source. It is not an OpenAPI or AsyncAPI definition.

| Source section | Information domain | Logical operations |
|---|---|---:|
| 5.1 | IA-01 Identity, organisation and authority | 7 |
| 5.2 | IA-02 Product, commodity and destination rules | 6 |
| 5.3 | IA-03 Supply, batch, intake and physical service | 6 |
| 5.4 | IA-04 Evidence and document management | 7 |
| 5.5 | IA-05 Marketplace listings and buyer demand | 7 |
| 5.6 | IA-06 Quotations, terms, acceptance and orders | 6 |
| 5.7 | IA-07 Reservations, allocations, movements and fulfilment | 6 |
| 5.8 | IA-08 External payment status and reconciliation | 6 |
| 5.9 | IA-09 Trust, complaints, disputes, appeals and recalls | 7 |
| 5.10 | Offline capture and synchronization | Contract requirements (no operation table) |
| 5.11 | IA-10 Audit, reporting, readiness and commercial configuration | 7 |
| **Total** | **IA-01–IA-10** | **65** |

## 2. Logical operations by domain

### 5.1 Identity, organisation and authority (IA-01)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Register or invite user | Command | Authorized organisation administrator | Invitation is scoped, expires, and does not itself grant transaction authority |
| Accept invitation / activate membership | Command | Invited user; membership approval where required | Identity and membership checks; record organisation membership lifecycle |
| Read organisation profile | Query | Member or specifically authorized reviewer | Return only permitted fields and scoped records |
| Submit authority/mandate evidence | Command | Authorized organisation representative | Evidence scope, issuer, effective dates and represented party required |
| Review/approve/revoke authority | Command | Independent authorized reviewer | No self-approval; preserve decision, reason, scope and history |
| Assign/revoke role grant | Command | Authorized access administrator | Least privilege, separation of duties, expiry and audit |
| Read effective permissions | Query | User/admin within permitted scope | Explain effective access without exposing hidden policy internals |

### 5.2 Product, commodity and destination rules (IA-02)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Create/update product definition | Command | Authorized product administrator | Versioned definition; change history |
| Read product/specification | Query | Public or authenticated according to disclosure | Return applicable version and permitted fields |
| Draft commodity/destination rule set | Command | Authorized rule owner | Identify jurisdiction, commodity, product form, effective dates and source |
| Review/publish rule version | Command | Independent reviewer/approver | Evidence and approval required; prior version retained |
| Evaluate eligibility against rule version | Query/service | Authorized workflow service | Return rule version, checks, evidence gaps and hold reasons; not a legal certification |
| Withdraw/supersede rule version | Command | Authorized governance role | No silent retroactive change; identify affected listings/orders and transition policy |

### 5.3 Supply declaration, batch, intake and physical service (IA-03)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Submit supply declaration | Command | Producer/cooperative representative with appropriate mandate | Label as declared; do not create verified stock |
| Record hub service/intake event | Command | Authorized hub operator within service mandate | Record activity performed, source, quantity/unit, operator, time, evidence and control of goods; no implied custody |
| Create/identify batch | Command | Authorized supplier/operations role | Unique batch lineage, source, product, dates, quantity/unit |
| Record measurement/sample/inspection result | Command | Competent authorized operator/provider | Method, unit, instrument, calibration where relevant, sample, source and evidence class |
| Review batch eligibility/hold | Command | Independent authorized reviewer | Rule/evidence checks, reason, scope and review history |
| Read batch and quantity position | Query | Scoped supplier, operations or reviewer | Distinguish declared, received, accepted, held, reserved, allocated, moved and dispatched quantities |

### 5.4 Evidence and document management (IA-04)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Create evidence claim/record | Command | Authorized source or operator | Claim, scope, acquisition type, class, issuer/source and provenance |
| Upload document securely | Command | Authorized uploader | Malware scanning, type/size limits, private storage, access policy and checksum |
| Submit evidence for review | Command | Evidence owner | Immutable submitted version and reviewer queue |
| Review/verify/reject evidence | Command | Independent competent reviewer | Scope-specific outcome, rationale, class, validity and limitations |
| Supersede/revoke evidence | Command | Authorized source/reviewer | Preserve history and identify dependent claims/workflows |
| Retrieve/download document | Query/action | Explicit permission and purpose | Short-lived access mechanism; log access; never public by default |
| Read evidence status/provenance | Query | Role and purpose scoped | Distinguish evidence class, acquisition type, review status and permitted use |

### 5.5 Marketplace listings and buyer demand (IA-05)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Create listing draft | Command | Authorized seller representative | Seller capacity/authority, product and backing-batch references |
| Add/remove compatible batch backing | Command | Authorized seller/operations role | Compatibility rules, availability, no duplicate backing/double counting |
| Submit listing for review | Command | Authorized seller representative | Required claims and evidence present |
| Publish/pause/withdraw listing | Command | Authorized listing approver or seller within policy | Batch eligibility, seller authority, disclosure permission and current rule version |
| Search public listings | Query | Public | Public-safe projection only; labels declared vs verified clearly |
| Search buyer requirements / submit enquiry | Query/command | Qualified buyer or authorized representative | Buyer identity, organisation authority, destination and requirements captured |
| Assess buyer-supply compatibility | Query/service | Authorized workflow | Specification, quantity, timing, destination and evidence gaps; match is not guarantee |

### 5.6 Quotations, terms, acceptance and orders (IA-06)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Create/revise quotation | Command | Separately authorized seller | Seller capacity active; buyer and commercial terms identified; immutable version |
| Issue quotation | Command | Authorized seller representative | Validity, currency, quantity, specification, delivery/payment terms and responsibilities present |
| Accept/reject quotation | Command | Authorized buyer representative | Exact version and terms accepted; acceptance event recorded |
| Create order from accepted quotation | Command | Authorized workflow / permitted party | Exactly one accepted quotation per pilot order; one-to-many order items map to quote lines |
| Amend/cancel order | Command | Contractually authorized party / reviewer as required | Variation/cancellation terms and affected reservations recorded; never rewrite accepted snapshot |
| Read order and commercial snapshot | Query | Buyer, seller, authorized operations/reviewer | Preserve parties, item, quote line, product/listing, quantity/unit, price/currency and terms |

### 5.7 Reservations, allocations, movements and fulfilment (IA-07)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Create reservation/allocation | Command | Authorized seller/operations workflow | Eligible quantity, current availability, concurrency check and exact batch lineage |
| Release/expire reservation | Command | Authorized role/system under rule | Reason, actor, prior allocation and resulting availability |
| Record physical movement | Command | Authorized responsible party under approved operating model | From/to, signed quantity/unit, reason, actor, time, evidence and idempotency |
| Reconcile inventory discrepancy | Command | Authorized independent reviewer/operations role | Preserve ledger, variance, reason and approval |
| Record packing/dispatch milestone | Command | Responsible seller/exporter/provider | Required authority, evidence and stage gate; dispatch remains prohibited until separately authorized |
| Read fulfilment/shipment timeline | Query | Transaction parties and scoped reviewers | Show source and confidence of each milestone |

### 5.8 External payment status and reconciliation (IA-08)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Record payment instruction/reference | Command | Buyer/seller workflow as permitted | Direct buyer-to-seller payment; record payee and provider reference without routing funds through platform |
| Receive provider event | Integration ingress | Authenticated provider adapter | Verify signature/authenticity, provider identity, event ID, timestamp and replay controls |
| Normalize provider status | Internal command | Restricted integration service | Map provider-specific status to canonical state with raw source reference retained |
| Reconcile payment | Command | Authorized finance/reconciliation role or approved automated control | Match order, amount, currency, payee, provider reference and authoritative evidence |
| Read payment status | Query | Buyer/seller/authorized reviewer | Distinguish initiated, pending, provider-confirmed, failed, reversed, refunded, disputed and reconciled |
| Record mismatch/exception | Command | Reconciliation workflow | Keep unresolved; assign owner and evidence; never infer settlement |

### 5.9 Trust, complaints, disputes, appeals and recalls (IA-09)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Submit complaint/abuse report | Command | Public/authenticated user as policy permits | Minimal information; secure intake and acknowledgement |
| Open and assign case | Command | Authorized trust/operations officer | Conflict check, category, severity, owner and deadlines |
| Record investigation/action | Command | Assigned authorized reviewer | Evidence provenance, impartiality, decision rationale and audit |
| Submit appeal | Command | Affected party or authorized representative | Reference original decision; preserve independent appeal route |
| Open product/batch hold or recall | Command | Authorized safety/quality authority | Scope, reason, affected batches/listings/orders and immediate stop rules |
| Trace affected supply/transactions | Query/service | Restricted incident/recall team | Trace-back and trace-forward; prevent unauthorized disclosure |
| Resolve/close case | Command | Authorized independent decision-maker | Resolution, actions, notifications, residual risk and review trail |

### 5.11 Audit, reporting, readiness and commercial configuration (IA-10)

| Logical operation | Type | Principal / authority | Key preconditions and result |
|---|---|---|---|
| Read audit trail | Query | Restricted assurance/admin role | Purpose and scope checked; tamper-resistant event history |
| Export audit evidence | Command/query | Authorized assurance role | Approved scope, minimisation, secure export and access log |
| Read operational metrics | Query | Role-appropriate management/reviewer | Defined metric, source, period, caveats and aggregation |
| Configure pilot-stage gate | Command | Sponsor/governance authority | Explicit decision, evidence references, owner, scope and expiry |
| Evaluate workflow stage gate | Query/service | Authorized workflow | Return pass/hold/gap with cited evidence and decision record |
| Draft commercial service/fee catalogue | Command | Authorized commercial owner | Draft only until approved; payer, service, trigger, tax and net-proceeds implications documented |
| Publish/retire commercial fee version | Command | Authorized sponsor/commercial approver | Requires separately approved commercial model and legal/accounting review |

### 5.10 Offline capture and synchronization

The source does not define an unrestricted offline API. It requires an explicitly approved allow-list and, at minimum:

- device identity and enrolment status;
- local action ID, client sequence and idempotency key;
- captured-at device time plus server-received time;
- actor and organisation context, revalidated at sync;
- action type, payload version and evidence references;
- device signature or equivalent integrity protection where justified;
- replay detection, revocation and lost-device handling;
- conflict response with authoritative server state;
- explicit accepted, rejected, duplicate, needs-review or conflict result per action.

High-risk actions are prohibited offline by default, including authority approval, rule publication, quotation/order acceptance, allocation where current availability cannot be atomically checked, payment confirmation, custody transfer and dispatch authorization, unless a separately approved control model explicitly permits a narrowly defined action.

## 3. Open API and integration decisions

The source identifies 12 unresolved decisions (API-OD-01–API-OD-12). They remain open; the repository crosswalk records the safe interim treatment.

| Decision | Required resolution | Safe interim treatment |
|---|---|---|---|
| API-OD-01 | Final API style, application boundaries and hosting architecture | Technical lead / TSBBF decision authority | Keep contracts technology-neutral |
| API-OD-02 | Authentication provider, identity proofing and recovery model | Security and data-protection reviewers | No provider assumption |
| API-OD-03 | Final tenant model and database-enforced isolation strategy | Technical/security reviewers | Default deny; test isolation |
| API-OD-04 | Event transport, delivery guarantees, retention and schema registry | Technical lead | No exactly-once assumption |
| API-OD-05 | Evidence/document storage, malware scanning and retention | Technical, security and legal reviewers | Private storage only |
| API-OD-06 | Offline command allow-list, device trust and key lifecycle | Operations/security reviewers | Restrict high-risk actions |
| API-OD-07 | Payment provider and direct buyer-to-seller integration scope | Sponsor, legal counsel, finance and provider | No live payment integration |
| API-OD-08 | Export/customs, laboratory and logistics integration scope | Exporter, legal counsel and relevant providers | No live integration or shipment |
| API-OD-09 | Commercial fee catalogue, payer, triggers, taxes and producer net proceeds | Sponsor/commercial owner, finance and legal | No fee collection or deduction |
| API-OD-10 | Data-controller/processor roles, lawful basis, notices, retention and rights handling | Data-protection counsel/lead | Minimise and use synthetic data |
| API-OD-11 | Rule authority, versioning, approval and change impact | Commodity/destination specialists and sponsor | No automated legal certification |
| API-OD-12 | Stage-gate authority and permitted production actions | Sponsor/governance | No live transaction capability |

## 4. Cross-cutting contract requirements

Every operation must resolve authentication and authorization separately; derive organisation/object scope server-side; default deny; validate preconditions and workflow state; use idempotency and concurrency controls; preserve evidence provenance, effective dates and quantity/unit precision; record audit/correlation IDs; minimize data; paginate safely; and return non-sensitive errors.

Domain events represent committed facts, not commands or intentions. Event delivery must tolerate duplicates, replay and out-of-order arrival; no end-to-end exactly-once guarantee is assumed. The companion event vocabulary is docs/api/024d-domain-event-catalogue.md.

## 5. Traceability and approval boundary

Every operation must trace to a 024 requirement, 024-B workflow/business rule, 024-C entity/invariant and 024-A actor/authority. Each contract requires preconditions, transition, emitted event, failure behaviour, idempotency/concurrency, privacy, audit/recovery and positive/negative/isolation/integration tests.

No API style, endpoint path, framework, database, event transport or provider is selected by this catalogue. No live credentials, live participant data, live payment integration, custody, platform-held funds, escrow, shipment or production deployment is authorized. Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED; EVI-21 remains OPEN.