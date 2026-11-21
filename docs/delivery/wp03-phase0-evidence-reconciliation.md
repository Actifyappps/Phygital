# WP-03 Phase 0 evidence reconciliation

**Review date:** 21 November 2026  
**Scope:** Reconcile Phase 0 source artefacts against ECR-01–ECR-14 in the WP-03 evidence closure request register.  
**Status:** Desk-based source reconciliation. This is not field validation, partner confirmation, legal advice, technical testing, or approval.

## 1. Executive finding

Phase 0 has a substantial and coherent evidence-gathering design. It defines the pilot's intended narrow scope, the roles and boundaries, the site-assessment criteria, buyer/producer/provider instruments, the commodity/destination hard stops, and the route-level decision method.

It does **not** establish that the intended participants, commodity, site, buyer, exporter, payment provider, laboratory, logistics provider or route have been selected or committed. The validation instruments are not completed field findings. Most numeric workload, connectivity, staffing and cost inputs remain UNKNOWN.

The strongest confirmed planning constraints are:

1. The intended first pilot is one commodity, one hub and a limited group of producers and buyers; Kericho and tea/honey/avocado are proposals/candidates, not selections.
2. The first site baseline is a digital coordination site. Physical custody, storage, grading, packing, testing and certification require separate site-specific permission, capability and controls.
3. The operating model requires human review for high-impact decisions, explicit role boundaries, evidence provenance and controlled manual fallback during connectivity failure.
4. A route is the complete producer group → existing aggregation point → defined product/batch → buyer specification → authorised seller/exporter → destination/delivery pathway. Deliverable 020 says no route is selected.
5. Deliverable 019 supports a minimum-documentation, Level 1 rehearsal and a simulated shipment stage; it does not authorise physical dispatch or live payment.

**Conclusion:** Phase 0 materially informs requirements and test design. It does not close the evidence requests needed to score technology candidates or authorise WP-05.

## 2. Source set reviewed

| Source | Date/version | What it establishes | What it does not establish |
|---|---|---|---|
| [003 — Commercial & Operational Assumption Validation](https://app.notion.com/p/5846808bcd9e820a9b760191453e2542) | 9 Nov 2026, v1.0 | Commercial/operational hypotheses, intended narrow pilot scope, unresolved partner/fee/cost assumptions and evidence needed | Completed buyer demand, producer supply, site permission, provider commitment, unit economics or budget |
| [008 — Commodity & Destination Screening Framework](https://app.notion.com/p/3a96808bcd9e8266884b813a7606f012) | 9 Nov 2026, v1.0 | Buyer-led product–destination–buyer screening, evidence classes, hard-stop gates and candidate commodity investigation prompts | Commodity, destination, buyer, regulatory route or product compliance approval |
| [009 — Legal & Commercial Role Map and Funds-Flow](https://app.notion.com/p/b246808bcd9e82608c2481bd7d9e1849) | Phase 0 working source | Proposed role separation and direct buyer-to-seller funds-flow model; identifies legal/commercial questions | Legal opinion, provider approval, executed contract or confirmed settlement route |
| [010 — Hub & Facility Readiness Assessment](https://app.notion.com/p/88c6808bcd9e82f7a96401215970f467) | 9 Nov 2026, v1.0 | Site categories, permission requirements, equipment/connectivity/staffing/cost inspection method and default digital-only site scope | Appointed site, written permission, measured connectivity, inventory, staffing or approved operating budget |
| [011 — Pilot Operating Model & End-to-End Service Blueprint](https://app.notion.com/p/4136808bcd9e8129ba16efca2640ef2b) | Phase 0 working source | Proposed actors, process stages, control gates, human review, offline fallback, payment boundaries and exception handling | Named role-holders, executed SOPs, a real transaction or demonstrated operating performance |
| [013 — Buyer, Producer, Hub & Provider Validation Pack](https://app.notion.com/p/4136808bcd9e81f092c7d480961f3fa4) | Phase 0 working source | Interview/checklist instruments for buyer demand, producer volumes, site readiness, connectivity, provider capacity, fees, insurance, liability and data/security | Completed interviews, verified responses, quotations, provider qualification or commitments |
| [019 — Minimum-Documentation Operationalization Strategy](https://app.notion.com/p/4136808bcd9e8189bdeefc419a3f65f4) | Phase 0 working source | Minimum record set, evidence reuse, conditional documents, Level 1–3 separation, manual/offline capture and rehearsal boundaries | Actual user time/cost, accepted buyer specification, validated batch or permission for a live physical route |
| [020 — Pilot Route Selection & Minimum-Documentation Feasibility](https://app.notion.com/p/4136808bcd9e81e291ddd6b90f91f3d1) | Phase 0 working source | Complete route definition, route comparison method, missing route fields and Level 1 fallback if no route is ready | Selected producer group, aggregation point, batch, buyer, seller/exporter, destination, quality, logistics or payment route |

The source artefacts are complementary. 008 screens product/destination suitability; 010 assesses a facility; 013 gathers actor/provider evidence; 011 describes the service workflow; 019 minimises the record burden; 020 combines the pieces into a complete route decision. None should be read as a substitute for completed evidence from the relevant party.

## 3. Reconciliation against ECR-01–ECR-14

Status vocabulary:
- **DESIGN EVIDENCE ONLY:** the source defines a method, requirement or control; no completed field result.
- **PARTIAL SOURCE EVIDENCE:** some relevant boundary or planning fact is established, but the required decision-grade artefact is missing.
- **NOT EVIDENCED:** the reviewed Phase 0 sources do not provide the required evidence.
- **GOVERNANCE GATE:** requires explicit approval by an authorised decision owner.

| Request | Phase 0 evidence found | Reconciliation / missing closure evidence | Revised status |
|---|---|---|---|
| ECR-01 Developer Guide source | No Phase 0 source resolves the canonical Developer Guide v0.1 recovery gap | Recover the exact source/version and authority, or obtain formal disposition from document owner; Phase 0 evidence cannot substitute for this guide | NOT EVIDENCED |
| ECR-02 Workload and transaction profile | 003 and 011 establish one commodity/one hub/limited participants as planning scope. 013 asks buyers for quantity/frequency and producers for monthly/seasonal volumes, existing commitments and net availability. 020 requires a realistic indicative batch | No validated user counts, organisation counts, concurrency, transaction rates, record counts, file volumes, buyer quantities, producer volumes, seasonality or peak patterns. Instruments are not completed responses | PARTIAL SOURCE EVIDENCE — NUMERIC BASELINE OPEN |
| ECR-03 Site/device/connectivity | 010 defines written permission, site inspection, equipment inventory, power/backup, ISP, bandwidth, actual uptime, Wi-Fi/security, connectivity tests at different times, maintenance contact and monthly cost. 013 adds connectivity/outage, utilities, equipment, staffing and permission checklist. 019 allows offline capture only as a controlled process | No selected site, written permission, measured bandwidth/latency/outage log, device/browser/OS inventory, power test, actual equipment inventory, staff schedule or site cost. No physical custody scope is approved | DESIGN EVIDENCE ONLY — SITE VALIDATION OPEN |
| ECR-04 Data inventory/privacy/legal | 011 requires role isolation, consent/privacy notice, purpose limitation, minimisation, retention and controlled sharing. 013 asks provider data/security controls; 008 includes data/privacy as a hard-stop gate | No approved data map, controller/processor analysis, lawful-basis assessment, data-subject inventory, cross-border transfer assessment, retention schedule, DPA or legal review | DESIGN EVIDENCE ONLY — LEGAL/PRIVACY ASSESSMENT OPEN |
| ECR-05 Provider contractual/region evidence | 003 identifies payment, logistics, inspection/lab and other providers as to be confirmed. 013 requires legal identity, capacity, service levels, full charges, surcharges, FX, insurance/liability, remedies and data/security statement | No selected provider, executed contract, current DPA, subprocessor/region evidence, service SLA, current written quote or exit terms. Provider questionnaire is not a response | DESIGN EVIDENCE ONLY — PROVIDER DUE DILIGENCE OPEN |
| ECR-06 Operations/skills capacity | 010 identifies staffing, training, supervision, shift coverage, access hours, maintenance, incident/complaint/emergency procedures and role types. 011 defines proposed actor responsibilities and daily/weekly/monthly reviews | No named accountable operators, skills/availability matrix, support hours, on-call/escalation coverage, maintenance owner, incident responder, handover or continuity plan | DESIGN EVIDENCE ONLY — ROLE OWNERSHIP OPEN |
| ECR-07 TCO assumptions | 003 identifies development/operating costs, cost per batch/shipment, revenue per order, working capital, fee incidence and recurring-cost coverage. 010 identifies space, utilities, internet, backup connectivity, staff, equipment, maintenance, insurance and transport cost categories. 013 requests provider full charges | No priced hub budget, staff cost, provider quotation, validated volume, payer willingness-to-pay, fee incidence, contribution margin or 12/24/36-month scenario. Fee hypotheses are not approved prices | DESIGN EVIDENCE ONLY — TCO INPUTS OPEN |
| ECR-08 Recovery/retention | 011 requires backup/recovery, incident escalation, audit history and controlled offline reconciliation. 019 requires preservation of capture time/actor and exception history | No approved RPO/RTO, retention/deletion schedule, backup independence, restore witness, recovery test, legal-hold rule or evidence-disposal policy | DESIGN EVIDENCE ONLY — RECOVERY GOVERNANCE OPEN |
| ECR-09 Buyer-to-seller payment | 003 requires payment partner confirmation and unresolved seller/agent/exporter legal structure. 009 proposes direct buyer-to-seller payment and separate platform service invoicing. 011 prohibits platform custody by default and requires provider-confirmed or authorised reconciliation evidence. 013 asks provider route, charges, settlement, FX and risk details | No named buyer/payee, currency/corridor, provider confirmation, seller merchant account, current licence-scope check, contract, fee/FX/settlement terms, webhook documentation or completed reconciliation evidence. Proposed funds flow is not an operational route | PARTIAL SOURCE EVIDENCE — PAYMENT ROUTE OPEN |
| ECR-10 Lab/inspection | 008 defines product/destination hard stops and commodity-specific quality pathway. 011 distinguishes hub measurement from competent lab results. 013 asks provider legal identity, accreditation/licence, capacity, scope, charges and liability. 019 limits checks to buyer/commodity/destination requirements | No commodity/product form selected, test method, named lab/inspector, current accreditation scope, sampling/chain-of-custody plan, report verification or provider data contract | DESIGN EVIDENCE ONLY — COMMODITY/PARTNER DEPENDENT |
| ECR-11 Security/privacy tests | 011 specifies organization/hub isolation, protected documents, audit, malware/security checks, offline replay and webhook controls; it lists negative scenarios including duplicate events and unauthorized cross-organization access. 013 contains security/data-control questionnaire prompts | Requirements and scenarios exist, but no execution evidence, threat-model approval, test outputs, defects/retests, independent review or residual-risk acceptance | SPECIFIED — NOT EXECUTED |
| ECR-12 Synthetic spike authorization | 019 supports Level 1 digital readiness rehearsal with synthetic or properly authorised sample data and simulated shipment. 020 explicitly permits Level 1 only if no physical route is evidenced | This supports preparation of a narrowly scoped rehearsal concept; it does not authorize a technology-comparison spike, provider accounts, budget or environment. WP-05 readiness gates remain controlling | NOT AUTHORIZED |
| ECR-13 Topology decision | 011 and 019 describe modular workflow boundaries and minimum digital records; these inform topology requirements | No Phase 0 artefact approves modular monolith, deployment topology, hosting provider or service boundaries. ADR-0002 requires a separate authorised decision | GOVERNANCE GATE — OPEN |
| ECR-14 Technology baseline decision | Phase 0 sources define capability and operating constraints that technology must support | No candidate scorecards, complete comparable evidence, independent review or authorized baseline decision. ADR-0001 remains open | GOVERNANCE GATE — OPEN |

## 4. Confirmed planning constraints to carry into technology requirements

These are suitable as requirements/guardrails, not as numeric capacity assumptions:

1. **Narrow pilot shape:** one commodity, one hub, limited producers and buyers.
2. **Digital-first site:** digital coordination is the baseline; additional physical functions are separately authorised and assessed.
3. **Evidence classes:** declared, documentary, hub-recorded/device-measured and independently verified must remain distinguishable.
4. **Human accountability:** high-impact decisions require a named authorised human, reason and audit trail.
5. **Minimum-documentation workflow:** collect information once, reuse it, and request conditional documents only when triggered by commodity, destination, buyer, provider or legal requirement.
6. **Offline-aware operation:** if validated as necessary, numbered manual/offline records preserve actor/time and reconcile under controlled duplicate prevention; offline capture is not a reason to permit unreviewed stock or payment transitions.
7. **No implied custody:** a digital record or hub location does not establish physical custody, title, stock release or dispatch.
8. **No platform funds custody:** buyer-to-seller payment and provider-confirmed reconciliation remain separate from platform service fees; no wallet/escrow/funds holding is implied.
9. **Route-level readiness:** no physical pilot route is ready until all essential actors, product/batch, buyer specification, seller/exporter, destination, quality, logistics and payment links are evidenced.
10. **Level 1 is a legitimate outcome:** if a physical route is not ready, rehearse the digital workflow using synthetic or authorised sample data and simulate shipment.

## 5. What can be closed now versus what needs external validation

### Can be closed as documentation/repository work

- Map each Phase 0 source to the relevant ECR and technology requirement.
- Record the above confirmed planning constraints in the workload and evidence registers.
- Convert the 013 instruments into a single controlled evidence-return checklist with source and evidence-class fields.
- Prepare synthetic fixtures and a Level 1 rehearsal plan, without executing the technology-comparison spike.
- Define a standard evidence-return format so completed buyer/producer/site/provider findings can be reviewed consistently.

### Requires real-world evidence or an authorised role-holder

- Buyer interviews, written specifications, volume/frequency and credible purchasing process.
- Producer/cooperative authority, membership, actual seasonal volumes, existing commitments and net saleable supply.
- Site owner, written permission, measured connectivity, equipment, staffing, costs and activity restrictions.
- Seller/exporter legal identity and authority, buyer/payee, payment provider route, currency, fees, settlement and reconciliation terms.
- Named laboratory/inspection provider and exact commodity/method accreditation scope.
- Legal/privacy review, data-processing terms, controller/processor roles and cross-border transfer assessment.
- Named operating/support/security/recovery role-holders, RPO/RTO and approved budget.

No public research or repository work can legitimately manufacture these facts.

## 6. Recommended next sequence

1. **Evidence return:** use Deliverable 013 as the common questionnaire set; collect completed buyer, producer, hub and provider responses with evidence class, source/date and consent/confidentiality restrictions.
2. **Site verification:** run Deliverable 010 only against a real candidate site; start with digital-only capability and record exact permission and measurements.
3. **Route case:** populate Deliverable 020 only when a producer group, aggregation point, product form/batch, buyer specification, seller/exporter and route evidence are available. Do not score an incomplete route as if it were complete.
4. **Commercial/legal review:** reconcile Deliverables 003 and 009 against actual provider quotes, seller/exporter roles, payer/payee, fee incidence, liability and funds flow.
5. **Operational test design:** use 011 and 019 to prepare Level 1 and controlled offline test cases; keep physical handling and shipment simulated until separately approved.
6. **Technology decision:** only then update candidate evidence, TCO, scorecards and WP-05 authorization.

## 7. Decision statement

The Phase 0 documents are mature enough to guide structured evidence collection and technology requirements. They are not evidence that the commercial pilot route, site, participants, provider contracts, staffing, operating budget or numeric workload have been validated.

Accordingly:
- ECR-02 and ECR-03 are partially informed, but remain open.
- ECR-04 through ECR-10 are mostly design/instrument evidence, not completed validation.
- ECR-11 is specified but not executed.
- ECR-12 remains NOT AUTHORIZED.
- ECR-13 and ECR-14 remain governance decisions, not document-completion tasks.
- WP-03 remains OPEN; no candidate is READY FOR SCORING.
- WP-05 remains NOT READY — NOT AUTHORIZED.
