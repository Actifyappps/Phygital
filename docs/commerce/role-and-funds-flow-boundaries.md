# Deliverable 009 — legal role and funds-flow boundaries

**Source:** [Deliverable 009 — Legal & Commercial Role Map and Funds-Flow Design v1.0](https://app.notion.com/p/b246808bcd9e82608c2481bd7d9e1849)  
**Status:** Working design for project-lead, Kenyan legal-counsel and licensed-provider review. Not legal approval or authority to trade.  
**Relationship:** Reconcile all earlier proposals to Sponsor Decision Pack 018-A, D-01–D-07 (approved with conditions, 17 November 2026).

## 1. Purpose and role separation

The digital marketplace is designed as a technology and transaction-coordination layer. It must not inadvertently represent itself as owner/seller of goods, exporter of record, customs clearing agent, bank/payment provider, escrow operator, quality certifier or inspection body.

| Actor | Possible legal/operational responsibility | Digital system representation |
|---|---|---|
| Producer / producer organisation | Produce, declare origin/availability, evidence supply and grant only evidenced mandates | Producer/source profile, supply declarations, membership/authority and consent evidence |
| Cooperative / aggregator | Aggregate or trade only where its legal capacity, member mandate and facility arrangements permit | Organisation, membership, delegated authority, aggregation/service records |
| Seller of record | Own or hold valid authority/title to sell; contract with buyer; make accurate product/commercial claims | Explicit seller capacity, mandate/evidence, seller-approved listing and quotation |
| Exporter of record | Hold applicable eligibility/licences and undertake export responsibilities | Separate exporter capacity, scoped authority, licence/expiry and engagement evidence |
| Marketplace operator | Onboarding, discovery, records, matching, communications and coordination; invoice its own disclosed services | Platform coordination, service catalogue, audit and separately billed service fee |
| Hub/site operator | Only services permitted by written site agreement and demonstrated capability | Facility capability and service-session records; no inferred custody/title/stock |
| Customs clearing agent | Customs declarations and clearance under a valid mandate | Provider qualification, contract, instructions and source-backed status |
| Carrier / logistics provider | Agreed handling, transport, custody and delivery milestones | Shipment/provider references, event provenance and exception records |
| Independent laboratory / inspector | Tests and reports within actual competence/accreditation scope | Issuer identity, scope, method, result, evidence and validity |
| Bank / licensed payment provider | Regulated payment processing and any provider-authorised settlement service | Provider references, verified events and reconciliation; no platform custody |
| Buyer / importer | Buyer specification, purchase contract, payment and acceptance obligations | Buyer organisation/authority, enquiry, accepted terms, order and evidence |

A person or organisation may hold more than one capacity only where each capacity is independently evidenced, authorised and permissioned. Seller and exporter are not interchangeable and there is no automatic fallback from one to the other. Hub service status does not imply warehouse/custody status.

## 2. Candidate operating models from 009

| Model | Structure | Pilot disposition |
|---|---|---|
| A. Marketplace facilitator | Buyer and seller contract directly; platform supplies digital workflow/coordination | Preferred starting hypothesis, subject to legal review and clear agency boundaries |
| B. Disclosed commercial agent | Platform acts for a named principal under written authority and disclosed commission | Possible only after legal review, authority, conflicts and fee disclosure |
| C. Export-service coordinator | Separate qualified exporter carries export role; platform coordinates records/documents/logistics | Potential pilot variant, with explicit responsibility matrix |
| D. Principal trader/exporter | Platform buys/resells or exports in its own name | Not recommended for initial pilot; capital, title, tax, quality, licensing and liability exposure |
| E. Platform-held escrow/payment intermediary | Platform receives/holds buyer funds and releases them onward | Excluded from pilot under current baseline; requires separate specialist legal/provider approval if ever reconsidered |

The current sponsor decision boundary governs: D-01 platform coordinator only, not default seller/payee; D-02 seller and exporter capacities separately evidenced; D-03 hub service-only; D-07 direct buyer-to-seller payment. This file does not expand or vary those decisions.

## 3. Baseline funds flow

1. Buyer pays the seller/exporter under their sale contract through an appropriately authorised bank/payment provider.
2. Provider processes payment and settlement under its approved service.
3. Seller/exporter pays its contracted producer, aggregator and other providers under their own agreements.
4. Marketplace operator issues a separate invoice for its disclosed platform/service fee to the payer identified in the marketplace/service agreement.
5. The fee payer pays the operator's own business account.

The platform records payment instructions, provider references, verified status and reconciliation evidence. It does not receive buyer sale proceeds into its ordinary operating account for onward distribution.

### Required financial-event controls

- No platform wallet, pooled balance, stored value or escrow-like holding during the pilot.
- Unique provider/payment transaction reference linked to the relevant order and invoice.
- Authenticated, cryptographically verified callbacks and idempotent provider-event processing.
- Reconciliation across order, invoice, provider reference, amount, currency, fees, settlement account and settlement date.
- Failed, reversed, duplicated, partial and unidentified payments enter controlled exception queues.
- A user clicking “paid”, uploading a screenshot or scanning a QR code does not establish cleared settlement.
- Refunds are initiated by the party responsible under the sale contract through the provider's approved process.
- FX conversion, if ever used, is performed by an authorised provider with disclosed rate, source and fees.

Provider-managed split settlement, provider-managed escrow and letters of credit/documentary collection are distinct external financial products. They must not be assumed available because an API exists; each requires provider, legal, contractual and operational validation.

## 4. Contracts and responsibility allocation

The source identifies distinct agreements to be prepared and professionally reviewed, as applicable: marketplace terms; seller/supplier agreement; buyer terms; buyer–seller sale and purchase contract; producer supply/agency agreement; hub operating agreement; export-services agreement; customs-clearing engagement; logistics agreement; inspection/laboratory agreement; payment-provider agreement; data-processing agreement; and privacy notices/consent materials.

For each transaction activity, assign one accountable legal/contractual party and a responsible performer. Avoid unowned “shared responsibility”. At minimum allocate production accuracy, seller authority/title, listing, quality specification/testing, customs declaration, physical transport, payment processing, platform records, platform-fee invoicing, export permits/certificates and buyer acceptance.

## 5. Data-protection and privacy design implications

Deliverable 009 calls for a field-level map of personal data, purpose, source, recipient, retention and access group; controller/joint-controller/processor analysis by processing activity; ODPC applicability assessment; privacy notices/lawful-basis documentation; minimisation of national ID, financial and precise location data; role-based access, tenant isolation, encryption, logging and controlled exports; processor/subprocessor terms; retention/correction/access/deletion/breach procedures; cross-border transfer assessment; and DPIA where high risk.

These are assessment and design requirements, not a conclusion that any entity is registered, compliant or exempt. Obtain qualified review against current Kenyan law and actual processing roles.

## 6. Closure evidence and stop conditions

Before live commercial operation, the source requires named legal entities and counterparties, seller authority/title, eligible exporter, clearing-agent mandate, permitted payment-provider service and funds flow, approved fee payer/schedule, producer-proceeds terms, hub scope/costs, data-protection role analysis, reviewed contracts, dispute/refund procedures and title/risk/Incoterm allocation.

Any unresolved seller or exporter identity/authority, regulatory pathway, clearing arrangement, payment legality, custody/funds boundary, buyer–seller contract, quality/acceptance process, insurance/liability or material privacy/security obligation means HOLD. The repository cannot substitute for external approvals or signed agreements.

## 7. Digital implementation implications

- Separate legal capacity and operational role from login identity and organisation membership.
- Model mandates with scope, effective dates, evidence, reviewer, expiry and revocation.
- Enforce permissions server-side and in the data layer; UI role labels are not authority.
- Keep sale proceeds/payment status separate from platform service-fee billing.
- Keep hub service records separate from inventory custody and physical movements.
- Preserve payment/provider events append-only, idempotently and with provenance.
- Snapshot commercial terms and fee calculations at the relevant acceptance event.
- Maintain case/exception workflows for payment mismatches, refunds, disputes and missing evidence.

No wallet, escrow, payout engine, regulated service, seller appointment, exporter appointment or legal approval is implemented or implied by this document.
