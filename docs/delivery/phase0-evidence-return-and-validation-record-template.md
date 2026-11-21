# Phase 0 evidence return and validation record template

**Template version:** 0.1  
**Purpose:** Capture completed evidence returned through Deliverable 013 and related Phase 0 validation work in a consistent, auditable format.  
**Status:** Blank controlled template. It is not a survey approval, procurement instrument, offer, contract, participant consent form or partner appointment.

## 1. Use instructions

Create one record per distinct evidence claim, interview finding, site test, provider response or supporting artefact. Do not combine unrelated claims into a single “validated” statement.

- Use the current approved Deliverable 013 instrument and its confidentiality/consent instructions.
- Obtain programme approval before external circulation; the existence of this template does not itself authorize contact or collection.
- Record only information necessary for the stated validation purpose. Do not place identity documents, bank details, personal contact data, confidential buyer terms or raw sensitive attachments in the public GitHub repository.
- Store raw evidence in the approved restricted evidence repository. Record a controlled reference/ID here, not an unrestricted public URL.
- Distinguish E1 independently verified, E2 documentary, E3 declared and E4 assumption/unknown. A signed or emailed statement is not automatically independently verified.
- Record negative findings, refusal, no response, expired evidence and contradictions. Do not silently omit them.
- Keep unknown values as UNKNOWN. Do not infer volume, authority, consent, accreditation, connectivity, price or commitment.
- A completed evidence record is not approval to trade, take custody, hold funds, export, procure, integrate or deploy.

## 2. Evidence item record

Copy this section for each material claim or evidence item.

| Field | Entry |
|---|---|
| Evidence record ID | PEM-EV-YYYY-NNNN |
| Related ECR request(s) | ECR-xx |
| Phase 0 source/instrument | 003 / 008 / 009 / 010 / 011 / 013 / 019 / 020 / other |
| Actor category | Buyer / Producer / Cooperative / Hub-site / Seller-exporter / Logistics / Clearing / Laboratory-inspection / Payment / Technology / Other |
| Organisation reference | Controlled organisation ID; do not expose personal data |
| Claim or question being validated | One clear proposition |
| Value / finding | Exact value, response or finding; UNKNOWN if absent |
| Unit / period / scope | State units, product form, geography, time period and applicable scope |
| Evidence class | E1 / E2 / E3 / E4 |
| Source / issuer | Who created or supplied the evidence |
| Source date and validity | Date, expiry, version, applicable period |
| Retrieval / observation date | Date collected or site test performed |
| Controlled evidence reference | Restricted repository record ID |
| Verification method | Issuer confirmation / independent cross-check / site observation / instrument reading / document review / other |
| Verifier and role | Named reviewer in restricted record |
| Limitations / contradictions | Missing fields, conflicting claims, sampling limits, caveats |
| Confidentiality / lawful collection basis | Reference to approved notice, consent/other basis, NDA or restriction; do not assert legal sufficiency |
| Review outcome | Accepted as evidence / accepted with limitation / requires clarification / rejected / expired |
| Follow-up action and owner | Specific action and accountable role |
| Review date | Date |
| Reviewer sign-off | Restricted approval/review record reference |

## 3. Actor-specific evidence checklist

### A. Buyer / importer / wholesaler / processor

Capture one buyer record per organisation and, where relevant, one separate record per product–destination–buyer case.

- Legal identity and public business activity reference; contact authority and role.
- Product form, grade, specification, packaging, intended use and destination.
- Written specification version/date and whether buyer confirms it is current.
- Indicative quantity, unit, frequency, delivery window, seasonality and evidence basis.
- Price basis, currency, Incoterm/named place, payment terms and validity.
- Required supplier due diligence, licences, testing, certification and documents.
- Sample evaluation and acceptance/rejection process.
- Evidence of purchasing activity or sourcing process, where available.
- Permission to retain interview notes and share a minimised summary.
- Status: lead / contacted / interviewed / qualified prospect / specification received / conditional sourcing interest / not suitable / unverified.

**Do not record general interest as a purchase commitment or convert an indicative quantity into confirmed demand.**

### B. Producer / cooperative / aggregator

- Legal/operating identity and authority of the person representing the group.
- Membership/active producer count, source and date.
- Commodity, variety/type, product form, grade and production period.
- Monthly/seasonal gross production and method of calculation.
- Existing commitments, competing channels and deductions.
- Net saleable quantity available for the proposed buyer/time window.
- Historical delivery, rejection, quality and traceability evidence.
- Current equipment, measurement method, calibration and maintenance evidence.
- Current aggregation/storage/handling practices and actual custody owner.
- Producer participation conditions, costs, acceptable fees and governance concerns.
- Consent/data-use restrictions and authorised representative evidence.

**Distinguish gross production, current stock, forecast production and net uncommitted saleable supply.**

### C. Hub / facility / site

- Site identity, owner/operator, address and authorised contact.
- Exact activity requested: digital coordination only; evidence desk; intake/aggregation; storage/packhouse; laboratory/inspection. Do not assume one category authorizes another.
- Written permission, signatory authority, agreement term and restrictions.
- Physical inspection date, assessor and participants.
- Equipment inventory: device, ownership, condition, maintenance and calibration where relevant.
- Power availability, outage history and backup arrangements.
- ISP, network type, measured bandwidth/latency, Wi-Fi coverage and security segmentation.
- Connectivity tests at different times; test device, location, date/time and results.
- Offline duration/frequency observed and manual fallback procedure.
- Staffing, supervision, access hours, shift coverage and training.
- Safety, accessibility, insurance, incident/emergency procedures and liabilities.
- Itemised operating cost, payer, funding source and maintenance responsibility.
- Corrective actions, owner, due date and retest evidence.

**A site visit, public listing or verbal welcome does not constitute written permission or facility approval.**

### D. Service provider (logistics, clearing, laboratory, inspection, insurance, packaging, payment or technology)

- Legal entity, contracting entity, licence/accreditation/registration and validity.
- Exact service scope, commodity, route, destination, currency or jurisdiction served.
- Capacity, service levels, lead times, operating hours and constraints.
- Full itemised fees, minimums, surcharges, taxes, FX, cancellation and refund costs.
- Insurance, custody, loss/damage, delay, rejection, claims and liability terms.
- Data/security statement, processing locations, subprocessors and retention where data is involved.
- Contract, DPA, API specification, webhook/authentication and support documentation as applicable.
- References and verification method.
- Provider response status: supports / partly supports / does not support / inconclusive.

**A provider response is not qualification. Legal scope, capacity, price, liability and operational fit require review.**

## 4. Site connectivity test record

| Field | Entry |
|---|---|
| Site ID / test location | |
| Test date/time and timezone | |
| Assessor / role | |
| ISP / network type | |
| Device make/model / OS / browser | |
| Test method/tool and version | |
| Download / upload throughput | |
| Latency / jitter / packet loss | |
| Wi-Fi signal / coverage location | |
| Power state / backup state | |
| Upload test file size and result | |
| Video/call test if required | |
| Outage / interruption observed | |
| Repeat test times | |
| Offline capture / sync test reference | |
| Limitations / representativeness | |

Run repeat measurements at relevant times and locations. A single speed test is not a reliable site availability profile. Use only synthetic or approved non-sensitive test files.

## 5. Producer and buyer volume evidence

| Measure | Buyer-side value | Producer-side value | Unit / period | Evidence class | Source / date | Notes |
|---|---:|---:|---|---|---|---|
| Indicative order / available quantity | UNKNOWN | UNKNOWN | kg / tonnes / units per period | E1–E4 | | |
| Frequency / seasonality | UNKNOWN | UNKNOWN | orders or supply events per period | E1–E4 | | |
| Existing commitments | UNKNOWN | UNKNOWN | quantity and period | E1–E4 | | |
| Net available quantity | UNKNOWN | UNKNOWN | quantity after commitments and losses | E1–E4 | | |
| Product grade / form match | UNKNOWN | UNKNOWN | specification reference | E1–E4 | | |
| Delivery window | UNKNOWN | UNKNOWN | date range | E1–E4 | | |
| Price basis | UNKNOWN | UNKNOWN | currency/unit/Incoterm | E1–E4 | | |

Do not calculate an aggregated pilot supply figure until producer records are reconciled, overlapping commitments are removed and the unit/time basis is consistent.

## 6. Evidence review and decision states

Use separate states for the evidence item and the decision it informs.

**Evidence item state**
- Not requested
- Requested
- Received
- Under review
- Accepted with limitation
- Accepted
- Rejected
- Expired
- Superseded
- Contradictory / clarification required

**Decision gate state**
- Not assessed
- Pass
- Fail
- Unresolved
- Not applicable (with reason and reviewer)

Never translate “evidence received” directly into “gate passed.” A gate passes only when its defined pass condition is met and the authorized reviewer records the decision.

## 7. Aggregation and privacy rules

- Maintain a restricted master record for personal, commercial and provider-confidential data.
- In public repo reports, publish only approved aggregate values and non-identifying evidence references.
- Do not publish named buyer contacts, producer membership lists, identity documents, bank details, personal phone numbers, signatures, private quotations, credentials or confidential contracts.
- Small-cohort results can identify individuals or businesses even without names; suppress or generalize where needed.
- Apply purpose limitation, access control, retention and deletion rules only after the project's qualified privacy/legal review.
- Preserve source evidence and its review history under the approved evidence-governance process.

## 8. Return package checklist

Before a completed Phase 0 evidence package is submitted for review:

- [ ] Programme sponsor authorised the external instrument and collection activity.
- [ ] Instrument version and respondent/organisation category are recorded.
- [ ] Confidentiality, consent/other lawful basis and restrictions are recorded for review.
- [ ] Each material claim has its own evidence record ID.
- [ ] Source, date, scope, units and evidence class are present.
- [ ] Supporting files are stored in the restricted evidence repository.
- [ ] Contradictions, missing evidence, non-response and limitations are recorded.
- [ ] Reviewer and follow-up owner are identified.
- [ ] No public repository file contains unnecessary personal or confidential information.
- [ ] Decision gate is assessed separately from evidence receipt.
- [ ] No commitment, appointment, certification or approval is implied without the appropriate authority.

## 9. Relationship to programme records

- Deliverable 013 remains the source validation instrument; this template structures the return evidence.
- Deliverable 010 remains the site-readiness assessment; the connectivity table supplements, not replaces, a full site assessment.
- Deliverable 020 remains the route-level selection record; evidence items must be linked to the complete product–destination–buyer route.
- The WP-03 ECR register remains the decision-blocker index; each returned evidence item should reference one or more ECR IDs.
- The Evidence Register remains the controlled record of evidence and review; this template does not create a parallel authoritative evidence database.
- Technology workload/TCO and candidate scorecards may be updated only after source-backed findings are reviewed.

**No live pilot, procurement, technology spike, physical custody, payment or export is authorized by completion of this template.**
