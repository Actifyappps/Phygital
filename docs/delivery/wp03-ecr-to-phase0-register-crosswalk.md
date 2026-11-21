# WP-03 ECR-to-Phase 0 Evidence Register Crosswalk

**Review date:** 21 November 2026  
**Scope:** ECR-01–ECR-14 against all 29 active rows in the Notion *Phygital Phase 0 — Evidence Register*, its Operating Protocol, and the evidence-item return model.  
**Disposition:** Updated after approved creation and read-back verification of five Notion records on 21 November 2026. Original 24 rows preserved; no schema or existing-row status/closure changes.

## 1. Executive finding

ECR-01–ECR-14 and the Notion Evidence Register are related but deliberately non-isomorphic:

- The **ECR register** is a focused WP-03 technical decision-closure queue for technology workload, infrastructure, data, providers, TCO, recovery, payments, testing and architecture/baseline decisions.
- The **Notion Evidence Register** is the wider Phase 0 master register for evidence requirements, validation actions and decision gates across the programme.
- The **PEM-EV evidence-item record** captures each returned claim, document, measurement or test result and links it to one or more ECR requests and existing Notion Evidence IDs.

A one-to-one mapping would be misleading. Several ECRs legitimately support multiple programme requirements; conversely, some ECRs have no sufficiently direct Notion row. These are real traceability gaps, not reasons to create duplicate records.

**Current control state:** 29 active Notion rows (24 original + 5 approved additions). EVI-25 (ECR-01), EVI-26 (ECR-12), EVI-27 (ECR-13), EVI-28 (ECR-14), EVI-29 (ECR-08). EVI-25 is IN PROGRESS; EVI-26–EVI-29 are OPEN. All five have Closure Accepted = NO and CV Finding blank. ECR-12 remains NOT AUTHORIZED; ADR-0002 and ADR-0001 remain OPEN. No technology candidate is ready for scoring, and no live pilot is authorized.

## 2. Crosswalk method

Each ECR was matched against the exact purpose, evidence required, closure test, dependency and workstream of the 29 live Notion rows. Links are classified as:

- **Primary:** the Notion row directly captures a material evidence requirement within the ECR.
- **Supporting:** the Notion row captures a related programme condition or evidence source but does not, by itself, close the ECR.
- **No direct row:** no existing row has a sufficiently precise scope to serve as the canonical requirement. Do not force a proxy match.

An ECR can be closed only against its own required artefacts and decision test. Closing a related Notion row does not automatically close an ECR, and vice versa.

## 3. ECR-to-register crosswalk

| ECR | Request / current ECR position | Primary Notion linkage | Supporting linkage | Coverage assessment |
|---|---|---|---|---|
| ECR-01 | Canonical Developer Guide v0.1 source recovery or formal disposition. SOURCE RECOVERY IN PROGRESS. | **EVI-25.** | CV-20 where guide decisions concern phase-gated capabilities; EVI-22 for controlled source/evidence location. | **Direct primary coverage added.** EVI-25 owns source authority, provenance, completeness and formal disposition. |
| ECR-02 | Validated pilot workload and transaction profile. PARTIAL SOURCE EVIDENCE; numeric responses absent. | CV-13 (cost/revenue model and payer willingness); CV-19 (numeric pilot indicators/thresholds). | CV-03 buyer volume/specification; CV-04 producer supply/seasonality; CV-05 hub capacity; EVI-23 pilot scope; CV-18 dependency plan. | **Broadly covered, distributed.** No single row owns the consolidated, source-backed workload profile required for technology/TCO sizing. |
| ECR-03 | Hub/site/device/connectivity evidence. DESIGN EVIDENCE ONLY. | CV-05 (site readiness, permitted activities, equipment, staffing, connectivity and cost). | CV-04 producer-side volume/operating assumptions; CV-19 measurement/indicator design; EVI-23 scope boundaries. | **Direct primary coverage.** CV-05 is the canonical site assessment row; ECR closure still requires measured and permission-backed findings. |
| ECR-04 | Data inventory, privacy and legal basis. DESIGN EVIDENCE ONLY. | CV-17 (data categories/flows, controller/processor, purpose, retention, security and ODPC obligations). | CV-07 (organization/hub roles and tenant isolation); CV-10 (audit history); CV-11 (event provenance); EVI-22 (controlled evidence repository/access). | **Direct primary plus technical dependencies.** CV-17 is primary; supporting rows cover implementation controls but do not replace the data map/legal review. |
| ECR-05 | Provider contractual, regional, security and commercial evidence. DESIGN EVIDENCE ONLY. | CV-14 (provider due diligence, credentials, scope, quote, capacity, insurance, SLA and availability). | CV-13 (cost/revenue and payer economics); CV-17 (processor/privacy terms); CV-18 (schedule/dependencies); CV-05 (site connectivity and equipment context). | **Partial/distributed.** CV-14 is the operational provider row, but technology-provider-specific DPA, subprocessors, hosting region, support access, termination and exact plan terms are not explicit. |
| ECR-06 | Operations and technical skills capacity. DESIGN EVIDENCE ONLY. | CV-05 (site staffing, equipment and operations readiness). | CV-18 (dependency-based plan and owners); EVI-23 (scope/stop conditions); CV-14 (provider service/support capacity). | **Partial.** Site operations are covered; technical support/on-call, patching, key rotation, incident response, backup/restore and continuity ownership are not explicitly consolidated. |
| ECR-07 | Comparable low/base/high TCO assumptions. DESIGN EVIDENCE ONLY. | CV-13 (cost/revenue model, unit economics and payer willingness). | CV-05 (hub/site cost responsibility); CV-14 (provider quotes); CV-18 (schedule/staffing dependencies); CV-19 (measurement and thresholds); EVI-23 (scope/volume ceiling). | **Direct primary plus inputs.** CV-13 is primary, but it must explicitly include the technology cost categories, 12/24/36-month horizons and comparable scenarios in ECR-07. |
| ECR-08 | Recovery objectives and evidence retention. DESIGN EVIDENCE ONLY. | **EVI-29.** | CV-10 (protected audit history and mandatory events); CV-11 (trusted event handling and provenance); CV-17 (retention/deletion, privacy and incident plan); CV-12 (database execution/recovery test evidence). | **Dedicated primary coverage added.** EVI-29 requires approved recovery objectives, retention controls and an independently witnessed restore test. |
| ECR-09 | Buyer-to-seller payment route and provider authority. PARTIAL SOURCE EVIDENCE; no actual route. | CV-01 (seller/exporter/contract roles, title/risk and liability); CV-15 (failed payment, refund, dispute and claims procedures). | CV-11 (payment event provenance/idempotency); CV-13 (fees, FX, settlement and payer economics); CV-14 (payment provider due diligence). | **Direct commercial coverage, incomplete technical/route evidence.** CV-01 and CV-15 are primary for role and process; actual merchant/payee, buyer-country route, provider authority and reconciliation proof remain absent. |
| ECR-10 | Commodity-specific lab/inspection evidence. DESIGN EVIDENCE ONLY. | CV-02 (commodity/product-form/destination selection); CV-04 (producer quality/supply evidence). | CV-14 (provider qualification); CV-16 (export/import requirements); CV-03 (buyer specification, sample/inspection and acceptance conditions). | **Distributed coverage.** No single row captures lab accreditation scope, sampling/chain-of-custody, test methods, certificate validity and retest/withdrawal controls. |
| ECR-11 | Security/privacy control and test evidence. SPECIFIED — NOT EXECUTED. | CV-07 (authorization/tenant isolation); CV-10 (audit integrity); CV-11 (event authenticity/idempotency); CV-12 (database/migration tests); CV-17 (privacy/security assessment). | CV-06 (cross-record invariants); CV-08 (inventory ledger and atomic allocation); CV-09 (batch states/units/precision); EVI-21 (synthetic workflow test only, not full security acceptance). | **Broad coverage, test-execution gap.** The rows identify controls, but no row alone proves the full 024-F/024-G threat, security and privacy test catalogue has been executed and independently reviewed. |
| ECR-12 | Candidate synthetic spike authorization. NOT AUTHORIZED. | **EVI-26.** | EVI-21 remains the Level 1 simulated transaction rehearsal, not a technology-candidate spike; EVI-24 remains the formal Phase 0 checkpoint; EVI-22 supports controlled evidence retention. | **Dedicated authorization requirement added.** EVI-26 records the bounded synthetic-spike authorization gate; creation does not authorize execution. |
| ECR-13 | ADR-0002 topology review and decision. PROPOSED ONLY. | **EVI-27.** | EVI-24 formal Phase 0 checkpoint; EVI-23 pilot scope/stop-loss; CV-18 dependency plan; EVI-22 decision-log control. | **Dedicated primary requirement added.** EVI-27 captures the evidence-backed topology assessment and authorized ADR-0002 decision; the ADR decision itself remains pending. |
| ECR-14 | ADR-0001 technology baseline decision. OPEN; no candidate ready for scoring. | **EVI-28.** | EVI-24 formal Phase 0 checkpoint; EVI-22 decision log/evidence repository; CV-13 cost assumptions; CV-17 privacy/legal constraints; CV-10/11/12 technical controls; CV-18 dependencies. | **Dedicated primary requirement added.** EVI-28 captures evidence-backed candidate assessment and the authorized ADR-0001 baseline decision. |

## 4. Coverage conclusions

### 4.1 ECRs with identifiable primary register rows

- **ECR-03 → CV-05**
- **ECR-04 → CV-17**
- **ECR-07 → CV-13**
- **ECR-09 → CV-01 and CV-15**
- **ECR-11 → CV-07, CV-10, CV-11, CV-12 and related technical-control rows**

These are direct scope relationships, not evidence that the ECRs are closed. Each ECR still requires its own full artefact set and closure test.

### 4.2 Distributed evidence requirements

ECR-02, ECR-05, ECR-06, ECR-08 and ECR-10 span several existing Notion requirements. Their evidence should be returned once, with the evidence-item record cross-referenced to all relevant ECR IDs and Evidence IDs. Avoid copying the same raw evidence into multiple records.

### 4.3 Register coverage gaps

The five previously identified gaps now have dedicated canonical rows:

- **ECR-01 → EVI-25:** Developer Guide source authority and disposition.
- **ECR-12 → EVI-26:** bounded synthetic technology-spike authorization.
- **ECR-13 → EVI-27:** ADR-0002 topology assessment and decision.
- **ECR-14 → EVI-28:** ADR-0001 technology baseline assessment and decision.
- **ECR-08 → EVI-29:** recovery objectives, retention and witnessed restore.

ECR-05 and ECR-06 retain narrower scope gaps around technology-provider terms and technical operations capacity; these are not addressed by the five additions.

## 5. Applied register additions

The five additions were approved and created in the existing Notion Evidence Register on 21 November 2026. The database generated the IDs; all records were read back and verified. Their initial state is OPEN with Closure Accepted = NO. CV Finding remains blank on all five records.

| ECR | Notion Evidence ID | Applied Evidence Item | Decision Impact | State |
|---|---:|---|---|---|
| ECR-01 | **EVI-25** | Establish authority of canonical Developer Guide v0.1 source | Phase 0 learning | OPEN |
| ECR-12 | **EVI-26** | Authorize a bounded synthetic technology-candidate spike | Phase 0 learning | OPEN; execution NOT AUTHORIZED |
| ECR-13 | **EVI-27** | Record the authorised topology decision in ADR-0002 | Production/data gate | OPEN |
| ECR-14 | **EVI-28** | Approve the evidence-backed technology baseline in ADR-0001 | Production/data gate | OPEN |
| ECR-08 | **EVI-29** | Approve recovery objectives and retention controls; execute a witnessed restore test | Production/data gate | OPEN |

No CV Finding identifiers were assigned. The existing Dependency field retains ECR references. No original register row, schema property, existing status or closure decision was changed.

## 6. Evidence-item cross-reference convention

For each returned item:

1. Assign one unique PEM-EV identifier in the restricted evidence repository.
2. List all applicable ECR IDs (ECR-01–ECR-14).
3. List all applicable Notion Evidence IDs and CV Finding keys.
4. State whether the item is primary evidence, corroboration, contextual evidence or a test result for each linked requirement.
5. Preserve source, issuer, date/version, scope, method, evidence strength, Notion Evidence Class, limitations, confidentiality, reviewer and review outcome.
6. Store raw/private evidence only in the approved restricted repository. Do not put participant details, confidential quotations, personal data, private contract links or sensitive provider artefacts in the public GitHub repository.
7. Update existing Notion Evidence Reference and Notes / Finding fields only when evidence is actually received and reviewed; retain the register's existing status/closure rules.

The same evidence item may support multiple ECRs and multiple register rows, but its provenance and limitations must remain visible. A cross-reference is not an acceptance decision.

## 7. Current ECR status — preserved

| ECR | Status retained from WP-03 register |
|---|---|
| ECR-01 | SOURCE RECOVERY OPEN |
| ECR-02 | PARTIAL SOURCE EVIDENCE; numeric responses absent |
| ECR-03 | DESIGN EVIDENCE ONLY |
| ECR-04 | DESIGN EVIDENCE ONLY |
| ECR-05 | DESIGN EVIDENCE ONLY |
| ECR-06 | DESIGN EVIDENCE ONLY |
| ECR-07 | DESIGN EVIDENCE ONLY |
| ECR-08 | DESIGN EVIDENCE ONLY |
| ECR-09 | PARTIAL SOURCE EVIDENCE; actual route absent |
| ECR-10 | DESIGN EVIDENCE ONLY |
| ECR-11 | SPECIFIED — NOT EXECUTED |
| ECR-12 | NOT AUTHORIZED |
| ECR-13 | PROPOSED ONLY |
| ECR-14 | OPEN; no candidate ready for scoring |

No status was upgraded by this crosswalk.

## 8. Decisions and actions

1. Preserve the original 24 Notion records and their history; the five approved additions are EVI-25 through EVI-29.
2. Keep ECR-01–ECR-14 as the WP-03 technical closure register.
3. Link each PEM-EV item to all relevant ECR IDs and Notion Evidence IDs; do not duplicate raw evidence.
4. Keep ECR-12 NOT AUTHORIZED until EVI-26's explicit authorization closure test is met and a separate decision authorizes execution.
5. Keep ADR-0001 and ADR-0002 OPEN; EVI-27 and EVI-28 are requirements, not completed decisions. ADR-0002 must precede final ADR-0001 approval.
6. EVI-29 must be closed with approved recovery/retention controls and an independently witnessed restore test before applicable production/data gates.
7. Keep the evidence repository restricted and use public GitHub only for non-identifying process documentation and approved synthetic artefacts.

## 9. Sources and review boundary

- Notion: *Phygital Phase 0 — Evidence Register*, all 24 active rows, data source `collection://9010523b-0a0f-473c-84f4-89c4597a2594`.
- Notion: *Evidence Register — Operating Protocol*.
- Repository: `docs/delivery/wp03-evidence-closure-request-register.md`.
- Repository: `docs/delivery/wp03-phase0-evidence-reconciliation.md`.
- Repository: `docs/delivery/phase0-evidence-return-and-validation-record-template.md`.
- Repository: `docs/delivery/phase0-evidence-register-reconciliation.md`.

This crosswalk records approved Notion register additions and their identifiers. It does not accept evidence, close ECRs, authorize WP-05 execution, approve ADR-0001/ADR-0002, authorize production deployment or permit live operations.


## 9. EVI-25 source-authority progress

The complete Developer Guide v0.1 was not located in the targeted Notion, connected Library or current repository search performed on 21 November 2026. The current Project Home confirms Concept Paper v1.1 as strategic authority and Technical Development Manual v3.0 as the supporting technical plan. Prior project context records the draft title/version/date, but complete original content is not recovered; no technology stack is attributed and partial references are not a scoring source. EVI-25 is IN PROGRESS pending source-custodian confirmation or formal unavailability/supersession disposition. See [the source-recovery assessment](https://app.notion.com/p/41f6808bcd9e8130846cf2d7c22b16c0).
