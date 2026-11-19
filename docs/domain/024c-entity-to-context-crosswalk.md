# 024-C logical entity to repository context crosswalk

**Source:** 024-C — Information Architecture, Domain Data Dictionary & Entity Relationship Specification v0.1.  
**Source status:** Draft for review; conceptual/logical design only, not physical schema or migration approval.  
**Coverage check:** 65 logical entities identified in the current 024-C catalogue and mapped below.  
**Interpretation:** Package names identify logical ownership only. They do not prescribe microservices, database tables or technology. Cross-context relationships must use explicit contracts and stable identifiers.

| Entity ID | Logical entity | 024-C domain | Repository owner | Purpose |
|---|---|---|---|---|
| ENT-001 | User identity | IA-01 | `packages/domain/identity/` | Human platform identity |
| ENT-002 | Service identity | IA-01 | `packages/domain/identity/` | Controlled non-human integration or background identity |
| ENT-003 | Organisation | IA-01 | `packages/domain/organisations/` | Legal or operational entity |
| ENT-004 | Organisation membership | IA-01 | `packages/domain/organisations/` | Time-bounded user-to-organisation relationship |
| ENT-005 | Operational role assignment | IA-01 | `packages/domain/authority/` | Platform capability assignment |
| ENT-006 | Authority mandate / qualification | IA-01 | `packages/domain/authority/` | Evidence-backed authority to perform a defined legal/contractual capacity |
| ENT-007 | Party capacity assignment | IA-01 | `packages/domain/authority/` | Identifies the role an organisation performs in a particular transaction |
| ENT-008 | Hub / facility | IA-01 | `packages/domain/hub-services/` | Physical site or service location |
| ENT-009 | Hub service/custody mandate | IA-01 | `packages/domain/hub-services/` | Defines permitted hub activity |
| ENT-010 | Data-sharing purpose/permission record | IA-01 | `packages/domain/privacy/` | Captures purpose-bound disclosure authority and constraints |
| ENT-011 | Commodity/product taxonomy | IA-02 | `packages/domain/catalogue/` | Controlled commodity and product-form classification |
| ENT-012 | Product | IA-02 | `packages/domain/catalogue/` | Marketplace product identity |
| ENT-013 | Product specification version | IA-02 | `packages/domain/catalogue/` | Versioned technical/commercial specification |
| ENT-014 | Destination/jurisdiction | IA-02 | `packages/domain/compliance-rules/` | Controlled country/market/jurisdiction reference |
| ENT-015 | Rule set / requirement | IA-02 | `packages/domain/compliance-rules/` | Commodity-, product-, destination- or transaction-specific requirement |
| ENT-016 | Rule checklist item / evaluation | IA-02 | `packages/domain/compliance-rules/` | Applies a rule version to a product, batch, listing, buyer requirement or order |
| ENT-017 | Unit definition | IA-02 | `packages/domain/catalogue/` | Canonical unit and dimension |
| ENT-018 | Unit conversion rule | IA-02 | `packages/domain/catalogue/` | Controlled conversion where valid |
| ENT-019 | Supply declaration | IA-03 | `packages/domain/supply/` | Producer/source statement of available or forecast supply |
| ENT-020 | Batch / lot | IA-03 | `packages/domain/supply/` | Traceable physical product grouping |
| ENT-021 | Batch source/participant link | IA-03 | `packages/domain/supply/` | Connects batch to one or more source organisations or members where justified |
| ENT-022 | Intake/service event | IA-03 | `packages/domain/hub-services/` | Records a non-custodial service or observation |
| ENT-023 | Measurement | IA-03 | `packages/domain/measurement/` | Records a typed measured or declared value |
| ENT-024 | Sample / inspection / test | IA-03 | `packages/domain/measurement/` | Records sampling or competent inspection activity |
| ENT-025 | Batch eligibility decision | IA-03 | `packages/domain/supply/` | Scoped determination whether a batch can be used for a defined purpose |
| ENT-026 | Evidence item | IA-04 | `packages/domain/evidence/` | Evidence record supporting one or more claims |
| ENT-027 | Evidence claim link | IA-04 | `packages/domain/evidence/` | Associates evidence with the precise claim it supports |
| ENT-028 | Document metadata | IA-04 | `packages/domain/documents/` | Secure document registry entry |
| ENT-029 | Document review/verification | IA-04 | `packages/domain/documents/` | Records document-specific review without mutating source |
| ENT-030 | Listing | IA-05 | `packages/domain/marketplace/` | Public or restricted offer of supply |
| ENT-031 | Listing-batch backing | IA-05 | `packages/domain/marketplace/` | Explicit link between listing and batch supply |
| ENT-032 | Buyer profile / qualification | IA-05 | `packages/domain/buyer-requirements/` | Buyer organisation and scope-specific qualification |
| ENT-033 | Buyer requirement/specification | IA-05 | `packages/domain/buyer-requirements/` | Structured buyer need |
| ENT-034 | Buyer enquiry | IA-05 | `packages/domain/buyer-requirements/` | Non-binding expression of interest or request |
| ENT-035 | Compatibility assessment | IA-05 | `packages/domain/buyer-requirements/` | Evidence-backed match or mismatch result |
| ENT-036 | Quotation | IA-06 | `packages/domain/quotations-orders/` | Commercial offer header and version |
| ENT-037 | Quotation line | IA-06 | `packages/domain/quotations-orders/` | Item-level offer |
| ENT-038 | Terms version / acceptance snapshot | IA-06 | `packages/domain/commercial/` | Immutable record of terms shown and accepted |
| ENT-039 | Order | IA-06 | `packages/domain/quotations-orders/` | Commercial transaction record |
| ENT-040 | Order item | IA-06 | `packages/domain/quotations-orders/` | Line-level obligation |
| ENT-041 | Order variation / acceptance | IA-06 | `packages/domain/quotations-orders/` | Controlled post-acceptance change |
| ENT-042 | Reservation | IA-07 | `packages/domain/inventory/` | Temporary or committed quantity reservation |
| ENT-043 | Batch allocation | IA-07 | `packages/domain/inventory/` | Reservation/commitment relationship under D-06 |
| ENT-044 | Inventory movement | IA-07 | `packages/domain/inventory/` | Typed physical quantity/location event, separate from allocation |
| ENT-045 | Inventory reconciliation | IA-07 | `packages/domain/inventory/` | Comparison of ledger, physical count and evidence |
| ENT-046 | Shipment | IA-07 | `packages/domain/fulfilment/` | Shipment/consignment header |
| ENT-047 | Shipment fulfilment line | IA-07 | `packages/domain/fulfilment/` | Exact link from shipment to order item, allocation and batch |
| ENT-048 | Shipment milestone/event | IA-07 | `packages/domain/fulfilment/` | Sourced status event |
| ENT-049 | External payment record | IA-08 | `packages/domain/payment-status/` | Reference to a buyer-to-seller payment obligation and provider transaction |
| ENT-050 | Provider event receipt | IA-08 | `packages/domain/payment-status/` | Idempotent receipt of provider callback/event |
| ENT-051 | Payment event | IA-08 | `packages/domain/payment-status/` | Payment lifecycle event with provenance |
| ENT-052 | Payment reconciliation | IA-08 | `packages/domain/payment-status/` | Matching provider evidence to order/payment obligation |
| ENT-053 | Complaint / trust report | IA-09 | `packages/domain/marketplace-trust/` | Report suspected abuse, misleading information or unsafe conduct |
| ENT-054 | Case / investigation | IA-09 | `packages/domain/cases/` | Controlled case handling |
| ENT-055 | Appeal | IA-09 | `packages/domain/marketplace-trust/` | Independent review of an eligible decision |
| ENT-056 | Recall / withdrawal action | IA-09 | `packages/domain/product-integrity/` | Product, batch, listing, evidence or organisation containment |
| ENT-057 | Exception / support ticket | IA-09 | `packages/domain/cases/` | Operational problem, missing prerequisite or handoff |
| ENT-058 | Incident / recovery record | IA-09 | `packages/domain/cases/` | Security, privacy, operational or technical incident |
| ENT-059 | Offline device | IA-09 | `packages/domain/offline-sync/` | Managed device identity and lifecycle |
| ENT-060 | Offline action / sync receipt | IA-09 | `packages/domain/offline-sync/` | Controlled queue and server-side replay result |
| ENT-061 | Audit event | IA-10 | `packages/domain/audit/` | Protected history of material action |
| ENT-062 | Metric definition | IA-10 | `packages/domain/measurement/` | Governed definition of an outcome measure |
| ENT-063 | Metric observation/snapshot | IA-10 | `packages/domain/measurement/` | Time-bounded calculated result |
| ENT-064 | Gate assessment | IA-10 | `packages/domain/measurement/` | Software-stage or pilot-maturity readiness decision |
| ENT-065 | Commercial service catalogue/fee schedule | IA-10 | `packages/domain/commercial/` | Conditional service and pricing model |

## Ten 024-C information domains mapped to repository homes

| 024-C domain | Domain name | Repository contexts |
|---|---|---|
| IA-01 | Identity, organisation and authority | identity, organisations, authority, privacy, hub-services |
| IA-02 | Product, commodity and rules | catalogue, compliance-rules |
| IA-03 | Supply, batch and physical service evidence | supply, hub-services, measurement, inventory |
| IA-04 | Evidence and documents | evidence, documents |
| IA-05 | Marketplace discovery and demand | marketplace, buyer-requirements |
| IA-06 | Commercial offer and order | quotations-orders, commercial |
| IA-07 | Reservation, movement and fulfilment | inventory, fulfilment |
| IA-08 | External payment and reconciliation | payment-status |
| IA-09 | Trust, exceptions and operations | marketplace-trust, cases, product-integrity, offline-sync |
| IA-10 | Audit, reporting and governance | audit, measurement; programme gates remain under docs/governance |

## Ownership notes
- ENT-010 data-sharing purpose/permission belongs to privacy, coordinated with authority and organisations.
- ENT-025 batch eligibility decision is a supply-owned decision referencing catalogue, rules and evidence; it is not a generic boolean.
- ENT-038 accepted terms snapshot and ENT-065 service/fee schedule are commercial-owned, versioned and immutable once referenced by an accepted transaction.
- ENT-044 inventory movement is a physical event and is distinct from ENT-042/043 reservation/allocation.
- ENT-048 shipment milestone and ENT-051 payment event retain source/provenance and must not be promoted to verified without the required source evidence.
- ENT-059/060 offline device and sync receipt require a dedicated trust/synchronisation lifecycle; they do not permit local role selectors to act as authentication.
- ENT-064 gate assessment keeps software delivery stage separate from pilot maturity level.
- Where a logical entity is cross-cutting, its authoritative state owner remains singular; other contexts hold references or projections only.
