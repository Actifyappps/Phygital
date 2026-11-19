# 024-D API and integration contract crosswalk

**Source:** 024-D v0.1 — API & Integration Contract Catalogue.  
**Status:** Technology-neutral logical contracts; no endpoint paths, framework, provider or deployment are selected.

## Contract groups by bounded context
1. **IA-01 Identity, organisation and authority:** invitations, membership, organisation reads, authority evidence, authority review/revocation, role grants and effective permission queries. Seller and exporter capacities must be separate.
2. **IA-02 Product, commodity and destination rules:** product/specification versioning, rule drafting/review/publication/evaluation/withdrawal; preserve prior versions.
3. **IA-03 Supply, batch, intake and physical service:** supply declarations, hub service/intake, batch identity, measurements/inspection, eligibility/hold and quantity-position queries.
4. **IA-04 Evidence and documents:** evidence claims, secure uploads, review queues, verify/reject/supersede/revoke and scoped retrieval.
5. **IA-05 Marketplace and buyer demand:** listing draft/backing/review/publish/pause/withdraw, public-safe search, buyer requirement/enquiry and compatibility assessment.
6. **IA-06 Quotation, terms and order:** quote versions, issue/accept/reject, one accepted quote per pilot order, immutable terms snapshot, controlled amendments/cancellations.
7. **IA-07 Reservation, movement and fulfilment:** concurrency-safe reservation, release/expiry, separately authorised movement, reconciliation and shipment milestone visibility.
8. **IA-08 External payment and reconciliation:** direct buyer-to-seller references, authenticated provider ingress, normalization, reconciliation and mismatch cases; no wallet/escrow/fund-transfer commands.
9. **IA-09 Trust, complaints, disputes, appeals and recalls:** report intake, case assignment, investigation, independent appeal, hold/recall and trace-forward/back.
10. **Offline capture and synchronisation:** device identity, local action ID, idempotency, captured/server times, actor/organisation revalidation, replay/revocation/conflict outcomes. High-risk actions are prohibited offline by default.
11. **IA-10 Audit, reporting, readiness and commercial configuration:** restricted audit reads/exports, metric queries, sponsor gate decisions, gate evaluation and draft/publish fee catalogue only after approval.

## API open decisions API-OD-01–API-OD-12

| Decision | Required resolution | Safe interim treatment |
|---|---|---|
| API-OD-01 | Final API style, application boundaries and hosting architecture (Technical lead / TSBBF decision authority) | Keep contracts technology-neutral |
| API-OD-02 | Authentication provider, identity proofing and recovery model (Security and data-protection reviewers) | No provider assumption |
| API-OD-03 | Final tenant model and database-enforced isolation strategy (Technical/security reviewers) | Default deny; test isolation |
| API-OD-04 | Event transport, delivery guarantees, retention and schema registry (Technical lead) | No exactly-once assumption |
| API-OD-05 | Evidence/document storage, malware scanning and retention (Technical, security and legal reviewers) | Private storage only |
| API-OD-06 | Offline command allow-list, device trust and key lifecycle (Operations/security reviewers) | Restrict high-risk actions |
| API-OD-07 | Payment provider and direct buyer-to-seller integration scope (Sponsor, legal counsel, finance and provider) | No live payment integration |
| API-OD-08 | Export/customs, laboratory and logistics integration scope (Exporter, legal counsel and relevant providers) | No live integration or shipment |
| API-OD-09 | Commercial fee catalogue, payer, triggers, taxes and producer net proceeds (Sponsor/commercial owner, finance and legal) | No fee collection or deduction |
| API-OD-10 | Data-controller/processor roles, lawful basis, notices, retention and rights handling (Data-protection counsel/lead) | Minimise and use synthetic data |
| API-OD-11 | Rule authority, versioning, approval and change impact (Commodity/destination specialists and sponsor) | No automated legal certification |
| API-OD-12 | Stage-gate authority and permitted production actions (Sponsor/governance) | No live transaction capability |

## Cross-cutting contract requirements
Authentication is not authorization. Derive/validate organisation scope server-side. Use default-deny, object-level checks, idempotency, concurrency control, explicit units/precision, evidence provenance, effective dates, audit/correlation IDs, privacy minimisation, pagination and safe errors. Events describe committed facts, carry schema versions and source provenance, and tolerate duplicate delivery, replay and out-of-order arrival.

## Integration families
Identity; email/SMS; private file storage; measurement devices; payment provider/bank; logistics/carrier; regulatory/standards/laboratory; FX/rates; analytics/reporting. No provider or agency integration is presumed available, contracted or approved. Each adapter needs an owner, contract, authentication, secrets, failure/retry, reconciliation, observability and exit plan.
