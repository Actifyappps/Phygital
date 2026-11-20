# Technology workload, operating and TCO assumptions register

**Review date:** 20 November 2026  
**Status:** Evidence collection template. No workload figures, provider prices, capacity targets, budget or service levels are approved by this document.  
**Related:** ADR-0001; ADR-0002; TSBBF v1.0; technology decision requirements baseline; technology component register.

## 1. Use and evidence discipline

This register collects the assumptions needed to compare technology candidates fairly. It is not a forecast and must not be completed by guessing.

For each field, record:
- value or **UNKNOWN**;
- unit and measurement period;
- low / expected / high case where applicable;
- source and date;
- accountable source owner or validation method;
- confidence (high / medium / low / unknown);
- whether the value is observed, sponsor-approved, estimated or a temporary test assumption.

Do not use a temporary synthetic-spike assumption as a forecast of real pilot demand. Keep personal, buyer, producer, financial and commercially sensitive source data out of the public repository; store only approved aggregate/minimised evidence here.

## 2. Demand and workload inputs

| ID | Input | Unit / period | Low | Expected | High | Source / date / confidence |
|---|---|---|---|---|---|---|
| W-01 | Active users by role (producer, cooperative, buyer, hub operator, reviewer, administrator) | users / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-02 | Active organisations and memberships | organisations / memberships | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-03 | Peak concurrent sessions | sessions | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-04 | New/updated product listings | listings / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-05 | Batch records and batch updates | records / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-06 | Measurements, inspections and evidence decisions | events / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-07 | Buyer enquiries, quotations and orders | transactions / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-08 | Reservations/allocation attempts, including retries/conflicts | operations / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-09 | Audit/domain events and provider callbacks | events / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-10 | Scheduled/background jobs and expected duration | jobs / month; seconds/job | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-11 | Public QR/passport reads | reads / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| W-12 | Notifications by channel and destination | messages / month | UNKNOWN | UNKNOWN | UNKNOWN | |

## 3. Data, files and retention inputs

| ID | Input | Unit / period | Low | Expected | High | Source / date / confidence |
|---|---|---|---|---|---|---|
| D-01 | Average and maximum private evidence file size | MB / file | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-02 | Number of uploaded files | files / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-03 | Public product/media asset volume | MB or GB / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-04 | Database growth (including indexes and audit history) | GB / month | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-05 | Retention period by data/evidence class | months/years | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-06 | Backup frequency and retention requirement | interval / days | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-07 | Export/restore package size and frequency | GB / event | UNKNOWN | UNKNOWN | UNKNOWN | |
| D-08 | File scanning/quarantine throughput | files / month | UNKNOWN | UNKNOWN | UNKNOWN | |

Do not infer a retention period from a vendor's default. Retention and deletion require the applicable legal, contractual and evidence-governance decision.

## 4. Connectivity, device and geography inputs

| ID | Input | Unit / description | Current evidence |
|---|---|---|---|
| C-01 | Pilot hub locations and connectivity profile | locations; available network types | UNKNOWN |
| C-02 | Typical and worst observed bandwidth/latency | Mbps; ms | UNKNOWN |
| C-03 | Expected offline duration and frequency | hours/days; episodes/month | UNKNOWN |
| C-04 | Shared-device and device-loss exposure | device/user profile | UNKNOWN |
| C-05 | Supported device/browser/OS mix | versions and share | UNKNOWN |
| C-06 | Data affordability and mobile-data constraints | cost/GB or qualitative evidence | UNKNOWN |
| C-07 | Required data region, transfer locations and destination jurisdictions | jurisdictions | UNKNOWN |
| C-08 | Language, accessibility and assisted-use needs | validated requirements | UNKNOWN |

## 5. Operating capacity and service assumptions

| ID | Input | Required evidence | Current position |
|---|---|---|---|
| O-01 | Named application maintainer and backup | accountable role, skills and availability | UNKNOWN |
| O-02 | Security/privacy response ownership | escalation route and response responsibility | UNKNOWN |
| O-03 | Deployment and release operator | role, access controls and runbook | UNKNOWN |
| O-04 | Support coverage and response expectations | hours, channel, severity and escalation | UNKNOWN |
| O-05 | Database and file recovery responsibility | owner, restore procedure and test cadence | UNKNOWN |
| O-06 | Incident and provider escalation route | named role/contractual contact | UNKNOWN |
| O-07 | Monitoring and alert ownership | service signals, alert thresholds and responder | UNKNOWN |
| O-08 | Required availability, recovery point and recovery time | approved target and rationale | UNKNOWN |
| O-09 | Training and handover effort | roles, hours and acceptance | UNKNOWN |
| O-10 | Skills available for selected technologies | evidence of capability and coverage | UNKNOWN |

No uptime target, RTO, RPO, support SLA or on-call commitment is created by this template.

## 6. Candidate cost model

Complete one copy per candidate/component bundle. Compare equivalent capacity, region, retention, security, support and service level. Separate recurring vendor charges from labour and one-off implementation.

| Cost category | Year 1 | Year 2 | Year 3 | Evidence / assumption |
|---|---:|---:|---:|---|
| Base subscriptions and plans | UNKNOWN | UNKNOWN | UNKNOWN | |
| Application/API compute | UNKNOWN | UNKNOWN | UNKNOWN | |
| Database compute/storage/IO | UNKNOWN | UNKNOWN | UNKNOWN | |
| Private file storage and operations | UNKNOWN | UNKNOWN | UNKNOWN | |
| Bandwidth, egress and CDN | UNKNOWN | UNKNOWN | UNKNOWN | |
| Workers, queues and scheduled jobs | UNKNOWN | UNKNOWN | UNKNOWN | |
| Email/SMS and external API usage | UNKNOWN | UNKNOWN | UNKNOWN | |
| Logs, metrics, traces and alerting | UNKNOWN | UNKNOWN | UNKNOWN | |
| Backup, restore and retention | UNKNOWN | UNKNOWN | UNKNOWN | |
| Security scanning and assurance | UNKNOWN | UNKNOWN | UNKNOWN | |
| Support and premium service plans | UNKNOWN | UNKNOWN | UNKNOWN | |
| Setup, migration and integration labour | UNKNOWN | UNKNOWN | UNKNOWN | |
| Maintenance, upgrades and incident labour | UNKNOWN | UNKNOWN | UNKNOWN | |
| Training and handover | UNKNOWN | UNKNOWN | UNKNOWN | |
| Export, replacement and exit | UNKNOWN | UNKNOWN | UNKNOWN | |
| **Total cost of ownership** | **NOT CALCULATED** | **NOT CALCULATED** | **NOT CALCULATED** | |

Calculate each scenario only when source-backed inputs exist:

**Annual TCO** = subscriptions + metered usage + support + infrastructure + security/assurance + backup/recovery + implementation/migration labour + maintenance/operations labour + training + expected exit provision.

Do not omit people-costs because they are unpaid or founder-contributed. Record probono/volunteer contributions separately from the economic cost so the platform is not mistaken for cost-free to operate.

## 7. Candidate comparison controls

Before comparing costs:
- confirm commercial use is permitted by the exact plan and terms;
- capture dated quotas, throttling, overage, suspension and upgrade rules;
- compare the same geography, security, retention, backup and support requirements;
- include egress, object operations, worker runtime, log retention and external API charges;
- include support and operator time, not only subscription fees;
- verify data export, restore and replacement costs;
- record currency, tax treatment and exchange-rate date where relevant;
- show low/expected/high scenarios and the sensitivity drivers;
- retain source links or evidence references for each material input.

## 8. Gate status

| Gate | Required before status changes | Current state |
|---|---|---|
| Workload baseline | Pilot population, volumes, concurrency and connectivity evidenced or explicitly bounded | OPEN |
| Operating model | Accountable maintainer, support, incident and recovery roles identified | OPEN |
| Cost baseline | Candidate-specific, dated low/base/high 12/24/36-month TCO | OPEN |
| Service/recovery targets | Approved rationale for availability, RTO/RPO and support expectations | OPEN |
| Candidate comparison | Equivalent assumptions and current commercial/security evidence | OPEN |

## 9. Current disposition

All workload, operating and cost values remain UNKNOWN until validated. This register does not create pilot demand forecasts, budget, vendor price comparison, service levels, staffing appointments or approval. ADR-0001/0002 remain OPEN; no candidate is scored or shortlisted. Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED; EVI-21 remains OPEN.
