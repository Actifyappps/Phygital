# ECR-02 — Workload profile consolidation record template

**Prepared:** 21 November 2026  
**Status:** BLANK CONTROLLED TEMPLATE — NOT A FIELD RETURN; NO VALUES APPROVED  
**Purpose:** Provide a repeatable record for consolidating reviewed PEM-EV evidence into a bounded workload profile and, later, comparable technology/TCO scenarios.

## 1. Use boundary

Use one controlled profile instance per defined pilot scope and review period. This template does not authorise external circulation, interviews, site visits, participant contact, provider engagement, collection of personal/commercial data, or any technology spike. The applicable programme approval and instrument authority must be confirmed before collection.

Keep raw personal, buyer, producer, financial, provider-confidential and site-security evidence in the approved restricted evidence repository. This public repository template must contain only non-identifying references and approved/minimised aggregates.

**Default value for every unsubstantiated measure: UNKNOWN.** A blank cell is not zero. A received return is not an accepted finding. An accepted evidence item is not a passed decision gate.

## 2. Profile identity and scope

| Field | Entry |
|---|---|
| Profile ID / version | NOT ASSIGNED |
| ECR | ECR-02 |
| Pilot scope reference | UNKNOWN |
| Commodity / product form / grade | UNKNOWN |
| Hub/site reference and permitted activity | UNKNOWN |
| Destination / buyer-case reference | UNKNOWN |
| Measurement / forecast period | UNKNOWN |
| Season or peak window | UNKNOWN |
| Instrument versions and authority reference | TO BE CONFIRMED |
| Consolidation owner / date | NOT ASSIGNED |
| Independent reviewer / date | NOT ASSIGNED |
| Privacy screening / publication disposition | NOT ASSESSED |
| Overall profile status | NOT STARTED |

## 3. Evidence lineage rules

Every value used in a profile must point to one or more PEM-EV evidence-item IDs and record:

- measure ID and exact definition;
- raw value, unit, period, scope and source date;
- source/issuer reference and evidence class (E1–E4);
- acquisition class where required by the Evidence Register protocol (Declared, Hub-recorded, Device-measured, Independently verified, Documentary/official, Technical test result);
- method, sample size, representativeness and limitations;
- normalised value, unit and conversion formula, if applicable;
- whether observed, documentary, declared, sponsor-approved, modelled or synthetic;
- reviewer, review date, acceptance/rejection and permitted decision use.

E1–E4 evidence strength and the Evidence Register acquisition-class taxonomy are separate dimensions. Do not map one mechanically to the other.

## 4. Consolidation ledger

Create one row per measure, scenario and materially distinct source. Add rows when sources conflict; do not overwrite a contradictory return. The identifiers below are the complete ECR-02 measure set.

| Measure ID | Required measure | Consolidated value | Unit / period / scope | Scenario (low/expected/high) | Basis (observed/documentary/declared/sponsor-approved/modelled/synthetic) | PEM-EV IDs | Evidence class / acquisition class | Reviewer / disposition |
|---|---|---|---|---|---|---|---|---|
| W-01 | Active users by role | UNKNOWN | users / month; by role | UNKNOWN | UNKNOWN | | | |
| W-02 | Organisations and memberships | UNKNOWN | organisations / memberships; active/seasonal | UNKNOWN | UNKNOWN | | | |
| W-03 | Peak concurrent sessions | UNKNOWN | sessions; window and role mix | UNKNOWN | UNKNOWN | | | |
| W-04 | Listings created and updated | UNKNOWN | listings / period | UNKNOWN | UNKNOWN | | | |
| W-05 | Batch records and batch events | UNKNOWN | batches and events / period | UNKNOWN | UNKNOWN | | | |
| W-06 | Measurement, inspection and evidence decisions | UNKNOWN | events / period by type | UNKNOWN | UNKNOWN | | | |
| W-07 | Buyer enquiries, quotations, accepted quotes and orders | UNKNOWN | each / period by stage | UNKNOWN | UNKNOWN | | | |
| W-08 | Allocation/reservation attempts, successes, conflicts and retries | UNKNOWN | attempts / period by outcome | UNKNOWN | UNKNOWN | | | |
| W-09 | Audit/domain events and provider callbacks | UNKNOWN | events / period by event type | UNKNOWN | UNKNOWN | | | |
| W-10 | Background jobs | UNKNOWN | jobs / period; payload and duration | UNKNOWN | UNKNOWN | | | |
| W-11 | Public QR/passport reads | UNKNOWN | reads / period and burst | UNKNOWN | UNKNOWN | | | |
| W-12 | Notifications | UNKNOWN | messages / period by channel/event/recipient | UNKNOWN | UNKNOWN | | | |
| D-01 | Private evidence file sizes | UNKNOWN | MB/file; type, average, p95, maximum | UNKNOWN | UNKNOWN | | | |
| D-02 | Private evidence file count | UNKNOWN | files / period by category | UNKNOWN | UNKNOWN | | | |
| D-03 | Public media volume and delivery | UNKNOWN | MB/GB / period; originals/variants/egress | UNKNOWN | UNKNOWN | | | |
| D-04 | Database growth | UNKNOWN | GB / period; records/indexes/audit | UNKNOWN | UNKNOWN | | | |
| D-05 | Retention by data class | UNKNOWN | approved period / trigger / class | UNKNOWN | UNKNOWN | | | |
| D-06 | Backup frequency and retention | UNKNOWN | interval / approved retention | UNKNOWN | UNKNOWN | | | |
| D-07 | Export/restore package | UNKNOWN | GB/event; frequency and scope | UNKNOWN | UNKNOWN | | | |
| D-08 | File scanning/quarantine | UNKNOWN | files / period; peak rate and outcomes | UNKNOWN | UNKNOWN | | | |
| C-01 | Site identity and permission | UNKNOWN | site/activity/permission validity | UNKNOWN | UNKNOWN | | | |
| C-02 | Network performance | UNKNOWN | Mbps, ms, jitter, loss; repeated times/zones | UNKNOWN | UNKNOWN | | | |
| C-03 | Outages and offline periods | UNKNOWN | duration/frequency; source and period | UNKNOWN | UNKNOWN | | | |
| C-04 | Shared-device and loss exposure | UNKNOWN | device/user/security profile | UNKNOWN | UNKNOWN | | | |
| C-05 | Device/browser/OS mix | UNKNOWN | versions and evidenced usage share | UNKNOWN | UNKNOWN | | | |
| C-06 | Data affordability | UNKNOWN | currency, bundle, cost/date/payer | UNKNOWN | UNKNOWN | | | |
| C-07 | Data geography | UNKNOWN | processing/storage/support/destination jurisdictions | UNKNOWN | UNKNOWN | | | |
| C-08 | Language/accessibility/assisted use | UNKNOWN | validated task and user needs | UNKNOWN | UNKNOWN | | | |
| O-01 | Application maintainer and backup | UNKNOWN | confirmed role, skills, availability | UNKNOWN | UNKNOWN | | | |
| O-02 | Security/privacy response ownership | UNKNOWN | accountable role and escalation | UNKNOWN | UNKNOWN | | | |
| O-03 | Deployment/release operator | UNKNOWN | confirmed role, access and runbook | UNKNOWN | UNKNOWN | | | |
| O-04 | Support coverage and response | UNKNOWN | hours/channel/severity/approved target | UNKNOWN | UNKNOWN | | | |
| O-05 | Database/file recovery responsibility | UNKNOWN | owner, procedure and tested cadence | UNKNOWN | UNKNOWN | | | |
| O-06 | Incident/provider escalation | UNKNOWN | internal owner and provider route | UNKNOWN | UNKNOWN | | | |
| O-07 | Monitoring/alert ownership | UNKNOWN | signals, thresholds, responder | UNKNOWN | UNKNOWN | | | |
| O-08 | Availability/RPO/RTO | UNKNOWN | approved objective by service/data class | UNKNOWN | UNKNOWN | | | |
| O-09 | Training and handover effort | UNKNOWN | role, hours, acceptance | UNKNOWN | UNKNOWN | | | |
| O-10 | Technical skills and continuity | UNKNOWN | demonstrated capability/backup coverage | UNKNOWN | UNKNOWN | | | |

## 5. Scenario construction and reconciliation

1. **Scope first:** do not combine different commodities, product forms, grades, seasons, destinations, hubs or buyer cases unless a documented equivalence rule justifies it.
2. **Demand and supply remain separate:** buyer enquiry/specification/indicative quantity is not an order; producer gross production is not current stock or net uncommitted saleable supply.
3. **Supply calculation:** only for matching units, product form, quality basis and period: net uncommitted saleable supply = eligible saleable quantity − existing commitments − evidenced losses/quality deductions − other prior claims.
4. **Deduplicate:** reconcile people across roles, organisations/memberships, repeated listings, batches, files and overlapping producer declarations. Retain role activity separately where relevant.
5. **Keep workflow stages distinct:** enquiry, qualified enquiry, quotation, accepted quote, order, allocation attempt, successful allocation, rejection, retry and conflict are not interchangeable.
6. **Preserve measurement context:** connectivity readings require time/timezone, location, ISP, device, method/version, power state and limitations. A single test is not a site availability profile.
7. **Normalise transparently:** preserve source/raw value and separately record conversion formula, rounding, currency/date and normalised result. Never discard the original unit.
8. **Construct low/expected/high only with a defensible basis:** identify source evidence or approved model, assumptions, sensitivity drivers and reviewer. Do not use arbitrary percentages or treat a synthetic test load as forecast demand.
9. **Conflicts and missingness:** retain contradictory rows and non-response; mark unresolved values UNKNOWN or disputed. Do not average incompatible sources.
10. **Approval:** an authorised reviewer accepts the evidence for a stated use; the profile does not itself close ECR-02, CV findings or EVI records.

## 6. Evidence-to-profile acceptance checklist

- [ ] Collection activity and instrument authority confirmed before external use.
- [ ] Profile scope, period, commodity/product form and site activity are explicit.
- [ ] Every material value has PEM-EV lineage and source date.
- [ ] Evidence strength and acquisition class are both represented where applicable.
- [ ] Raw values, units, normalisation formula and source restrictions are retained.
- [ ] Buyer demand is not conflated with producer supply or orders.
- [ ] Duplicates, overlap, seasonality, contradictions and non-response are addressed.
- [ ] Scenario values have explicit evidence/model basis; unsupported values remain UNKNOWN.
- [ ] Personal/commercial data are restricted and public aggregates privacy-screened.
- [ ] Independent review and authorised decision-use acceptance are recorded.

## 7. Handoff to workload/TCO and technology decisions

Only after review, transfer approved aggregate values to [technology workload, operating and TCO assumptions register](../decisions/technology-workload-and-tco-assumptions-register.md), preserving measure ID, scenario, unit, period, PEM-EV reference, evidence basis, confidence, reviewer and limitations.

TCO must remain NOT CALCULATED until candidate-specific plans and dated prices, validated workload, operating labour, recovery/retention requirements and comparable service assumptions are available. Volunteer or probono labour is not economically zero-cost; record cash cost and economic value separately.

The profile informs ECR-07 and candidate comparison; it does not select topology or technology. ADR-0002 topology decision precedes final ADR-0001 baseline approval. EVI-26 remains a separate authorization gate for any WP-05 spike.

## 8. Current disposition

No completed PEM-EV returns are consolidated by this template. All W-01–W-12, D-01–D-08, C-01–C-08 and O-01–O-10 values remain UNKNOWN in the current repository evidence set. ECR-02 remains **PARTIAL SOURCE EVIDENCE — NUMERIC BASELINE OPEN**.

This document does not authorise field collection, external contact, site access, participant data processing, procurement, provider provisioning, technology spike, production, live trade, custody, funds, dispatch or shipment.
