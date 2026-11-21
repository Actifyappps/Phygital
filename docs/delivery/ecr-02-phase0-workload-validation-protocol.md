# ECR-02 — Phase 0 workload and transaction profile validation protocol

**Prepared:** 21 November 2026  
**Project:** Phygital Export Marketplace  
**Request ID:** ECR-02  
**Status:** VALIDATION PROTOCOL — NOT FIELD EXECUTED; numeric inputs remain UNKNOWN  
**Purpose:** Turn existing Phase 0 instruments into a reproducible, source-backed workload profile for WP-03 technology, capacity and TCO assessment.

## 1. Decision question

What bounded, evidenced workload must the first Phygital pilot support, including users and organisations, listings and batches, buyer transactions, inventory/allocation events, evidence files, public reads, background jobs, connectivity conditions and operating coverage?

The current planning boundary — one commodity, one hub and a limited group of producers and buyers — is a scope constraint only. It does not establish numeric users, transactions, concurrency, file volumes, bandwidth, retention, service levels or cost.

No quantity in this protocol is a forecast or approved target until it is supported by evidence and reviewed.

## 2. Governing source inputs

| Source | What it can establish | What it cannot establish without completed returns |
|---|---|---|
| Deliverable 003 | Intended narrow pilot shape; commercial/operational questions | Actual buyer demand, producer supply, costs, participants or unit economics |
| Deliverable 011 | Proposed actors, workflow, human review and operating controls | Named role-holders, measured workload or demonstrated operating performance |
| Deliverable 013 | Buyer, producer, hub and provider validation questions | Completed responses, verified volumes, site measurements or provider commitments |
| Deliverable 010 | Site permission, equipment, power, staffing and connectivity assessment method | Appointed site, measured network/power performance or approved cost |
| Deliverable 019 | Minimum-documentation and Level 1 rehearsal workflow | Live demand, file volume, operator time or physical route approval |
| Deliverable 020 | Complete route definition and route feasibility method | Selected commodity, producer group, batch, buyer, seller/exporter, destination or route |

Use the approved version of each instrument and record its version/date in each evidence item. Do not circulate instruments externally unless the applicable programme approval is recorded.

## 3. Required evidence dimensions

All quantities must include unit, time basis, scope, source, date, evidence class, confidence and reviewer. Record low / expected / high only when each scenario has a defensible source or an explicitly approved modelling method. If not, enter UNKNOWN.

### 3.1 Actor and access profile

| Workload ID | Measure | Required segmentation | Evidence source |
|---|---|---|---|
| W-01 | Active users | Producer, cooperative, buyer, hub operator, seller/exporter, reviewer, administrator; distinguish registered, invited and monthly active | Validated actor roster and role activity assumptions |
| W-02 | Organisations and memberships | Organisation type, active membership count, multi-organisation users, seasonal/inactive accounts | Verified organisation roster and membership evidence |
| W-03 | Peak concurrent sessions | Role mix, time window, location, shared-device use, assisted sessions | Observed sessions where available; otherwise clearly labelled scenario with rationale |

Do not equate registered accounts with active users. A person holding multiple roles or organisation memberships must not be double-counted as a unique person, while role-specific activity may be counted separately where justified.

### 3.2 Domain and transaction activity

| Workload ID | Measure | Unit / period | Required basis |
|---|---|---|---|
| W-04 | Listings created/updated | Listings per month and peak week | Actual product/producer listing cadence |
| W-05 | Batch records and updates | Batches and batch events per period | Commodity, season, aggregation and update pattern |
| W-06 | Measurement, inspection and evidence decisions | Events per period | Events by evidence type, issuer and workflow stage |
| W-07 | Buyer enquiries, quotations and orders | Each per period | Buyer interview evidence; distinguish enquiry, quote, accepted quote and order |
| W-08 | Allocation/reservation attempts | Attempts per period, including retries/conflicts | Expected workflow; distinguish successful allocations from attempts and rejected/duplicate attempts |
| W-09 | Audit/domain events and provider callbacks | Events per period | Event types and expected event multiplicity per workflow |
| W-10 | Background jobs | Jobs per period, payload size, duration and retry rate | Job catalogue and observed/supported process timings |
| W-11 | Public QR/passport reads | Reads per period and burst | Pilot exposure, distribution method and scan scenario |
| W-12 | Notifications | Messages by channel, recipient and event | Notification catalogue, consent and operational process |

Do not treat every buyer enquiry as an order or every producer declaration as available stock. Do not multiply event counts without a defined workflow/event catalogue.

### 3.3 Data and file profile

| Data ID | Measure | Unit / period | Required basis |
|---|---|---|---|
| D-01 | Private evidence file size | Average, p95 and maximum MB/file where measurable | Representative file samples, type and capture method |
| D-02 | Private evidence file count | Files per month, by category | Evidence/document checklist and pilot workflow |
| D-03 | Public media volume | MB/GB per month and delivery pattern | Product images/video and public projection scope |
| D-04 | Database growth | GB per month including indexes/audit | Record counts, representative schema and retention assumptions |
| D-05 | Retention | Period by data class | Approved legal, contractual and governance decision |
| D-06 | Backup frequency/retention | Interval and days | Approved recovery design; not vendor default |
| D-07 | Export/restore package | GB per event and frequency | Representative data-plus-object export |
| D-08 | File scanning/quarantine | Files per period and peak rate | Upload profile and malware inspection policy |

A small number of large files may dominate storage and bandwidth. Do not estimate file volume using database record counts alone.

### 3.4 Site, device and connectivity profile

| Connectivity ID | Measure | Required evidence |
|---|---|---|
| C-01 | Site identity and permission | Site ID, activity scope, written permission and validity |
| C-02 | Network performance | Repeat upload/download, latency, jitter and packet-loss measurements at representative times/locations |
| C-03 | Outages/offline periods | Observed duration/frequency and source; distinguish measured history from respondent estimate |
| C-04 | Shared-device and device-loss exposure | Device ownership, user sharing, lock/logout, local data exposure and loss process |
| C-05 | Device/browser/OS matrix | Make/model, OS/browser versions and actual usage share where known |
| C-06 | Data affordability | Available bundles/cost evidence and practical constraints |
| C-07 | Data geography | Required processing, storage, support-access and destination jurisdictions, subject to legal review |
| C-08 | Language/accessibility/assisted use | Validated user needs, assistive technologies and workflow support |

For connectivity, retain each measurement's date/time/timezone, assessor, location, ISP/network, device, test method/version, upload/download, latency/jitter/loss, power state, interruption and limitations. Repeat at relevant times and site zones. A single speed test is not a site profile.

### 3.5 Operating capacity

| Operating ID | Measure | Evidence required |
|---|---|---|
| O-01–O-03 | Application, security and release ownership | Confirmed role, skills, availability and backup |
| O-04 | Support hours and response expectations | Approved coverage, channel, severity and escalation |
| O-05 | Database/file recovery ownership | Named role, procedure and test cadence |
| O-06–O-07 | Incident/provider escalation and monitoring | Contact/role, alert thresholds and responder |
| O-08 | Availability, RPO and RTO | Business rationale and authorised approval |
| O-09–O-10 | Training, handover and technical skills | Role-based effort, competence and continuity evidence |

A proposed role in a document is not an appointment. Volunteer/probono labour must be recorded separately from its economic value; it is not zero-cost operating capacity.

## 4. Producer supply and buyer demand reconciliation

For every commodity–product form–destination–buyer case, keep separate evidence for:

- buyer indicative quantity, frequency, delivery window and specification;
- producer gross production, current stock and forecast production;
- existing commitments and competing channels;
- quality/grade, rejection/loss deductions and aggregation constraints;
- net uncommitted saleable quantity for the matching period;
- seller/exporter authority and route feasibility.

A defensible net supply calculation may be made only when the underlying quantities share the same unit, product form, quality basis and period:

**Net uncommitted saleable supply** = eligible saleable quantity − existing commitments − evidenced losses/quality deductions − other prior claims.

Do not aggregate producers until overlapping commitments, unit conversions, product-form differences, seasonality and source reliability have been reconciled. Do not treat a buyer's indicative interest as a purchase order or a producer's gross production as available supply.

## 5. Deriving low / expected / high scenarios

1. Record the raw evidence item for each material claim using the PEM-EV return template.
2. Link each evidence item to ECR-02 and relevant Phase 0 Evidence IDs/CV Findings.
3. Preserve the original value, unit, period, respondent/source, method, date, evidence class and limitations.
4. Reconcile duplicate respondents, overlapping organisations, inconsistent units, incompatible product forms and conflicting periods.
5. Use a low / expected / high value only when the range can be traced to source evidence or an approved modelling rule.
6. Keep observed values separate from respondent declarations, sponsor-approved ceilings, modelled scenarios and synthetic test assumptions.
7. Record confidence and uncertainty explicitly. If a defensible range cannot be constructed, leave all three scenario cells UNKNOWN.
8. Obtain reviewer confirmation before the profile is used for TCO, sizing or candidate scoring.

Never use a synthetic spike workload as a real pilot forecast. Never reverse-engineer a target workload from a vendor free tier.

## 6. Minimum profile output

The completed ECR-02 package must contain:

- a pilot scope statement with selected/not-selected distinctions;
- actor and organisation profile with role and membership definitions;
- buyer demand and producer supply tables, kept separate until reconciled;
- workflow/event catalogue with per-transaction event multiplicity;
- monthly, peak-week and peak-hour workload where supported;
- private/public file profile and retention-by-class decision references;
- site/device/connectivity measurement records;
- operating coverage and named role ownership evidence;
- low / expected / high values with source, date, unit, confidence and reviewer;
- unresolved questions, contradictions, exclusions and explicit UNKNOWN values;
- an approved aggregate profile suitable for public repository use and a restricted source evidence index.

## 7. Evidence and privacy handling

- Keep raw interviews, personal data, named buyer/producer lists, private quotations, signatures, site security details and provider contracts in the approved restricted evidence repository.
- Public repository reports may contain only approved aggregate/minimised values and non-identifying evidence references.
- Suppress small-cohort values where they could identify a participant or business.
- Record consent or other lawful collection basis for review; this protocol does not determine legal sufficiency.
- Preserve negative findings, refusals, non-response, expired evidence and contradictions.
- Evidence receipt is not gate acceptance. A reviewer must separately assess the ECR-02 closure test.

## 8. Closure test and decision use

ECR-02 can be recommended for closure only when:

- [ ] Pilot scope and actor categories are confirmed by authorised programme decision.
- [ ] Buyer demand and producer supply evidence are independently recorded and reconciled.
- [ ] Workflow quantities and event multiplicity have a documented basis.
- [ ] Site/device/connectivity evidence is linked where it affects the workload.
- [ ] Low / expected / high workload scenarios are source-backed or explicitly remain UNKNOWN.
- [ ] Data/file/retention profile is supported and retention approvals are separately referenced.
- [ ] Operating capacity and coverage assumptions are evidenced.
- [ ] Contradictions, missing inputs and confidence are recorded.
- [ ] Privacy review permits the aggregate profile to be used for technology/TCO comparison.
- [ ] Independent reviewer accepts the profile and its limitations.

The profile informs ECR-05 provider-term comparison and ECR-07 TCO, as well as ADR-0001 component assessment. It does not approve a topology, provider, capacity commitment, SLA, RPO/RTO, synthetic spike or production deployment.

**Current disposition: ECR-02 remains PARTIAL SOURCE EVIDENCE — NUMERIC BASELINE OPEN.**
