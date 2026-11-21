# WP-03 evidence closure request register

**Review date:** 20 November 2026  
**Purpose:** Convert known WP-03 scoring blockers into explicit evidence requests, expected artefacts, accountable role types and closure tests.  
**Status:** Prepared for controlled project/partner validation. No individual is appointed or assigned by this document; role owners must be confirmed by the programme.

## 1. How to use this register

- Request evidence from the accountable source owner; do not replace missing evidence with estimates or provider marketing.
- Record source, version/date, evidence owner, retrieval date, limitations, reviewer and status.
- Keep raw evidence in the controlled evidence repository/register and link it from the candidate scorecard.
- Use UNKNOWN where evidence is absent. Do not assign a numeric score to a critical criterion while its evidence remains unknown.
- A completed request is not approval; it only provides evidence for technical, legal, privacy, commercial or sponsor review.
- No provider contract, real participant data, migration, production provisioning or live integration is authorized by this register.

## 2. Evidence requests

| ID | Evidence request | Accountable role type | Required evidence / artefact | Blocks / informs | Current status |
|---|---|---|---|---|---|
| ECR-01 | Canonical Developer Guide v0.1 source recovery or formal disposition | Project document custodian / document owner | Original Notion page or file; exact version/date; complete content; authority/status; source URL or file reference; or signed disposition that the guide is unavailable/superseded and states how its decisions are treated | Candidate A, TC-01/02/03/04/06/09; ADR-0001/0002 | SOURCE RECOVERY OPEN; Notion and Library searches did not surface canonical complete source |
| ECR-02 | Pilot workload and transaction profile | Phase 0 pilot coordinator with buyer/producer/hub representatives | Validated pilot scope; named commodity/hub/participant categories; expected listings, batches, enquiries, quotes, orders, allocations, movements, events, users, organisations, concurrency, peak patterns and seasonality; source and confidence for every quantity | Database/runtime/worker/hosting TCO and scaling; ADR-0001/0002 | PARTIAL SOURCE EVIDENCE — 003/011 define narrow planning scope; 013 asks for buyer/producer quantities; 020 requires indicative batch. No completed numeric responses |
| ECR-03 | Hub/site/device/connectivity evidence | Site/hub readiness lead | Site permission; measured bandwidth/latency/outage periods; power/network resilience; device/browser/OS matrix; shared-device practice; scan/measurement equipment; file upload conditions; staff availability and operating hours | Hosting region, offline/sync, storage, worker design, support/TCO | DESIGN EVIDENCE ONLY — 010/013 define site, connectivity, device, staffing and cost checks; no appointed site or measurements |
| ECR-04 | Data inventory, privacy and legal basis | Data protection/privacy lead and qualified legal reviewer | Data categories and flows; controller/processor roles; purposes; lawful basis; data subject groups; retention/deletion; cross-border transfers; rights handling; DPA requirements; incident/breach duties; legal holds; destination-market obligations | Identity, database, storage, hosting, logs, analytics, notifications, payment and lab provider decisions | DESIGN EVIDENCE ONLY — 008/011/013 specify privacy and data-control questions; no approved data map or legal assessment |
| ECR-05 | Provider contractual and regional evidence | Technology/procurement owner with legal/privacy reviewer | Exact product/SKU/plan/version; contracting entity; current DPA; subprocessors; region and replication; support access; encryption/key terms; incident notification; retention/deletion; SLA/support; acceptable-use/commercial-use terms; export/termination; current price/quota/overage | All managed candidates and TSBBF licence, security, reliability, TCO criteria | DESIGN EVIDENCE ONLY — 003/013 identify provider diligence and full-cost requirements; no selected provider contract/DPA/quote |
| ECR-06 | Operations and technical skills capacity | Operations lead / technical lead | Named role owners; skills matrix; support hours; escalation/on-call coverage; patch/upgrade owner; incident response; secrets/key rotation; monitoring; backup/restore; provider liaison; handover and continuity plan | Hosting, CI, identity, database, storage, workers, observability, security and TCO | DESIGN EVIDENCE ONLY — 010/011 define proposed roles and operating procedures; no named role owners or support coverage |
| ECR-07 | Comparable low/base/high TCO assumptions | Finance/commercial lead with technical lead | 12/24/36-month scenarios covering seats, MAU/MRU, database compute/storage, object storage, egress, requests, workers/queues, CI/build, logs/metrics/traces, backup/PITR, malware scanning, email/SMS, support, maintenance, migration, training, incident response and exit labour | TSBBF TCO scoring and candidate ranking | DESIGN EVIDENCE ONLY — 003/010/013 define cost categories; no priced inputs or validated volume/staffing |
| ECR-08 | Recovery objectives and evidence retention | Product/service owner, operations lead and legal reviewer | Business impact and acceptable downtime/data loss; proposed RPO/RTO; retention schedule for transactions, audit, evidence, files, telemetry and backups; legal hold/disposal rules; independent-copy requirement; restore-test witness | TC-12, TC-24, database/storage/hosting selection and production gates | DESIGN EVIDENCE ONLY — 011/019 require backup/recovery and controlled audit/offline reconciliation; no approved RPO/RTO/retention |
| ECR-09 | Buyer-to-seller payment route and provider authority | Commercial lead, seller/exporter representative and qualified payments/legal reviewer | Seller's merchant/payee identity; buyer country/currency; direct settlement route; current provider licence/scope; contract; fees/FX/settlement timing; refunds/chargebacks; webhook/signature docs; reconciliation responsibility; confirmation that platform is not payee, custodian or funds holder | TC-16 and live commercial/payment gate; 018-A D-01/D-02/D-07 | PARTIAL SOURCE EVIDENCE — 009 proposes direct buyer-to-seller funds flow; 011 sets no-platform-custody boundary; no actual buyer/payee/provider route |
| ECR-10 | Commodity-specific lab/inspection evidence | Quality/commodity lead and laboratory/provider representative | Exact commodity/product form; tests/methods/units; required accreditation scope; lab/site; certificate and validity; sample plan/chain of custody; report issuer/authenticity; retest/correction/withdrawal procedure; data contract | TC-18, batch verification, destination/commodity readiness | DESIGN EVIDENCE ONLY — 008/011/013/019 define conditional quality and accreditation checks; no selected commodity/lab/scope |
| ECR-11 | Security/privacy control and test evidence | Security lead and independent reviewer | Threat model; 024-F SEC-001–020 coverage; ST-01–ST-24 execution; cross-tenant/RLS tests; identity/session revocation; signed-file links; malware quarantine; offline replay; webhook authentication; log redaction; backup/restore; defect/retest and residual-risk record | Candidate security scores, real-data/production gates | SPECIFIED — NOT EXECUTED; 011 lists control scenarios; 024-F/024-G execution and independent review remain outstanding |
| ECR-12 | Candidate synthetic spike authorization | Authorized decision owner / technical lead / independent reviewer | Approved candidate scope and comparison question; environment; budget; synthetic fixtures; threat/test plan; acceptance criteria; owner; reviewers; exact versions/commands; evidence retention; rollback/cleanup; stop conditions | WP-05 execution and candidate test scores | NOT AUTHORIZED; prerequisites not met |
| ECR-13 | ADR-0002 topology review and decision | Authorized technology decision owner / programme sponsor | Review of WP-04 assessment; accepted/rejected topology; conditions; accountable owners; triggers for revisiting; exceptions; deployment/data boundaries; recovery/exit; review date | WP-04 closure, ADR-0002 | PROPOSED ONLY; modular-monolith direction NOT APPROVED |
| ECR-14 | ADR-0001 technology baseline decision | Authorized technology decision owner / programme sponsor | Candidate scorecards with evidence; alternatives; critical blockers; independent review; selected baseline and conditions; owner; reassessment triggers; exit plan | WP-06 handoff, ADR-0001 | OPEN; no candidate ready for scoring |

## 3. Phase 0 source reconciliation

See [WP-03 Phase 0 evidence reconciliation](wp03-phase0-evidence-reconciliation.md) for the source-by-source mapping of Deliverables 003, 008, 009, 010, 011, 013, 019 and 020 against all 14 requests. Phase 0 instruments and proposed controls are not completed field findings; ECR status wording has been refined accordingly.

## 4. Closure evidence quality rules

Every evidence item must be:
- **Traceable:** source, issuer/owner, version/date and retrieval date are identifiable.
- **Applicable:** it matches the exact candidate plan, region, version, deployment model and intended use.
- **Current:** terms, pricing, limits and product lifecycle are checked at decision time.
- **Reproducible:** tests include exact source commit, versions, configuration, fixtures, commands and raw outputs.
- **Complete enough:** limitations, exceptions, unknowns and exclusions are visible.
- **Reviewed:** the reviewer is identified and independent where the risk requires it.
- **Retained:** evidence is stored under controlled access and can be retrieved after a provider/account change.

A web page or pricing calculator alone does not prove contract terms, support, data-processing location, recovery or exit.

## 5. Dependencies and sequencing

1. ECR-01 source recovery/disposition can proceed immediately; it is a document-authority task.
2. ECR-02, ECR-03, ECR-04, ECR-06, ECR-08, ECR-09 and ECR-10 require Phase 0/site/partner/legal input; they cannot be completed from public web research alone.
3. ECR-05 and ECR-07 require exact candidate plans plus validated workload and legal/privacy constraints.
4. ECR-11 can be planned now, but execution requires an approved synthetic environment and reviewers.
5. ECR-12 must remain NOT AUTHORIZED until prerequisites are met.
6. ECR-13 and ECR-14 remain open until evidence is reviewed by the authorized decision owner.

## 6. Current gate assessment

- Initial P0/P1 component evidence packs and public-source candidate snapshots are in the repository.
- 48 candidate products/patterns are indexed; no candidate is READY FOR SCORING.
- No numeric TSBBF score or shortlist exists.
- Developer Guide v0.1 recovery remains open.
- Phase 0 workload, connectivity, staffing, costs, RPO/RTO and partner validation remain incomplete.
- Provider DPA/subprocessor/region/contract evidence is incomplete.
- Integrated restore/exit and candidate security tests have not been executed.
- Synthetic technology spike remains unauthorized.
- ADR-0001 and ADR-0002 remain OPEN.

This register is the next evidence-collection instrument for the programme. It does not create appointments, authorize spending or approve a technical decision.
