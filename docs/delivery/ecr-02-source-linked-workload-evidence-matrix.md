# ECR-02 — Source-linked Phase 0 workload evidence matrix

**Prepared:** 21 November 2026  
**Status:** DESK-BASED CROSSWALK ONLY — NO FIELD RETURNS CONSOLIDATED; NUMERIC VALUES UNKNOWN  
**Purpose:** Map every ECR-02 input to the Phase 0 source capable of supplying evidence, the return method, existing register linkage and the rule for using the result.

## 1. Disposition

This document closes a traceability/documentation gap, not the ECR-02 validation request. The reviewed repository contains planning instruments and a blank evidence-return template; it does not contain completed buyer, producer, site or provider returns sufficient to establish numeric workload.

“One commodity, one hub and a limited group of producers and buyers” remains a planning boundary, not a numeric estimate. No user counts, concurrency, transactions, file volumes, bandwidth, retention, staffing, service levels or costs may be inferred from it.

**Current state:** W-01–W-12, D-01–D-08, C-01–C-08 and O-01–O-10 remain UNKNOWN in the technology workload/TCO assumptions register.

## 2. Source and record hierarchy

| Record | Purpose |
|---|---|
| Deliverables 003, 010, 011, 013, 019 and 020 | Approved planning/validation instruments, subject to their current version and circulation authority |
| `phase0-evidence-return-and-validation-record-template.md` | One PEM-EV evidence-item record per material claim, response, measurement or test |
| Notion Phase 0 Evidence Register | Requirement, validation-action and decision-gate register; not a row-per-interview database |
| ECR-02 protocol and this matrix | WP-03 workload evidence consolidation and decision-use controls |
| `technology-workload-and-tco-assumptions-register.md` | Consolidated workload, operating and TCO assumptions; update only after evidence review |

Do not create duplicate Notion rows for evidence returns. Link each PEM-EV item to ECR-02 and relevant existing Evidence IDs/CV Findings. Evidence received is not automatically accepted; acceptance is not automatically a passed gate.

## 3. Evidence classes and state vocabulary

Use the existing return template:
- **E1:** independently verified by a documented method.
- **E2:** documentary; authenticity, validity and scope still require review.
- **E3:** respondent/organisation declaration; not independently verified merely because signed or emailed.
- **E4:** assumption/unknown; not a measured finding.

Track four distinct states: instrument exists; evidence returned; evidence reviewed; decision accepted. Until a return is received and reviewed, use **UNKNOWN**. This means no supporting return was located in the reviewed repository source set, not that no information exists elsewhere.

## 4. Field-to-source crosswalk

### 4.1 Actors and access

| ID | Evidence source and collection route | Register linkage | Consolidation rule / current state |
|---|---|---|---|
| W-01 Active users by role | 013 buyer/producer/cooperative/hub/provider returns; 011 actor/workflow roles; authorised actor roster | CV-03 buyer; CV-04 producer; CV-05 hub; CV-07 organisation/role isolation; EVI-23 scope; CV-19 indicators | **UNKNOWN.** Separate registered, invited, active and role-active users; de-duplicate people across roles |
| W-02 Organisations and memberships | 013 identity, authority and membership evidence; 011 organisation/actor model; 010 site/operator identity | CV-03, CV-04, CV-05, CV-07, EVI-23 | **UNKNOWN.** Count organisations, people, memberships and seasonal/inactive memberships separately |
| W-03 Peak concurrent sessions | 013 actor/site activity; 011 operating workflow; 010 repeat site observation | CV-05, CV-19, EVI-23, CV-18 | **UNKNOWN.** Participant count does not establish concurrency; record role mix, time window, shared-device and assisted-use basis |

### 4.2 Domain and transaction activity

| ID | Evidence source and collection route | Register linkage | Consolidation rule / current state |
|---|---|---|---|
| W-04 Listings | 013 producer/product information; 011 listing workflow; 019 minimum product record | CV-04, CV-06, CV-19 | **UNKNOWN.** Separate creation, revision and status changes; avoid duplicate/import counts |
| W-05 Batches and updates | 013 supply/seasonality; 020 route/batch definition; 011 workflow; 019 minimum batch evidence | CV-04, CV-06, CV-08 inventory/allocation, CV-09 batch states/units | **UNKNOWN.** Count distinct batches separately from batch events; retain commodity, form, season and aggregation basis |
| W-06 Measurements, inspections, evidence decisions | 013 producer/hub/provider returns; 010 equipment/site assessment; 008 commodity/destination requirements; 011 human review; 019 conditional documents; 020 route requirements | CV-04, CV-05, CV-09, CV-10 audit, CV-11 provenance, CV-19 | **UNKNOWN.** Distinguish declaration, hub observation/device measurement, documentary review and independent inspection |
| W-07 Buyer enquiries, quotes, orders | 013 buyer interview/specification/quantity/frequency; 003 commercial assumptions; 011 enquiry-to-order workflow; 020 buyer/product/route match | CV-03, CV-01 seller/exporter roles, CV-13 commercial model, CV-19 | **UNKNOWN.** Keep enquiry, qualified enquiry, quotation, accepted quote and order separate; interest is not an order |
| W-08 Allocation/reservation attempts | 011 allocation/exception workflow; 019 rehearsal flow; 020 batch/route case; 024 domain rules | CV-06 invariants, CV-08 atomic allocation, CV-09 batch states/units, CV-19 | **UNKNOWN.** Separate success, rejection, retry, conflict and duplicate; attempts are not orders |
| W-09 Audit/domain events and callbacks | 011 workflow/audit requirements; 024 event and logical-operation catalogues; 019 evidence lifecycle | CV-10 audit integrity, CV-11 provenance/idempotency, CV-06 invariants | **UNKNOWN.** Derive multiplicity from a versioned event catalogue; distinguish internal events from external callbacks |
| W-10 Background jobs | 011 scheduled/operational workflow; 019 process stages; 024 logical operations | CV-18 dependencies, CV-11 event handling, CV-19 | **UNKNOWN.** Record job type, trigger, payload, duration, retries and failure handling; synthetic timings stay synthetic |
| W-11 Public QR/passport reads | 019 public/minimum-documentation projection; 011 public-facing workflow; 020 route/product case | CV-19, EVI-23, CV-17 privacy where public disclosure applies | **UNKNOWN.** No exposure/read rate established; define public fields and privacy boundaries first |
| W-12 Notifications | 011 actor communications, workflow and consent; 013 contact/process preferences; notification catalogue | CV-17 purpose/privacy/retention, CV-11 event handling, CV-19 | **UNKNOWN.** Count by event, channel, recipient and retry; do not assume every user receives every event |

### 4.3 Data and files

| ID | Evidence source and collection route | Register linkage | Consolidation rule / current state |
|---|---|---|---|
| D-01 Private file size | 013 document/evidence checklist and authorised representative samples; 019 document list | CV-17, CV-19, EVI-22 | **UNKNOWN.** Measure by file type; retain average/p95/maximum only where sample supports it |
| D-02 Private file count | 013 evidence/document responses; 019 document triggers; 011 workflow stages | CV-17, CV-19, EVI-22 | **UNKNOWN.** Count by category and trigger; distinguish unique evidence from duplicate copies |
| D-03 Public media volume | 013 product/media needs; 019 public record; 011 public projection | CV-17, CV-19, EVI-23 | **UNKNOWN.** Separate originals, variants, thumbnails, delivery and egress |
| D-04 Database growth | No instrument gives measured growth; 011 workflow and 024 model inform later schema-based modelling | CV-10, CV-12 database/migration tests, CV-06, CV-19 | **UNKNOWN.** Model from validated records/events and documented schema; label modelled, not observed |
| D-05 Retention by class | 011 privacy/audit requirements; 019 evidence preservation; 013 provider data/security responses; legal/privacy review | CV-17, EVI-29, EVI-22 | **UNKNOWN — approval required.** No instrument prompt or vendor default approves retention |
| D-06 Backup frequency/retention | No approved schedule in Phase 0 instruments; EVI-29 recovery decision and candidate terms are required | EVI-29, CV-12, CV-17 | **UNKNOWN — approval required.** Vendor defaults are not requirements |
| D-07 Export/restore package | No measured representative package located; EVI-29 restore protocol and authorised data-plus-object rehearsal | EVI-29, CV-12, EVI-22 | **UNKNOWN.** Measure only in an authorised environment using synthetic/approved data |
| D-08 File scanning/quarantine | 011 security controls; 013 provider security response; ECR-11 test plan | CV-17, CV-11, ECR-11 | **UNKNOWN.** Define file types/sizes, scan outcomes, quarantine and retry before throughput modelling |

### 4.4 Site, device and connectivity

| ID | Evidence source and collection route | Register linkage | Consolidation rule / current state |
|---|---|---|---|
| C-01 Site identity/permission | 010 site assessment and written permission; 013 hub checklist; 003 pilot assumptions | CV-05 primary; EVI-23 scope | **UNKNOWN.** No site appointment or permission inferred; record activity scope and validity |
| C-02 Network performance | 010 repeated tests; 013 connectivity responses; template connectivity record | CV-05, CV-19, ECR-03 | **UNKNOWN.** Preserve time/timezone, location, ISP, device, method, upload/download, latency/jitter/loss and limitations |
| C-03 Outages/offline periods | 010 uptime/outage assessment; 013 respondent history; 019 offline/manual fallback | CV-05, CV-19, EVI-23 | **UNKNOWN.** Separate observed logs, respondent estimates and simulated tests |
| C-04 Shared-device/loss exposure | 010 equipment/security inspection; 013 operator practices; 011 access/session controls | CV-05, CV-07, CV-17 | **UNKNOWN.** Record ownership, sharing, lock/logout, local data exposure and loss response |
| C-05 Device/browser/OS mix | 010 equipment inventory; 013 user/device information; authorised compatibility observations | CV-05, CV-19 | **UNKNOWN.** Site inventory alone does not establish participant device mix |
| C-06 Data affordability | 010 ISP/connectivity costs; 013 affordability responses and dated bundle evidence | CV-05, CV-13, CV-19 | **UNKNOWN.** Record currency/date, bundle, location and payer |
| C-07 Data geography | 013 provider processing/security locations; 011 sharing boundaries; ECR-04 legal/privacy review and candidate terms | CV-17, CV-14, EVI-28 dependency | **UNKNOWN — legal/provider review required.** Separate hosting, backup, support access, subprocessors and destination jurisdictions |
| C-08 Language/accessibility/assisted use | 013 participant needs; 011 roles/workflows; 019 assisted/minimum-documentation process | CV-03, CV-04, CV-05, CV-17, CV-19 | **UNKNOWN.** Validate by group and task; do not infer from geography |

### 4.5 Operating capacity

| ID | Evidence source and collection route | Register linkage | Consolidation rule / current state |
|---|---|---|---|
| O-01 Application maintainer/backup | 011 role design; actual role-holder confirmation; 010 staffing/skills; 013 operator response | CV-05, CV-18, EVI-23 | **UNKNOWN.** Proposed role labels are not appointments; confirm skills, availability and backup |
| O-02 Security/privacy response | 011 incident/privacy controls; 013 provider security/support response; ECR-04 review | CV-17, CV-18, CV-14 | **UNKNOWN.** Confirm internal accountability separately from provider support |
| O-03 Deployment/release operator | 011 operating workflow; 010 staffing/skills; 013 provider capability; AADDG role requirements | CV-18, CV-14, EVI-23 | **UNKNOWN.** No deployment target or operator is appointed |
| O-04 Support hours/response | 010 staffing/access hours; 011 exception workflow; 013 provider service response | CV-05, CV-14, CV-18 | **UNKNOWN.** No support SLA or response target approved |
| O-05 Database/file recovery | 011 continuity controls; EVI-29; 010 site/power context; provider terms when obtained | EVI-29, CV-12, CV-18 | **UNKNOWN.** Cover database and associated private objects |
| O-06 Incident/provider escalation | 010 maintenance/emergency contacts; 011 incident handling; 013 provider escalation/remedies | CV-05, CV-14, CV-17, CV-18 | **UNKNOWN.** Separate internal accountable role from provider contact |
| O-07 Monitoring/alert ownership | 011 operating controls; 013 provider monitoring/support response; AADDG | CV-14, CV-18, CV-19 | **UNKNOWN.** No thresholds, routing or responder approved |
| O-08 Availability/RPO/RTO | Business-impact assessment and authorised decision; EVI-29/ECR-08; candidate provider terms | EVI-29, CV-17, CV-18 | **UNKNOWN — governance decision required.** No target inferred |
| O-09 Training/handover | 010 training/staffing; 011 role workflow; 013 operator capability; time records if available | CV-05, CV-18, CV-19 | **UNKNOWN.** Record role, task, hours, trainer and acceptance |
| O-10 Technical skills/continuity | 010 skills assessment; 013 provider technical capacity; actual skills/availability evidence | CV-05, CV-14, CV-18 | **UNKNOWN.** Record evidence, availability, backup and knowledge-concentration risk |

## 5. Buyer demand and producer supply reconciliation

Keep two separate evidence streams for each commodity–product form–destination–buyer case.

**Buyer demand:** organisation/authority; written specification and version; indicative quantity/unit/frequency/season/delivery window; price basis/currency/terms if supplied; purchasing process; actual purchasing evidence; response status.

**Producer supply:** organisation/representation authority; membership basis/date; gross production, current stock and forecast kept separate; product form/grade/season and measurement method; existing commitments/competing channels; evidenced losses/quality deductions; net uncommitted saleable quantity for the matching period.

Only reconcile when units, product form, quality basis and period match:

**Net uncommitted saleable supply** = eligible saleable quantity − existing commitments − evidenced losses/quality deductions − other prior claims.

Do not aggregate overlapping producer declarations. Indicative interest is not an order; gross production is not available supply. Preserve contradictions and non-response.

## 6. PEM-EV return and consolidation procedure

1. Confirm current instrument version and recorded authority for external collection. This matrix and the blank template do not authorise circulation or contact.
2. Create one PEM-EV item per material claim, interview finding, site measurement, provider response or test.
3. Record issuer/source, date/validity, unit, period, scope, method, evidence class, restricted evidence reference, verifier, limitations and confidentiality restrictions.
4. Link the PEM-EV item to ECR-02 and relevant existing CV/EVI records. Do not create duplicate Notion rows.
5. Reconcile duplicates, overlapping organisations, conflicting values, units, product forms, periods, seasonality and source quality.
6. Preserve raw and normalised values separately; record conversion formula and reviewer.
7. Label the basis as observed, documentary, declared, sponsor-approved, modelled or synthetic. These are not interchangeable.
8. Populate low/expected/high only where source evidence or an explicitly approved modelling rule supports each value. Otherwise retain UNKNOWN.
9. Publish only approved, privacy-screened aggregates; keep raw personal/commercial evidence restricted.
10. Obtain independent review before using the profile for sizing or TCO.

Minimum consolidation fields: unique profile ID; PEM-EV IDs; ECR/CV/EVI links; measure ID; normalised value or UNKNOWN; unit/period/scope; scenario; evidence basis; source/date; method; confidence/limitations; reviewer/date; decision use; privacy disposition.

## 7. Register linkage and decision use

The existing ECR-to-register crosswalk identifies ECR-02 as distributed across CV-03 (buyer volume/specification), CV-04 (producer supply/seasonality), CV-05 (site readiness), CV-13 (commercial costs/economics), CV-18 (dependency plan), CV-19 (numeric indicators), CV-07 (organisation/role isolation) and EVI-23 (pilot scope/stop conditions). Other CV references in the field tables are supporting technical controls, not substitutes for field returns.

EVI-25–EVI-29 do not create a dedicated ECR-02 record and must not be repurposed. A related CV/EVI closure does not automatically close ECR-02.

When evidence is accepted, update the assumptions register with value, unit, period, scenario, source/date, confidence, evidence class, PEM-EV ID and reviewer. Preserve UNKNOWN for unsupported fields. TCO remains uncalculated until comparable candidate plans, dated prices, validated workload and labour inputs exist.

## 8. Closure boundary

This matrix does not close ECR-02 or any CV/EVI record; authorise Deliverable 013 circulation/contact; appoint participants/operators/providers; select a commodity/site/route/technology; approve budget, TCO, SLA, availability, RPO/RTO or retention; or authorise WP-05, procurement, production, real participant data, payment, custody, dispatch or shipment.

**Current disposition: ECR-02 remains PARTIAL SOURCE EVIDENCE — NUMERIC BASELINE OPEN.**
