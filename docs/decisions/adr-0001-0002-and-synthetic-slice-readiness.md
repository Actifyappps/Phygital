# ADR-0001/0002 closure and synthetic vertical-slice readiness

**Snapshot:** 20 November 2026  
**Status:** Decision-readiness assessment. ADR-0001 and ADR-0002 remain OPEN. This document does not select a stack, topology, vendor or production environment and does not authorise a spike execution.

## 1. Decision boundary

- **ADR-0001 — Technology baseline:** selects components only after evidence-based TSBBF assessment. It must not be closed by preference, familiarity, a framework example or an unscored candidate.
- **ADR-0002 — Application topology:** selects the logical/deployable shape after workload, security, operational, cost and recovery evidence. A modular-monolith-first shape is a candidate, not an approval.
- **ADR-0003–0008:** dependent decisions covering identity/authorisation, data/storage, integration/events, offline/synchronisation, public projections/QR and physical-digital event integrity. Their exact scope and dependencies remain controlled by their ADRs.
- **AADDG v1.0:** governs repository, build, deployment, secrets, migrations, workers, security, backup/restore and release discipline. It does not mandate a particular provider.
- **TSBBF v1.0:** governs reuse/build/buy and component-level evidence, TCO, portability, licensing, maintenance and exit.

## 2. Preconditions to closing ADR-0001

| Gate | Required evidence or decision | Current position |
|---|---|---|
| Candidate-source integrity | Recover and verify canonical Developer Guide v0.1, version/date and complete content; reconcile with Technical Development Manual v3.0 | **OPEN:** canonical Developer Guide source was not recovered in the targeted Notion/Library search. Do not score from a paraphrase. |
| Component inventory | Define each component, boundaries, dependencies, replaceability and operational owner | Component register and workbook exist; still require candidate-specific evidence. |
| Candidate comparison | At least two credible alternatives where a material choice exists; same requirements and assumptions | Workbook is blank; no candidate scored or shortlisted. |
| Critical controls | Security, privacy, tenant isolation, data location, retention/deletion, recovery and continuity evidence | Not yet demonstrated for candidates. Critical unknown blocks approval. |
| Whole-life cost | Low/base/high 12/24/36-month TCO including compute, database, storage, bandwidth, workers, logs, backups, support, people, overages, migration and exit | Model prepared; no validated assumptions or candidate totals. |
| Portability and exit | Export/import of records, relationships, files, audit history and configuration; realistic replacement effort | Not demonstrated. |
| Licence and commercial terms | Commercial-use rights, acceptable-use limits, data-processing terms, quotas, suspension/upgrade consequences and support | Candidate-specific review outstanding. |
| Skills and ownership | Named maintainers, operational capacity, support route and escalation | Not confirmed. |
| Independent challenge | Technical/security/privacy review of evidence and material risks | Not completed. |
| Authorised decision | Decision owner records selected components, conditions, scope, dissent, review trigger and date | No selection authorised. |

### ADR-0001 must not close while

- the canonical Developer Guide comparison source remains unrecovered or its contents are not verified;
- a critical security, privacy, legal, recovery, continuity or portability risk is unknown or unacceptable;
- candidate scorecards contain guessed scores or unsupported TCO assumptions;
- data export/restore and exit are untested where they materially affect lock-in;
- there is no accountable maintainer/operating owner;
- the decision relies on a free-tier assumption without checking commercial use, quotas, throttling, suspension and upgrade costs.

## 3. Preconditions to closing ADR-0002

| Decision area | Required resolution | Evidence needed |
|---|---|---|
| Application shape | Confirm whether a modular monolith is sufficient for the pilot and expected near-term load | Domain/module boundaries, workload assumptions, failure isolation and complexity comparison |
| Deployable runtime count | Minimise services while meeting reliability and security needs | Runtime/component diagram; reason for each separate runtime |
| Web surfaces | Determine how six product surfaces share identity, navigation, API and release lifecycle | Surface-to-domain/API map; role-specific access and release implications |
| API/application boundary | Confirm command/query/event responsibilities and provider isolation | 024-D contracts, error/idempotency/versioning rules, contract tests |
| Authoritative data | Identify system of record and transaction boundaries without prematurely choosing physical DB | Logical ownership, invariants, concurrency and audit requirements |
| Private files/evidence | Define private object storage, malware/quarantine, scoped access, retention and integrity | Threat model, file lifecycle, access tests and restore proof |
| Workers and queues | Identify tasks that require asynchronous processing and ownership | Worker inventory, retry/backoff, idempotency, dead-letter handling, observability and operator runbook |
| Offline/edge | Define allowed offline actions and device/synchronisation boundaries | F-07 requirements, action allow-list, revocation and conflict tests |
| Environments/secrets | Define local/test/staging/production separation, secret custody and rotation | AADDG-compliant environment and secret model; no secrets in repository |
| Observability | Define correlation, audit, operational metrics and privacy-safe logs | Event/log schema, redaction tests, alert ownership |
| Recovery/rollback | Define backup scope, restore test, rollback and continuity requirements | Synthetic restore evidence, integrity reconciliation and recovery ownership |
| Hosting economics | Confirm data location, bandwidth/media economics, quotas and service terms | Candidate-specific evidence and low/base/high cost model |
| Operations | Assign deployment, support, incident, integration and recovery ownership | Named role-holders, runbooks and training/handover plan |
| Portability | Demonstrate reproducible build, data/file export and replacement path | Clean-checkout build and export/restore/exit rehearsal |

The repository layout must not dictate runtime boundaries. Do not create microservices merely because separate folders exist. Frontend hosting, backend, workers, storage and integrations must be evaluated as one operating system with clear accountability.

## 4. Smallest defensible synthetic-data vertical slice

The first executable spike should answer architecture risks, not attempt to implement the whole marketplace. Keep it reversible, local or in an explicitly authorised non-production environment, and synthetic-data-only.

1. Create a synthetic user and organisation with scoped membership and separate seller/exporter capacity fixtures.
2. Create one synthetic product, source/batch and evidence record; preserve E1–E4 class separately from acquisition/provenance.
3. Record a reviewer decision with source, scope, time and limitations.
4. Publish an allow-listed synthetic listing projection.
5. Create a synthetic buyer enquiry and versioned quotation.
6. Accept exactly one quotation and persist the accepted commercial snapshot.
7. Attempt concurrent reservations and prove the quantity invariant; reservation must not create movement/custody/dispatch.
8. Upload a synthetic private evidence file and verify scoped access, expiry and quarantine/scanning boundary.
9. Generate a revocable QR/public token that exposes only approved fields.
10. Simulate a signed provider callback; reject invalid signatures/replays and make duplicate processing idempotent. Record status only; no payment initiation or transfer.
11. Queue a low-risk offline capture, then synchronise with server-side revalidation, duplicate prevention and conflict review.
12. Execute a background job with bounded retries and visible terminal failure.
13. Reconstruct the synthetic workflow from correlation/audit records without exposing secrets or unnecessary personal data.
14. Export and restore synthetic records and file metadata; reconcile counts, relationships and hashes.
15. Have a second reviewer reproduce the clean-checkout setup and tests from the documented commit and commands.

This slice is a candidate comparison harness, not a complete product, a Level 1 EVI-21 run, or evidence of production readiness.

## 5. Entry gate before any spike execution

All must be true:

- [ ] Canonical Developer Guide v0.1 recovered and reconciled with Technical Development Manual v3.0.
- [ ] Candidate(s) have sufficient TSBBF evidence to justify a spike; unknowns are explicit.
- [ ] Spike scope, objective, budget, owner, operator and independent reviewer are named.
- [ ] Environment is explicitly approved and isolated; synthetic data only.
- [ ] No production credentials, real participant records or live provider credentials are used.
- [ ] Test fixtures, expected results, negative cases and stop conditions are version-controlled.
- [ ] Security/privacy threat review and data-handling rules are approved for the spike.
- [ ] Backup/restore, teardown and cost limits are defined before execution.
- [ ] Commit, commands, configuration, versions and raw evidence will be retained.
- [ ] Approval is recorded by the authorised programme/product decision owner.

If any entry condition is unmet, keep the spike as a plan and continue source/design work only.

## 6. Exit gate after the spike

- All mandatory acceptance cases are PASS, or each failure/blocker has an explicit disposition; critical controls cannot be waived by a weighted score.
- Clean-checkout build and tests are reproducible by another reviewer.
- Tenant/authority, evidence integrity, commercial snapshot, reservation concurrency, private files, QR projection, callback replay, offline sync and recovery have actual evidence.
- TCO, quotas, bandwidth, support burden and portability findings are recorded against the same assumptions for each candidate.
- Security/privacy and independent technical reviews are complete to the approved scope.
- Defects, limitations, residual risks, retests and untested areas are visible.
- ADR-0001/0002 proposals are updated; authorised governance decides adopt, repeat, defer or reject.

## 7. Dependency map

| Dependency | Why it matters to the slice | Required state |
|---|---|---|
| 024-A authority model | User, organisation, seller/exporter capacity and permission checks | Review and translate into testable tuples; not assumed approved |
| 024-B workflow/state rules | Listing, quotation, acceptance, reservation and exception transitions | Reconcile source and test scenarios |
| 024-C logical data model | Entity boundaries, lineage, evidence and snapshot relationships | Reconcile with 018-C; logical only |
| 024-D API contracts | Commands, queries, callbacks, idempotency and errors | Select test contracts without locking framework |
| 024-E interaction | Surface roles, error/offline/QR states | Include only the screens needed for the slice |
| 024-F security/privacy | Threats, tenant isolation, private files, abuse and offline risks | Define minimum controls and negative tests |
| 024-G quality | Test levels, QAT catalogue, evidence and acceptance | Map spike cases to existing catalogue; do not duplicate IDs |
| 018-A D-01–D-07 | Platform, seller/exporter, hub, batch, quotation, reservation and payment boundaries | Preserve all conditions |
| 018-C / Migration 001 | Existing source/target mapping and migration hold | No migration execution; logical comparison only |
| AADDG / TSBBF | Engineering lifecycle and technology decision method | Mandatory governing standards |

## 8. Current non-negotiable holds

- ADR-0001 and ADR-0002 remain **OPEN**; ADR-0003–0008 remain subject to their own closure evidence.
- No stack, hosting provider, database service, worker host or production topology is selected.
- Migration 001 remains **HOLD**; Migration 002 remains **NOT AUTHORISED**.
- EVI-21 remains **OPEN**, Closure Accepted **NO**; DEF-L1-001 and DEF-L1-002 remain **OPEN**.
- No production backend, database, deployment, CI runtime or live provider connection is established by this plan.
- No live trade, custody, platform-held funds, escrow, payment initiation, dispatch or shipment is authorised.

## 9. Related repository records

- docs/decisions/ADR-0001-technology-baseline.md
- docs/decisions/ADR-0002-application-topology.md
- docs/decisions/TSBBF-component-assessment-workbook.md
- docs/architecture/technology-component-register.md
- docs/delivery/technology-spike-and-acceptance-plan.md
- docs/quality/024r-audit-coverage-matrix.md
- docs/quality/024r-correction-implementation-record.md
- docs/quality/024g-test-catalogue-crosswalk.md
- docs/architecture/024h-architecture-operations-gap.md
