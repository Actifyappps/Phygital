# Deliverable 025 — commercial service, fee and producer-proceeds source gap

**Review date:** 20 November 2026
**Source basis:** 024-R F-05; 024-B WF-11; 024-C ENT-065 / REL-034 / DC-11; 024-D API-OD-09; Deliverables 003 and 009; Pilot Operating Model 011; Sponsor decisions 018-A D-01 and D-07.
**Status:** Derived commissioning brief and repository source-gap record. The canonical dedicated 025 page was not located in targeted Notion search. This is not an approved 025 specification, price list, tax opinion, contract or implementation authorization.

## 1. Determination and boundary

024-R F-05 asks whether a dedicated 025 service catalogue, fee, billing and producer net-proceeds deliverable is planned and where it is held. 024-B WF-11, 024-C DC-11/ENT-065/REL-034 and 024-D API-OD-09 also treat the commercial model as a required, gated dependency. The targeted current-workspace search did not locate a dedicated canonical 025 page.

The repository already has a design home in docs/commerce/service-catalogue-and-fee-model.md and supporting commercial validation and funds-flow boundaries. These are not evidence that a sponsor-approved commercial model exists.

**Required programme-owner disposition:** confirm whether 025 is planned, stored elsewhere, renumbered or not yet commissioned. If commissioned, assign its owner and review authority. Do not silently label this brief as the canonical 025.

## 2. Keep four financial concepts separate

| Concept | Meaning | Governing boundary |
|---|---|---|
| Goods sale | Contract price owed by buyer to the actual seller under the sale contract | Seller/exporter roles remain distinct; platform is not default seller/payee (018-A D-01/D-02) |
| Producer proceeds | Amount the producer/source is contractually entitled to receive after evidenced, authorized deductions and costs | Must be transparent, reconciled and not presented as guaranteed before terms/evidence are complete |
| Platform/service fee | Amount payable for a separately defined service to its actual provider/beneficiary | Requires approved service, payer, charging event, basis, disclosure, tax and effective schedule |
| Payment status | Evidence about external payment instruction/provider event/reconciliation | Direct buyer-to-seller payment under D-07; platform does not hold, pool, release or transmit sale funds |

Do not infer platform commission from a database field, use a goods-sale percentage as the default revenue model, or deduct fees from producer proceeds without explicit approved terms.

## 3. Minimum scope for a commissioned 025

| Work package | Required content | Evidence / decision required |
|---|---|---|
| 025-A Service catalogue | Service ID, description, scope, exclusions, beneficiary, provider, deliverable, preconditions and completion evidence | Confirm service is real, needed, deliverable and owned |
| 025-B Responsibility and payer map | Payer, beneficiary, delivering entity, subcontractor/provider, liability, approval and service handoff | Sponsor/commercial and operational validation; no assumed payer |
| 025-C Pricing and charging model | Fixed/per-unit/per-batch/percentage/subscription/negotiated basis; trigger, calculation inputs, version and rounding | Evidence of cost-to-serve and willingness to pay; one primary hypothesis tested at a time |
| 025-D Producer gross-to-net | Sale price, currency/unit/quantity, quality adjustments, service charges, third-party costs, taxes and producer net amount | Seller contract, actual deductions and legally permissible settlement evidence |
| 025-E Tax, invoicing and consumer/participant disclosure | Tax/levy treatment, invoice issuer, invoice timing, disclosures, acknowledgements and records | Qualified Kenyan and relevant destination-market legal/tax review |
| 025-F Cancellation, refund and dispute | Failed service, partial service, cancellation, refund, credit, chargeback, adjustment and dispute treatment | Contractual rules, responsible party and review path |
| 025-G Hub/provider shares and subcontracting | Provider remuneration, revenue share, cost allocation, payment responsibility and evidence of service | Provider quotations/agreements and liability allocation |
| 025-H Unit economics and cash flow | Cost per onboarded organisation, batch, service, enquiry, order and completed transaction; working capital and timing | Baseline data, sensitivity analysis, cost owner and funding assumptions |
| 025-I Subsidy and producer protection | Sponsor-funded/free service, eligibility, duration, small-producer safeguards and transparent treatment | Sponsor approval, budget source and measurable participant impact |
| 025-J Digital controls and audit | Versioned service schedule, fee calculation snapshot, payer/beneficiary, trigger event, invoice/reference, adjustment/refund and net-proceeds statement | 024-C/D/E/F/G mapping, immutable history and acceptance tests |

## 4. Required decision register

| Decision | Question to settle | Safe interim treatment |
|---|---|---|
| C-01 | Which services are genuinely provided and by which legal entity? | Describe candidate services only; do not invoice |
| C-02 | Who benefits and who pays for each service? | No assumed producer/buyer/platform payer |
| C-03 | What event triggers a charge? | No charge on draft, listing, enquiry or order unless expressly approved |
| C-04 | What is the price basis and calculation version? | No default commission or percentage |
| C-05 | Who issues the invoice and receives the service fee? | No platform balance or implied payee authority |
| C-06 | What tax/levy treatment applies? | Hold for qualified legal/tax review |
| C-07 | Which deductions may reduce producer proceeds and who authorizes them? | No silent deduction; no guaranteed net-proceeds display |
| C-08 | How are refunds, cancellations, partial performance and disputes treated? | No fee collection or adjustment engine |
| C-09 | What shares/costs are payable to hubs or providers? | No assumed revenue share or subcontract obligation |
| C-10 | Is any service sponsor-funded or subsidized? | No subsidy promise without approved budget and eligibility |
| C-11 | What are actual cost-to-serve and working-capital needs? | Keep unit economics unproven |
| C-12 | How does the model preserve D-01/D-07? | Buyer pays seller directly; platform records status only; service fees remain separate |

## 5. Digital model and acceptance requirements

Candidate logical concepts already identified in 024-C and the commerce design home include service catalogue version, service engagement/order, payer, beneficiary, fee quote, fee calculation snapshot, invoice/reference, adjustment/refund, provider or hub share and producer-proceeds statement. These are logical concepts only; no one-entity-one-table or physical schema is implied.

Each charge calculation, if later approved, must retain the schedule version, service, payer, beneficiary, trigger event, inputs, units/currency, formula version, rounding, effective date, approvals, disclosure and immutable calculation snapshot. Historical transactions must not be silently recalculated when a schedule changes.

Minimum tests after approval:
- No fee record or payable obligation can be created from a draft, expired, withdrawn or not-yet-effective schedule.
- A fee is charged only to the approved payer and only on the approved trigger.
- Duplicate trigger/event processing is idempotent; no duplicate invoice or charge.
- Fee calculation reproduces from its stored inputs, schedule version, units/currency and rounding.
- Cancellation, refund, partial service, dispute and adjustment preserve original and compensating history.
- Producer gross-to-net reconciles all authorized deductions and distinguishes estimates from settled amounts.
- Hub/provider shares reconcile to the approved service agreement and evidence of service.
- Platform cannot receive, hold, pool, release or transfer goods-sale funds under D-07.
- Public and participant-facing disclosure exposes the approved price/fee information without leaking restricted commercial data.

## 6. Governance and evidence required before implementation

1. Programme owner confirms 025 status, scope, version and accountable author.
2. Sponsor approves the service catalogue, payer, beneficiary, charging event and pricing hypothesis.
3. Qualified Kenyan and destination-market legal/tax reviewers assess contracting, invoicing, tax, consumer/participant disclosure and any regulated activity.
4. Operational owners validate delivery capacity, service evidence, provider/hub responsibility, cost and continuity.
5. Buyer/producer research and actual partner quotations support willingness-to-pay and cost-to-serve assumptions.
6. Finance validates cash timing, working capital, refund/chargeback exposure, gross-to-net and unit economics.
7. 024-C/D/E/F/G changes are reviewed and linked to acceptance cases; ADRs and architecture are updated only where required.
8. The authorised sponsor records the approved commercial model and its limits; implementation remains separately gated.

## 7. Current non-authorizations

- No approved fee schedule, commission, payer, tax treatment, hub/provider share or producer deduction is established by this brief.
- No fee engine, invoice generation, wallet, platform balance, deduction, collection, producer payout or settlement capability is authorized.
- D-01 and D-07 remain controlling: platform coordinator only; direct buyer-to-seller payment; no platform-held funds.
- No live trade, custody, escrow, payment initiation, dispatch or shipment is authorized.

**Conclusion:** The repository has a useful commercial design home and enough source requirements to commission 025, but the canonical source and substantive commercial decisions remain open. Keep this brief as a preparation aid until the programme owner confirms the formal deliverable.