# Phygital end-to-end digital product realization map

**Authority:** Concept Paper v1.1; 018-A D-01–D-07 (approved with conditions); 024 v0.1d; 024-A–G v0.1; 024-R audit; applicable Phase 0 evidence and operating records.  
**Status:** Product-to-engineering traceability and sequencing map. Not an approved technical architecture, implementation plan, production authorization or evidence of completed tests.

## 1. The product is one connected operating system

Phygital is a multi-organisation B2B trade coordination and evidence platform connected to physical supply, hub services and qualified external providers. It is not merely a public catalogue or a collection of independent screens.

The governing product loop is:

**Producer/source declaration → hub service and intake evidence → batch and quality review → eligible supply/listing → buyer enquiry/RFQ → quotation → accepted order → reservation/allocation → documents and fulfilment coordination → shipment milestones → external payment status and reconciliation → reporting, cases and audit.**

Every step must preserve the relationship between the actor, organisation and capacity; the authority and scope permitting the action; workflow state and preconditions; authoritative data and provenance; physical/external event where one exists; interface; API/command/event contract; test; and retained evidence.

A screen, database row, QR code, status label or successful API response does not by itself prove a physical, legal, regulatory or financial fact.

## 2. Specification chain and repository homes

| Notion specification | What it governs | Repository realization |
|---|---|---|
| 024 v0.1d — Product Blueprint | Product purpose, users, surfaces, capabilities, scope and stage boundaries | docs/product/product-scope.md; functional-capability-map.md; this map |
| 024-A — Authority & Permission Matrix | Identity, organisations, memberships, roles, mandates, capacity and permission decisions | packages/domain/identity, organisations, authority; docs/security; tests/security |
| 024-B — Workflow, State & Business Rules | Workflow transitions, preconditions, stop conditions, invariants and business rules | workflow-to-context-crosswalk.md; workflow-state-index.md; domain packages and workflow tests |
| 024-C — Information Architecture & Logical Data Model | Ten information domains, logical entities, relationships, provenance and integrity | docs/domain/024c-entity-to-context-crosswalk.md; bounded-context-catalogue.md; docs/data |
| 024-D — API & Integration Contracts | Logical commands, queries, events, provider boundaries and contract expectations | docs/api/024d-contract-domain-map.md; 024d-domain-event-catalogue.md; docs/integrations; contract tests |
| 024-E — Screen, Navigation & Interaction | Six surfaces, screen inventory, journeys, states, accessibility and interaction | docs/product/024e-screen-inventory.md; 024e-journey-crosswalk.md; screen-state-catalogue.md |
| 024-F — Security, Privacy, Threat & Abuse | Threats, security/privacy controls, abuse cases and security tests | docs/security/024f-control-and-test-crosswalk.md; security implementation and tests |
| 024-G — Quality & Acceptance Evidence | Verification levels, test catalogue, defects, acceptance and release evidence | docs/quality/024g-test-catalogue-crosswalk.md; tests; evidence |
| 024-R — Independent Completeness Audit | Cross-document defects, missing requirements and corrective actions | docs/quality/024r-audit-coverage-matrix.md; product-integrity, commerce, trust, measurement and governance |

These are connected layers of one specification. They must not become unrelated document-specific modules. Requirement identifiers remain traceable to their source; repository ownership follows domain responsibility rather than Notion numbering.

## 3. Six interface surfaces, shared domain authority

The six surfaces are separate experiences over shared authoritative domain services, not six independent applications or copies of the same data.

| Surface | Principal users | Main tasks | Key constraints |
|---|---|---|---|
| Public marketplace | Prospective and authenticated buyers; public visitors | Discover approved listings, inspect buyer-safe batch passport projections, submit enquiries | Public view exposes approved projections only; no private evidence or unsupported verification claims |
| Buyer workspace | Buyer organisation members and authorised representatives | Manage requirements/RFQs, compare responses, review quotations, orders, documents and status | Organisation- and transaction-scoped authority; accepted quote snapshot preserved |
| Producer/supplier workspace | Producers, cooperatives, supplier representatives and authorised seller representatives | Maintain profiles and supply declarations, respond to enquiries, review offers/orders, provide documents | Declaration is not verified stock; seller capacity is distinct from exporter capacity |
| Hub operations workspace | Approved hub staff and service operators | Record agreed services, intake observations, measurements, sampling and handover evidence | Hub service-only baseline; no implied custody, title, stock held, release or dispatch |
| Reviewer/assurance workspace | Assigned reviewers, competent verifiers and assurance roles | Review evidence, qualifications, exceptions, holds, audit trails and corrective actions | Review scope and authority explicit; no self-approval or role escalation |
| Platform administration/operations | Platform support, controlled administrators and programme operations | Manage configuration, support cases, abuse reports, provider references, system health and reporting | Administration is not commercial authority, regulatory approval or access to transaction funds |

Navigation must remain task-first, responsive, accessible and suitable for localization and low-bandwidth use. Surface-specific views read the same domain-owned facts and apply the same server-side authorization and transition rules.

## 4. End-to-end lifecycle realization

| Lifecycle stage | Domain ownership | Digital behaviour and records | Required evidence/control |
|---|---|---|---|
| Identity and organisation setup | Identity; organisations; authority; privacy | Authenticate person/service; link membership; record role, mandate, scope and validity | Identity/organisation evidence appropriate to purpose; effective dates; revocation |
| Product and supply declaration | Catalogue; compliance rules; producer/supply | Select commodity/product form/specification; record source and declared quantity | Source and declaration provenance; versioned commodity/destination rules |
| Hub intake and evidence capture | Hub services; measurement; evidence; documents | Record service performed, intake observations, measurements, samples and files | Actor, facility/service scope, time, method, instrument/calibration where relevant, evidence class and provenance |
| Batch and inventory eligibility | Supply; batch; inventory; product integrity | Establish batch identity and lineage; reconcile quantity states; apply holds and eligibility | Source batch, quantity ledger, compatibility, evidence and rule versions |
| Listing and discovery | Marketplace; catalogue; public projections | Publish eligible supply; expose buyer-safe product passport projection | Listing-to-batch link, quantity basis, freshness and visibility approval |
| Buyer requirement and enquiry | Buyer requirements; marketplace | Capture RFQ/specification, destination, quantity, timing and supporting requirements | Buyer organisation authority; purpose and consent where applicable |
| Quotation and negotiation | Quotations/orders; commercial; authority | Create, revise, compare and accept/reject quotations | Seller authority; versioned commercial terms; currency/unit basis; validity |
| Order creation | Quotations/orders; commercial; authority | Create order from one accepted pilot quotation; preserve line-level source and commercial snapshot | Accepted quotation ID/version; each order item linked to accepted quote line |
| Reservation/allocation | Inventory; fulfilment; authority | Reserve quantities against order lines; release or expire reservation under rules | Available-to-reserve calculation; actor/reason; concurrency control |
| Documents and compliance | Documents; evidence; compliance rules | Request, upload, review, version and associate required documents | Issuer/source, subject, validity, scope, version and access classification |
| Fulfilment and shipment coordination | Fulfilment; partner readiness; product integrity | Record authorised handover, provider milestones, exceptions and shipment references | Actual event source, actor/provider, timestamp, scope and evidence |
| Payment status and reconciliation | Payment status; commercial; cases | Record instructions/references, provider-reported status, reconciliation exceptions and outcomes | Authorised provider/source where required; no platform receipt or custody |
| Cases, recall and aftercare | Cases; marketplace trust; product integrity | Manage complaints, disputes, abuse, withdrawal/recall, corrective action and closure | Case authority, affected entities, notices, acknowledgements and immutable history |
| Reporting and learning | Measurement; audit; governance | Provide role-scoped operational, commercial, quality and outcome reporting | Metric definition, source lineage, period, limitations and access rules |

## 5. Authoritative domain ownership

The ten 024-C information domains are realized through bounded contexts. A context owns its facts and state transitions; other contexts consume stable references or published contracts.

| 024-C domain | Engineering ownership contexts |
|---|---|
| IA-01 Identity, organisations and authority | identity, organisations, authority, privacy |
| IA-02 Product, commodity and rules | catalogue, compliance-rules |
| IA-03 Supply, batch and physical service evidence | supply, hub-services, measurement, inventory |
| IA-04 Evidence and documents | evidence, documents |
| IA-05 Marketplace discovery and demand | marketplace, buyer-requirements |
| IA-06 Commercial offer and order | quotations-orders, commercial |
| IA-07 Reservation, movement and fulfilment | inventory, fulfilment |
| IA-08 External payment and reconciliation | payment-status |
| IA-09 Trust, exceptions and operations | marketplace-trust, cases, product-integrity, offline-sync |
| IA-10 Audit, reporting and governance | audit, measurement; programme gates in governance |

This is a logical ownership map, not a microservice mandate. A modular monolith may host multiple contexts while preserving module boundaries, transaction ownership and explicit interfaces.

## 6. Contract chain for every consequential action

Every material command or state transition must be designed and verified across this chain:

1. **Authority:** authenticated subject, organisation, capacity, mandate, permission, scope and validity.
2. **Preconditions:** current state, programme stage, required evidence, rule version, quantity availability and dependency holds.
3. **Command:** explicit intent with validated inputs, idempotency where retries are possible and safe failure semantics.
4. **Domain transition:** authoritative owner validates and records the state change; no client-side authority.
5. **Data and provenance:** retain actor, source, timestamp, version, evidence, relationship and correction history.
6. **Event/integration:** publish only the approved logical event or call an adapter; validate external identity, signatures, replay and idempotency as applicable.
7. **Experience:** render permitted data and actual state; explain blocked actions without overstating facts.
8. **Verification:** positive, negative, concurrency, security, privacy, offline/retry and recovery tests appropriate to risk.
9. **Evidence:** retain reproducible test/build/review outputs, defect disposition, approver and release decision.

A client interface may guide a user but cannot enforce the only copy of a business rule. Server-side/domain enforcement is mandatory for consequential transitions.

## 7. Pilot-first engineering sequence

This sequence orders engineering discovery and implementation; it does not change separate pilot maturity levels or authorize live operations.

| Increment | Product outcome to prove | Minimum connected capabilities | Exit evidence |
|---|---|---|---|
| P0 — Foundation and controls | Reproducible, secure development baseline | Repository workflow, CI checks, configuration/secrets boundaries, identity/organisation/authority skeleton, audit conventions, synthetic fixtures | Reproducible build; reviewed architecture decisions; security and recovery approach |
| P1 — Physical-to-digital supply | Declared supply becomes an evidence-backed, reviewable batch | Product/rules, producer/supply, hub service, measurement, evidence/files, batch/inventory integrity, reviewer workflow | Complete provenance; negative tests; no false stock/custody/verification states |
| P2 — Buyer discovery to accepted order | Buyer demand matched to eligible supply and converted into controlled commercial snapshot | Marketplace/public projections, buyer requirements, quotation, seller authority, order, commercial snapshot | Quote/order lineage; authority tests; concurrency and tenant isolation |
| P3 — Reservation and documentation | Accepted order reserves eligible quantity and collects required records without implying movement | Inventory reservation, documents, compliance rules, notifications, cases | No over-allocation; no dispatch inference; document/privacy tests |
| P4 — Provider-coordinated fulfilment and payment status | Provider events and payment status recorded/reconciled without platform custody | Provider adapters, shipment events, payment-status, webhook security, reconciliation and exceptions | Partner sandbox evidence; idempotency/replay tests; explicit no-funds-handling boundary |
| P5 — Operational intelligence and scale | Operators and participants measure actual outcomes and support additional routes only when justified | Reporting, metrics, audit exports, localisation, low-bandwidth, offline sync, operational support | Data quality, privacy, performance, cost and operating evidence |

Do not implement P4 live integrations merely because a logical API contract exists. Provider contracts, legal review, sandbox access, security assessment and explicit authorization remain prerequisites.

## 8. Cross-cutting quality attributes

Every increment must consider multi-organisation isolation and least privilege; separate legal capacities and effective-dated mandates; evidence class separately from acquisition/provenance type; privacy by purpose, minimization, retention, deletion and disclosure; accessible, multilingual, low-bandwidth and recoverable interaction; offline queue safety and conflict resolution; auditability, idempotency, versioning and safe correction; concurrency and inventory integrity; secure private files and public projection boundaries; provider adapter isolation and webhook replay protection; backup, restore, rollback, monitoring and incident response; performance, cost, maintainability and data portability.

Detailed acceptance remains governed by 024-G and security testing by 024-F. This map does not replace those specifications.

## 9. Unresolved decisions and mandatory holds

- Technology stack and component choices remain OPEN under TSBBF; ADR-0001/0002 and dependent ADRs remain OPEN.
- Developer Guide v0.1 canonical artifact remains unrecovered; its reported Next.js/Vercel/Supabase candidate is not verified source and must not be scored until recovered.
- AADDG repository convention question (web/ versus src/) remains unresolved.
- 024-A–G remain draft review specifications; 024-R corrective actions require disposition and relevant source-spec updates.
- Migration 001 remains **HOLD**; Migration 002 is **NOT AUTHORISED**.
- EVI-21 remains **OPEN**, Closure Accepted = **NO**; DEF-L1-001 and DEF-L1-002 remain OPEN.
- No live trade, custody, platform-held funds, escrow, live payment integration, dispatch or shipment is authorized.
- No partner, facility, buyer, producer, exporter, regulator, laboratory, logistics provider or payment provider is assumed appointed or contracted.
- No production environment, live database, vendor account or external integration is implied by repository documentation.

## 10. Definition of represented, implemented, verified and accepted

A capability is **represented** when its source requirement, owner, interface/surface, data and contract dependencies, controls, test home and unresolved gates are identifiable.

It is **implemented** only when code/configuration exists in the selected architecture and is reviewable.

It is **verified** only when specified tests and evidence have actually been executed and retained against the relevant version/environment.

It is **accepted/released** only when authorised reviewers approve the evidence and the release gate is satisfied.

These statuses must never be collapsed into one “done” label.
