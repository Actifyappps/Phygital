# Functional capability map

**Authority:** 024 Digital Marketplace Product Blueprint v0.1d and 024-A–G.  
**Status:** requirements-to-repository crosswalk only.

| 024 capability | Domain owner | UI home | Contract/test home |
|---|---|---|---|
| Identity, authentication and organisation management | identity, organisations, authority, privacy | identity/organisation flows across six surfaces | `docs/api/`, `tests/security/`, `tests/unit/` |
| Product catalogue and listing management | catalogue, marketplace, compliance-rules | public marketplace, producer | `docs/api/`, `tests/marketplace/` |
| Batch identity and provenance | supply, inventory, evidence | producer, hub, reviewer | `tests/inventory/`, `tests/evidence/` |
| Quality and evidence management | measurement, evidence, documents | producer, hub, reviewer, buyer-safe projection | `tests/evidence/`, `tests/security/` |
| Hub intake and operational events | hub-services, measurement, partner-readiness | hub operations | `tests/hub-services/`, `tests/integration/` |
| Inventory, reservation and movement controls | inventory, fulfilment | buyer, hub, operations, reviewer | `tests/inventory/`, `tests/concurrency/` |
| Buyer enquiries, RFQs and quotations | buyer-requirements, quotations-orders | public marketplace, buyer, producer | `tests/quotations-orders/`, `tests/contracts/` |
| Order management | quotations-orders, commercial, authority | buyer, producer, operations | `tests/quotations-orders/` |
| Trade documents and document control | documents, evidence, compliance-rules | buyer, producer, reviewer, operations | `tests/documents/`, `tests/security/` |
| Logistics and shipment coordination | fulfilment, partner-readiness | buyer, operations, reviewer | `tests/fulfilment/`, `tests/integration/` |
| Payment status and reconciliation | payment-status, cases | buyer, operations, reviewer | `tests/payment-status/`, `tests/reconciliation/` |
| Notifications and communication | notifications | all surfaces, scoped by purpose and recipient | `tests/notifications/`, `tests/integration/` |
| Exceptions, complaints and disputes | cases, marketplace-trust, product-integrity | all relevant surfaces; reviewer and operations | `tests/cases/`, `tests/marketplace-trust/` |
| Reporting and analytics | measurement, audit | buyer/producer summaries, admin, reviewer | `tests/measurement/`, `tests/reporting/` |

A capability may span contexts, but one context owns each authoritative fact and transition. The table does not imply that every feature is in the pilot release.
