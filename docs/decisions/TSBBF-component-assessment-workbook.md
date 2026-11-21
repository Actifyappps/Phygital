# TSBBF component assessment workbook

**Framework:** Actify Inc. TSBBF v1.0, ratified 31 October 2026.  
**Status:** Blank controlled template. No candidate has been scored, shortlisted or approved.

## Scoring method

| Score | Meaning |
|---:|---|
| 1 | Fails requirement or unacceptable burden/risk |
| 2 | Weak fit; major gaps/workarounds |
| 3 | Adequate with documented limitations |
| 4 | Strong fit; manageable evidenced limitations |
| 5 | Excellent fit, supported by credible evidence/tests |
| UNKNOWN | Evidence absent; do not convert to a numeric score |

| Criterion | Weight | Assessment |
|---|---:|---|
| Functional fit | 20% | Required workflows, NFRs, integration and offline fit |
| Data portability and exit | 15% | Complete export/import, relationships, files, audit and exit effort |
| Security and privacy | 15% | Access, tenant isolation, encryption, vulnerabilities, region, subprocessors, retention |
| Reliability and maintenance | 15% | Availability, support, recovery, updates, maintainer health, operational burden |
| Total cost of ownership | 15% | Setup, usage, overages, bandwidth, storage, workers, support, people, migration/exit |
| Licence and commercial fit | 10% | Licence, commercial use, acceptable-use and service/data-processing terms |
| Integration and scalability | 5% | APIs/events, interoperability, rate limits, extensibility and growth |
| Ease of operation | 5% | Skills, deployment, observability, debugging, backup, incidents and handover |
| **Total** | **100%** | |

`Weighted score = Σ(score × weight) ÷ 5` (out of 100). If a critical criterion is unknown, mark **INCOMPLETE — NOT SCORABLE** until sufficient evidence exists.

- 80–100: shortlist for practical testing and cost verification.
- 65–79: investigate further or improve terms.
- Below 65: do not adopt without documented compelling rationale.
- Any critical unresolved security, legal, privacy, recovery or continuity risk blocks approval regardless of score.

A high score is not approval. The authorised decision owner approves the ADR after evidence review.

## WP-03 candidate evidence register

The consolidated [WP-03 candidate evidence register](wp03-candidate-evidence-register.md) lists the current component/candidate set, linked public-source snapshots, evidence state and outstanding blockers. It is an index only; it does not create scores or shortlist status. Candidate cover sheets and scorecards below remain blank until each candidate is READY FOR SCORING.

## Candidate cover sheet (complete one per component/candidate)

| Field | Entry |
|---|---|
| Component ID/name | [Complete] |
| Candidate product/service/version | [Complete] |
| Date / assessor | [Complete] |
| Evidence links and dates | [Complete] |
| Deployment model / data region | [Complete] |
| Licence / commercial-use terms | [Complete] |
| Data categories / subprocessors | [Complete] |
| Usage assumptions / dependencies | [Complete] |
| Team skills / operating owner | [Complete] |
| Alternatives / reversibility / exit | [Complete] |
| Evidence confidence | [High / Medium / Low / Unknown] |
| Critical blockers | [None evidenced / list / unknown] |
| Disposition | [Unassessed / incomplete / shortlist / reject / defer] |

## Scoring record

| Criterion | Weight | Score or UNKNOWN | Evidence reference | Rationale, limitation, mitigation |
|---|---:|---|---|---|
| Functional fit | 20 | — | | |
| Data portability and exit | 15 | — | | |
| Security and privacy | 15 | — | | |
| Reliability and maintenance | 15 | — | | |
| Total cost of ownership | 15 | — | | |
| Licence and commercial fit | 10 | — | | |
| Integration and scalability | 5 | — | | |
| Ease of operation | 5 | — | | |
| **Total** | **100** | **Not scored** | | |

## Evidence checklist

### Product and technical
- [ ] Required workflows and limits documented.
- [ ] API/event/webhook/export documentation reviewed.
- [ ] Runtime, storage, file size, request, execution and bandwidth limits recorded.
- [ ] Offline/low-bandwidth fit assessed where relevant.
- [ ] Version lifecycle, deprecation and upgrade path known.
- [ ] Failure modes, rate limits, retries and support escalation understood.

### Security and privacy
- [ ] Data region, subprocessors and transfer terms confirmed.
- [ ] Encryption/key management understood.
- [ ] Identity, MFA, session, role and tenant-isolation controls evidenced.
- [ ] Audit, incident notification and vulnerability response reviewed.
- [ ] Retention, deletion, export and data-subject support assessed.
- [ ] Private-file access and malware controls tested where relevant.
- [ ] Critical risks have owners and mitigations.

### Commercial and operations
- [ ] Commercial-use/acceptable-use terms reviewed.
- [ ] Licence obligations and redistribution implications reviewed.
- [ ] Free-tier quotas, throttling, suspension and upgrade consequences recorded.
- [ ] Low/base/high usage costs estimated.
- [ ] Setup, migration, support, maintenance and exit labour estimated.
- [ ] Support plan, service levels and escalation path documented.
- [ ] Skills and operating owner identified.
- [ ] Backup/restore and exit procedure demonstrated or explicitly evidence-gated.

### Decision integrity
- [ ] Evidence dated and linked; unknowns visible.
- [ ] Alternatives compared on same assumptions.
- [ ] Reversible pilot and acceptance criteria specified.
- [ ] Independent technical/security review completed where material.
- [ ] Decision owner and reassessment trigger recorded.

## TCO model

Normalise capacity and service level; do not compare a free tier with a production paid tier without adjustment. Use low/expected/high usage cases and a 12/24/36-month horizon.

| Cost category | Year 1 | Year 2 | Year 3 | Evidence / assumption |
|---|---:|---:|---:|---|
| Subscription/base plan | | | | |
| Compute/execution | | | | |
| Database/storage | | | | |
| Bandwidth/egress/CDN | | | | |
| Worker/queue/scheduler | | | | |
| Logs/monitoring | | | | |
| Backup/restore/retention | | | | |
| Messaging/external APIs | | | | |
| Support/premium services | | | | |
| Setup/migration/integration labour | | | | |
| Maintenance/upgrades/security labour | | | | |
| Exit/export/replacement | | | | |
| **Total** | | | | |

## Cross-candidate comparison

| Component ID | Candidate | Evidence complete? | Weighted score | Critical blocker? | TCO horizon | Exit evidence | Disposition |
|---|---|---|---:|---|---|---|---|
| TC-xx | Candidate A | | — | | | | Open |
| TC-xx | Candidate B | | — | | | | Open |

Do not compare unrelated components as though interchangeable. Bundle comparison supplements, not replaces, component-level scoring.

## Spike record

| Field | Entry |
|---|---|
| Spike ID / candidates | [Complete] |
| Approved scope/environment | [Synthetic/local unless separately authorised] |
| Data classification | Synthetic only |
| Owner / reviewers | [Complete] |
| Acceptance criteria | Link to spike plan |
| Commit SHA / exact commands | [Complete] |
| Test evidence / defects | [Complete] |
| Security/privacy review | [Pending / complete] |
| Cost observations | [Complete] |
| Independent review | [Pending / complete] |
| Outcome | [Pass / conditional / fail / inconclusive] |
| Follow-up / expiry | [Complete] |

## ADR handoff and current status

Completed assessments inform ADR-0001 technology baseline, ADR-0002 application topology and dependent ADR-0003–0008 (identity, storage, integrations, offline, QR and physical-digital integrity). Record selected scope, rejected alternatives, conditions, evidence, accountable implementation/operating owners, review trigger and exit plan.

All scores remain intentionally blank. EVI-25 source recovery/disposition remains open; do not score guide-derived assumptions until the complete source is recovered and reconciled or an authorized formal disposition approves an alternative evidence basis. Migration 001 HOLD; Migration 002 NOT AUTHORISED; EVI-21 OPEN. This workbook authorises no production provisioning, migration, live integration or live trade.
