# 024-H delivery, operations and observability coverage assessment

**Review date:** 20 November 2026
**Source basis:** 024-R F-03/F-04/F-06/F-08/F-11/F-12; 024-B v0.1; 024-C v0.1; 024-D v0.1; 024-G v0.1; Technical Development Manual v3.0; Actify AADDG v1.0 and TSBBF v1.0.
**Status:** Derived source-to-repository coverage assessment and commissioning brief. **Not** the missing canonical 024-H specification, not a replacement for it, and not an approval of operational design or production readiness.

## 1. Determination

Targeted searches of the current Phygital Project Home and connected Notion workspace did not locate a completed 024-H page. 024-C and 024-G both identify 024-H as a downstream delivery/operations/observability specification. 024-R allocates related completeness requirements to that companion.

The repository already contains substantial distributed requirements and templates. They are not yet a single reviewed 024-H specification, and they do not establish a running service, appointed support team, accepted operational targets or production readiness.

**Disposition:** retain the source-gap record, preserve the existing design homes, and ask the programme owner to confirm whether 024-H is planned, stored elsewhere, renumbered or should be commissioned. Do not silently promote this assessment into a canonical 024-H.

## 2. Source-defined scope

| Source | Required delivery/operations scope | Repository status |
|---|---|---|
| 024-C §15 | Support ownership, deployment stages, monitoring, backup/restore, incident runbooks and operational metrics | Distributed homes exist; not consolidated or accepted as 024-H |
| 024-G §10 | Release/deployment, environment/configuration and operational-readiness controls subordinate to AADDG/TSBBF | Release gates, environment and rollback controls represented; execution absent |
| 024-R F-03 | Keep software delivery stages distinct from pilot maturity levels | docs/product/maturity-axes-and-gates.md; WF-18; gate records |
| 024-R F-04 | Withdrawal/recall operational ownership, traceability, notification and release authority | docs/product-integrity/withdrawal-recall-and-traceability.md; product-integrity domain |
| 024-R F-06 | Trust report, moderation, appeal, reinstatement and abuse handling | docs/marketplace-trust/; cases and security homes |
| 024-R F-08 | Commodity/destination rule ownership, review cadence, supersession and stale-rule holds | docs/compliance/commodity-destination-rule-governance.md and compliance domain |
| 024-R F-11 | Named commercial/operational owners, support, escalation, partner handoffs, cost and continuity | docs/operations/service-ownership-and-support-model.md; role placeholders only |
| 024-R F-12 | Producer/buyer outcome measures, metric definitions, baselines, ownership and evidence | docs/measurement/; metric requirements represented, baselines/targets unconfirmed |
| AADDG v1.0 | Reproducible build/deploy lifecycle, secrets, workers, integrations, observability, backup/restore, rollback and release control | Requirements mapped; runtime, CI and deployment not provisioned |
| TSBBF v1.0 | Component selection, TCO, supportability, licence, reliability, portability and exit | Workbook exists; no candidate scored or selected |
| Technical Development Manual v3.0 §§3.2–3.4 | Modular logical architecture, API/backend, private files, background jobs and environment separation | Candidate logical architecture; no final framework/topology/provider decision |

## 3. Repository coverage and actual status

| Capability | Current repository home | What is represented | What is not established |
|---|---|---|---|
| Operational identity | docs/delivery/application-operational-identity-register.md | Actual answers for repository, backend, deployment, production URL and worker/edge runtime | Only GitHub repository exists; backend/deployment/production URL/worker runtime unprovisioned |
| Environment/configuration | docs/delivery/environment-and-promotion-model.md; docs/delivery/environments.md; infra/environments/ | Environment separation, secret handling, same-build promotion and synthetic-data rules | No provisioned environments or promotion pipeline |
| Release/rollback | docs/delivery/release-gates.md; docs/delivery/release-and-rollback-checklist.md | G0–G4 and release/rollback requirements | No release execution or deployed artefact |
| Backup/restore | docs/delivery/backup-restore.md | Explicit requirement to define scope, frequency, encryption, retention, objectives and rehearsal | File explicitly states no backup capability is claimed; no RTO/RPO selected or restore rehearsal evidenced |
| Observability | docs/delivery/observability.md; infra/monitoring/ | Structured log/metric/trace/alert requirements and privacy boundary | No running telemetry, dashboards, alerts or SLOs |
| Incident response | docs/operations/incident-response.md; security runbooks | Incident record, containment, evidence, legal/privacy review, recovery and exercise requirements | No appointed incident commander/on-call roster, communications authority or exercise evidence |
| Exception/reconciliation | docs/operations/exception-and-reconciliation-management.md; cases domain | Exception classes, safe-state rules, owner/reviewer/evidence fields | No operating team, live queue or actual service operation |
| Support/service ownership | docs/operations/service-ownership-and-support-model.md | Service types, responsibility separation, support/escalation design questions | No named role-holders, channels, operating hours, approved response targets or cost owners |
| Runbooks | docs/delivery/runbooks/README.md; docs/operations/runbooks/README.md | Reserved locations and authoring boundary | No approved, environment-specific operational runbooks |
| Provider continuity | docs/integrations/; docs/operations/partner-and-provider-readiness.md; TSBBF | Replaceable adapters, due diligence, provider outage and exit considerations | No provider is selected, contracted or connected |
| Operational metrics | docs/measurement/; 024-C ENT-062/063; 024-B WF-18 | Metric definitions, observations, source and denominator requirements | No validated baselines, numeric targets, named metric owners or production telemetry |
| Operational cost | TSBBF workbook; operations and commerce design homes | TCO and service-cost categories | No evidenced workload, support staffing, supplier quotes or approved operating budget |

## 4. Important distinctions and boundaries

1. **Software stage is not pilot maturity.** A build, test or deployment stage cannot authorize physical activity. Pilot levels remain separately gated.
2. **Platform support is not party authority.** Support/admin roles do not become seller, exporter, custodian, payment processor or regulator.
3. **Operational service catalogue is not commercial fee catalogue.** Support tasks, ownership and escalation belong in the 024-H operational scope. Payer, charging event, fee basis, tax, refunds, provider shares and producer net proceeds belong in the separate 025/F-05 commercial design.
4. **Backup policy is not recovery evidence.** A written restore procedure is not a successful restore rehearsal.
5. **Monitoring design is not service observability.** Placeholder folders and requirements do not mean telemetry is running.
6. **Runbook template is not staffed response capability.** Named accountable roles, access, contact paths, exercises and evidence are required.
7. **Provider adapter design is not a partner commitment.** No provider, government agency, laboratory, carrier, bank or identity service is presumed available.
8. **No service levels should be invented.** SLA/SLO, availability, support hours, RTO/RPO, alert thresholds and performance targets require workload, business-impact, staffing and cost evidence plus authorized approval.

## 5. Proposed commissioning outline if 024-H is confirmed

This is a suggested contents outline for programme-owner consideration, not a substitute specification.

| Proposed section | Minimum content | Required decision/evidence |
|---|---|---|
| H-01 Authority and scope | Source hierarchy, 024-B/C/D/F/G dependencies, AADDG/TSBBF authority, exclusions | Programme owner confirms scope and document status |
| H-02 Service architecture | Runtime components, boundaries, data locations, trust zones and dependency map | ADR-0001/0002 and TSBBF evidence |
| H-03 Environment and configuration | Local/test/staging/production model, secrets, access, configuration and promotion | Approved topology and environment identities |
| H-04 Build, release and rollback | Reproducible pipeline, artefact identity, approvals, migration gates, rollback/forward-fix | AADDG-compliant build and release evidence |
| H-05 Observability | Logs, metrics, traces, correlation, alerts, dashboards, retention and access | Threat/privacy review and operating owner |
| H-06 Backup, restore and continuity | Data/files scope, frequency, encryption, retention, restore, reconciliation, RTO/RPO | Business-impact and data-loss tolerance; tested restore |
| H-07 Incident and problem management | Severity, command, containment, escalation, evidence, notifications, recovery and review | Named authority, contact path and exercises |
| H-08 Support and service ownership | Service catalogue, RACI, channels, hours, escalation, handoffs and continuity | Appointed organisations/roles and costed capacity |
| H-09 Provider/vendor continuity | Provider dependency, outage, exit, export, substitution, key rotation and fallback | Due diligence, contracts and tested exit/recovery |
| H-10 Cost and operational sustainability | Hosting, storage, bandwidth, worker, support, monitoring, backup, licence and exit cost | TSBBF low/base/high TCO and accountable budget owner |
| H-11 Operational metrics | Definitions, numerator/denominator, source, owner, cadence, privacy and targets | Baseline evidence and authorized targets |
| H-12 Readiness and acceptance | Runbook rehearsal, incident/restore exercises, support readiness, defects and independent review | Explicit G3/G4 decision and delegated authority |

## 6. Dependencies that must be resolved or explicitly gated

- Canonical Developer Guide v0.1 must be recovered and reconciled with Technical Development Manual v3.0 before formal architecture scoring.
- ADR-0001 and ADR-0002 remain OPEN; no stack or topology is selected.
- API-OD-01–12 remain open; no API protocol, event transport or provider is selected.
- 024-H source page remains not located in targeted search; programme-owner disposition is required.
- Deliverable 025 dedicated page remains not located; keep it separate from 024-H and confirm whether planned, stored elsewhere or renumbered.
- Named operational owners, support capacity, service hours, costs, incident contacts and provider commitments remain unconfirmed.
- No SLA/SLO, RTO/RPO, uptime, performance or response target is authorized by this assessment.

## 7. Current non-authorizations

- No production backend, database, deployment, CI runtime, worker runtime or live telemetry service is provisioned.
- No backup/restore capability or successful restore exercise is claimed.
- No live partner/provider integration or real participant data processing is authorized.
- Migration 001 remains **HOLD**; Migration 002 remains **NOT AUTHORISED**.
- EVI-21 remains **OPEN**, Closure Accepted **NO**.
- No live trade, custody, platform-held funds, escrow, payment initiation, dispatch or shipment is authorized.

**Conclusion:** The repository has meaningful building blocks for 024-H, but the canonical source gap and operational decision/evidence gaps remain. Commission or recover 024-H through programme governance; do not mistake this coverage assessment for the missing specification.