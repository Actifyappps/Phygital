# Phygital bounded-context catalogue

**Status:** proposed logical boundaries; not a physical schema, deployed service map or technology selection.  
**Authorities:** Concept Paper v1.1; 018-A D-01–D-07 (approved with conditions); 024/024-A–G; 024-R audit; operating and Phase 0 evidence records.

## Boundary principles
1. One authoritative owner for each business fact and state transition.
2. Separate people, organisations, memberships, legal capacities, operational roles and permissions.
3. Separate physical product reality from declarations, measurements, evidence, reservations and shipment events.
4. Do not turn a workflow state into proof of legal authority or physical custody.
5. Cross-context references use stable IDs and versioned contracts; avoid shared mutable tables.
6. Commercial terms are snapshotted at acceptance; later catalogue edits must not rewrite historical transactions.
7. Every consequential command is authorised, idempotent where retried, attributable and auditable.
8. A bounded context is a conceptual ownership boundary; it need not become a microservice.

## Context catalogue

| Context | Owns | Must not own / key dependencies |
|---|---|---|
| Identity | Authentication subject, credentials reference, session and recovery lifecycle | Legal authority, organisation status, business permissions |
| Organisations & membership | Organisation profile, membership, representation links, verification status | A person's legal mandate or a seller/exporter approval |
| Authority & mandates | Capacity, mandate, role assignment, scope, validity, delegation, revocation, authorisation decision | Authentication or generic organisation profile |
| Producer & supply | Producer source, production/supply declaration, offerable quantity claims | Verified intake, stock custody or confirmed order |
| Product catalogue | Commodity, product form, grade vocabulary, units, classification references | Legal export clearance or current stock |
| Intake & measurement | Intake session, measured observations, instrument metadata, operator/device provenance | Certification unless an accredited authority supplies it |
| Evidence & provenance | Evidence object metadata, provenance, class, issuer, integrity, retention and verification | Conflating evidence strength with how it was acquired |
| Inventory & allocation | Batch ledger, quantity balances, reservations, allocation constraints and reconciliation | Dispatch or physical movement inferred from reservation |
| Marketplace & listings | Public/private listing projection, listing eligibility, visibility and listing history | Trust case adjudication or stock creation |
| Buyer requirements & enquiry | Buyer demand, specification, requested quantity, destination and enquiry lifecycle | Binding order or buyer creditworthiness |
| Quotation & order | Quote versions, accepted quote, order, order items and immutable commercial snapshot | Payment custody, exporter legal capacity |
| Commerce & billing | Service catalogue, fee schedules, billing events, payer, credits/adjustments and producer net proceeds | Receiving/holding customer sale proceeds by default |
| Compliance rules | Commodity/destination/route rules, source authority, effective dates, review and applicability result | Automated legal advice or statutory approval |
| Documents & export dossier | Document requirements, document instances, versions, status, issuer and order/batch linkage | Issuing regulated certificates or customs release |
| Fulfilment & shipment visibility | Milestones, provider references, status evidence, exception and reconciliation | Carrier authority, dispatch or custody unless separately approved |
| Payment status | Buyer-to-seller payment instruction/reference/status evidence and reconciliation | Wallet, escrow, pooled funds or platform settlement |
| Hub & facility services | Facility capability, permissions, service sessions, equipment and operator records | Assuming a hub stores, grades, certifies or exports goods |
| Partner & provider registry | Candidate/approved partner record, capability evidence, scope, contract and expiry | Treating candidate as appointed or contracted |
| Marketplace trust | Listing integrity, reports, moderation decisions, appeals and enforcement record | Rewriting underlying batch/evidence facts |
| Product integrity | Hold, withdrawal, recall, trace-forward/back, affected batch/order links and closure evidence | Silent deletion or rewriting of historical records |
| Notifications & communications | Templates, delivery attempts, preference and delivery evidence | Business authority or transaction state |
| Audit & oversight | Append-only actor/action/reason/time/source records and review trail | Replacing domain-owned facts or mutable operational logs |
| Privacy & records | Purpose, lawful-basis assessment reference, consent where applicable, retention, access/export/deletion workflow | Generic permission to expose personal or commercial records |
| Measurement & reporting | Defined metrics, provenance, cohort, baseline, calculation version and limitations | Invented targets or unqualified impact claims |
| Support & case management | Operational requests, incidents, complaints, disputes and escalation ownership | Binding adjudication outside approved authority |

## Cross-context event discipline
- Domain events describe facts already committed by the owning context; they are not commands.
- Consumers must tolerate duplicate delivery, out-of-order arrival and replay.
- Event envelope should include event ID, schema version, occurred-at, recorded-at, actor/service identity, tenant/organisation scope, correlation ID, causation ID, source context and data classification.
- Do not publish unnecessary personal, buyer-confidential or commercially sensitive payloads.
- Correct errors with compensating events and linked review, not destructive history edits.

## Initial pilot profile
The pilot is constrained to the approved evidence path and one-batch starting assumption. Keep service-only hub, separate seller/exporter capacities, reservation-not-movement, single accepted quote per order, direct buyer-to-seller payment, and no platform-held funds as hard invariants. Every extension requires a documented gate and evidence.


## Mapping to 024-C's ten information domains

The 024-C specification groups its 65 logical entities into ten information domains (IA-01–IA-10). The repository deliberately refines those ten broad domains into implementation ownership contexts without changing the logical authority. See [the complete 65-entity crosswalk](024c-entity-to-context-crosswalk.md).

| 024-C domain | Repository contexts |
|---|---|
| IA-01 Identity, organisations and authority | identity, organisations, authority, privacy, hub-services |
| IA-02 Product, commodity and rules | catalogue, compliance-rules |
| IA-03 Supply, batch and physical service evidence | supply, hub-services, measurement, inventory |
| IA-04 Evidence and documents | evidence, documents |
| IA-05 Marketplace discovery and demand | marketplace, buyer-requirements |
| IA-06 Commercial offer and order | quotations-orders, commercial |
| IA-07 Reservation, movement and fulfilment | inventory, fulfilment |
| IA-08 External payment and reconciliation | payment-status |
| IA-09 Trust, exceptions and operations | marketplace-trust, cases, product-integrity, offline-sync |
| IA-10 Audit, reporting and governance | audit, measurement; programme gates in `docs/governance/` |
