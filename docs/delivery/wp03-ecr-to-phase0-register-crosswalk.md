# WP-03 ECR-to-Phase 0 Evidence Register Crosswalk

**Review date:** 21 November 2026  
**Scope:** ECR-01–ECR-14 against all 24 active rows in the Notion *Phygital Phase 0 — Evidence Register*, its Operating Protocol, and the evidence-item return model.  
**Disposition:** Repository-side traceability review completed. No Notion rows, properties, statuses or decisions changed.

## 1. Executive finding

ECR-01–ECR-14 and the Notion Evidence Register are related but deliberately non-isomorphic:

- The **ECR register** is a focused WP-03 technical decision-closure queue for technology workload, infrastructure, data, providers, TCO, recovery, payments, testing and architecture/baseline decisions.
- The **Notion Evidence Register** is the wider Phase 0 master register for evidence requirements, validation actions and decision gates across the programme.
- The **PEM-EV evidence-item record** captures each returned claim, document, measurement or test result and links it to one or more ECR requests and existing Notion Evidence IDs.

A one-to-one mapping would be misleading. Several ECRs legitimately support multiple programme requirements; conversely, some ECRs have no sufficiently direct Notion row. These are real traceability gaps, not reasons to create duplicate records.

**Current control state:** 24 active Notion rows remain unchanged. ECR-12 remains NOT AUTHORIZED; ECR-13 is PROPOSED ONLY; ECR-14 remains OPEN. No technology candidate is ready for scoring, and no ADR decision or live pilot is authorized.

## 2. Crosswalk method

Each ECR was matched against the exact purpose, evidence required, closure test, dependency and workstream of the 24 live Notion rows. Links are classified as:

- **Primary:** the Notion row directly captures a material evidence requirement within the ECR.
- **Supporting:** the Notion row captures a related programme condition or evidence source but does not, by itself, close the ECR.
- **No direct row:** no existing row has a sufficiently precise scope to serve as the canonical requirement. Do not force a proxy match.

An ECR can be closed only against its own required artefacts and decision test. Closing a related Notion row does not automatically close an ECR, and vice versa.

## 3. ECR-to-register crosswalk

| ECR | Request / current ECR position | Primary Notion linkage | Supporting linkage | Coverage assessment |
|---|---|---|---|---|
| ECR-01 | Canonical Developer Guide v0.1 source recovery or formal disposition. SOURCE RECOVERY OPEN. | **No direct row.** | CV-20 only where guide decisions concern phase-gated capabilities; E-022 for controlled source/evidence location is not document-authority control. | **Gap.** Source authority, exact version, completeness and formal disposition are not explicitly governed by an existing row. |
| ECR-02 | Validated pilot workload and transaction profile. PARTIAL SOURCE EVIDENCE; numeric responses absent. | CV-13 (cost/revenue model and payer willingness); CV-19 (numeric pilot indicators/thresholds). | CV-03 buyer volume/specification; CV-04 producer supply/seasonality; CV-05 hub capacity; E-023 pilot scope; CV-18 dependency plan. | **Broadly covered, distributed.** No single row owns the consolidated, source-backed workload profile required for technology/TCO sizing. |
| ECR-03 | Hub/site/device/connectivity evidence. DESIGN EVIDENCE ONLY. | CV-05 (site readiness, permitted activities, equipment, staffing, connectivity and cost). | CV-04 producer-side volume/operating assumptions; CV-19 measurement/indicator design; E-023 scope boundaries. | **Direct primary coverage.** CV-05 is the canonical site assessment row; ECR closure still requires measured and permission-backed findings. |
| ECR-04 | Data inventory, privacy and legal basis. DESIGN EVIDENCE ONLY. | CV-17 (data categories/flows, controller/processor, purpose, retention, security and ODPC obligations). | CV-07 (organization/hub roles and tenant isolation); CV-10 (audit history); CV-11 (event provenance); E-022 (controlled evidence repository/access). | **Direct primary plus technical dependencies.** CV-17 is primary; supporting rows cover implementation controls but do not replace the data map/legal review. |
| ECR-05 | Provider contractual, regional, security and commercial evidence. DESIGN EVIDENCE ONLY. | CV-14 (provider due diligence, credentials, scope, quote, capacity, insurance, SLA and availability). | CV-13 (cost/revenue and payer economics); CV-17 (processor/privacy terms); CV-18 (schedule/dependencies); CV-05 (site connectivity and equipment context). | **Partial/distributed.** CV-14 is the operational provider row, but technology-provider-specific DPA, subprocessors, hosting region, support access, termination and exact plan terms are not explicit. |
| ECR-06 | Operations and technical skills capacity. DESIGN EVIDENCE ONLY. | CV-05 (site staffing, equipment and operations readiness). | CV-18 (dependency-based plan and owners); E-023 (scope/stop conditions); CV-14 (provider service/support capacity). | **Partial.** Site operations are covered; technical support/on-call, patching, key rotation, incident response, backup/restore and continuity ownership are not explicitly consolidated. |
| ECR-07 | Comparable low/base/high TCO assumptions. DESIGN EVIDENCE ONLY. | CV-13 (cost/revenue model, unit economics and payer willingness). | CV-05 (hub/site cost responsibility); CV-14 (provider quotes); CV-18 (schedule/staffing dependencies); CV-19 (measurement and thresholds); E-023 (scope/volume ceiling). | **Direct primary plus inputs.** CV-13 is primary, but it must explicitly include the technology cost categories, 12/24/36-month horizons and comparable scenarios in ECR-07. |
| ECR-08 | Recovery objectives and evidence retention. DESIGN EVIDENCE ONLY. | CV-10 (protected audit history and mandatory events). | CV-11 (trusted event handling and provenance); CV-17 (retention/deletion, privacy and incident plan); CV-12 (database execution/recovery test evidence). | **Gap / partial.** No row explicitly requires approved RPO/RTO, backup independence, retention schedule across data classes and witnessed restore test. |
| ECR-09 | Buyer-to-seller payment route and provider authority. PARTIAL SOURCE EVIDENCE; no actual route. | CV-01 (seller/exporter/contract roles, title/risk and liability); CV-15 (failed payment, refund, dispute and claims procedures). | CV-11 (payment event provenance/idempotency); CV-13 (fees, FX, settlement and payer economics); CV-14 (payment provider due diligence). | **Direct commercial coverage, incomplete technical/route evidence.** CV-01 and CV-15 are primary for role and process; actual merchant/payee, buyer-country route, provider authority and reconciliation proof remain absent. |
| ECR-10 | Commodity-specific lab/inspection evidence. DESIGN EVIDENCE ONLY. | CV-02 (commodity/product-form/destination selection); CV-04 (producer quality/supply evidence). | CV-14 (provider qualification); CV-16 (export/import requirements); CV-03 (buyer specification, sample/inspection and acceptance conditions). | **Distributed coverage.** No single row captures lab accreditation scope, sampling/chain-of-custody, test methods, certificate validity and retest/withdrawal controls. |
| ECR-11 | Security/privacy control and test evidence. SPECIFIED — NOT EXECUTED. | CV-07 (authorization/tenant isolation); CV-10 (audit integrity); CV-11 (event authenticity/idempotency); CV-12 (database/migration tests); CV-17 (privacy/security assessment). | CV-06 (cross-record invariants); CV-08 (inventory ledger and atomic allocation); CV-09 (batch states/units/precision); E-021 (synthetic workflow test only, not full security acceptance). | **Broad coverage, test-execution gap.** The rows identify controls, but no row alone proves the full 024-F/024-G threat, security and privacy test catalogue has been executed and independently reviewed. |
| ECR-12 | Candidate synthetic spike authorization. NOT AUTHORIZED. | **No direct row.** | E-021 is the Level 1 simulated transaction and is not a technology-candidate spike; E-024 is the formal Phase 0 checkpoint but is not a substitute for a spike-specific authorization. E-022 supports controlled evidence retention. | **Gap.** A specific candidate-spike authorization, scope, environment, budget, fixtures, acceptance criteria, reviewer, cleanup and stop conditions are not represented by a dedicated row. |
| ECR-13 | ADR-0002 topology review and decision. PROPOSED ONLY. | **No direct row.** | E-024 formal Phase 0 checkpoint; E-023 pilot scope/stop-loss; CV-18 dependency plan; E-022 decision-log control. | **Gap.** A topology decision with accepted/rejected alternatives, conditions, deployment/data boundaries, recovery/exit and review triggers is not an explicit register requirement. |
| ECR-14 | ADR-0001 technology baseline decision. OPEN; no candidate ready for scoring. | **No direct row.** | E-024 formal Phase 0 checkpoint; E-022 decision log/evidence repository; CV-13 cost assumptions; CV-17 privacy/legal constraints; CV-10/11/12 technical controls; CV-18 dependencies. | **Gap.** The evidence-based technology baseline selection, independent review, scorecard, conditions, owner and exit/reassessment plan are not explicitly represented as a dedicated requirement. |

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

Four ECRs lack a direct canonical row:

- **ECR-01:** Developer Guide source authority and disposition.
- **ECR-12:** specific synthetic technology-spike authorization.
- **ECR-13:** ADR-0002 topology decision.
- **ECR-14:** ADR-0001 technology baseline decision.

ECR-08 also has a substantive gap: recovery objectives, retention and witnessed restore evidence do not have a dedicated primary row. ECR-05 and ECR-06 have narrower scope gaps around technology-provider terms and technical operations capacity.

## 5. Proposed register treatment — recommendations only

The Operating Protocol permits new rows only for genuinely distinct evidence requirements, decisions or tests. The following additions are justified candidates for sponsor/Phase 0 Lead review; **they have not been created**.

| Proposed distinct record | Purpose / closure boundary | Why not duplicate an existing row |
|---|---|---|
| Developer Guide source authority and disposition | Recover complete canonical source with version/date/authority, or formally record unavailable/superseded disposition and decision treatment. | CV-20 concerns phase-gated capabilities; E-022 concerns evidence repository/decision log. Neither establishes source authority. |
| WP-05 synthetic technology-spike authorization | Record the explicit authorization decision and its scope, budget, environment, fixtures, acceptance criteria, named owner/reviewer, cleanup and stop conditions. | E-021 is a Level 1 workflow rehearsal, not a technology-candidate spike; E-024 is a programme checkpoint. |
| ADR-0002 topology assessment and decision | Record assessed alternatives, decision, conditions, deployment/data boundaries, recovery/exit, accountable owner and review triggers. | E-024 is the overall checkpoint; CV-18 is the programme schedule. Neither captures topology choice. |
| ADR-0001 technology baseline assessment and decision | Record evidence-backed scorecards, critical blockers, independent review, selected baseline/conditions, exit plan and reassessment triggers. | No current row is the canonical technology selection decision. |
| Recovery objectives, retention and witnessed restore | Define approved RPO/RTO and retention by data class, backup independence, restore test and reviewer evidence. | CV-10 protects audit history; CV-12 is migration/test execution. Neither fully captures service recovery and evidence retention. |

Do not allocate Evidence IDs or CV Finding codes in advance. If the programme approves additions, let the Notion database's auto-increment mechanism assign stable IDs and update the CV Finding mapping under the Operating Protocol. Avoid inventing E-025 or subsequent codes.

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

1. Keep the existing 24 Notion rows intact.
2. Keep ECR-01–ECR-14 as the WP-03 technical closure register.
3. Use the crosswalk to attach each PEM-EV item to all relevant ECR IDs and existing Notion Evidence IDs.
4. Seek programme approval before adding the five proposed distinct requirements; do not create them automatically.
5. Keep ECR-12 NOT AUTHORIZED until its own authorization gate is met.
6. Keep ADR-0001 and ADR-0002 OPEN; no candidate scoring, topology decision or baseline selection is implied.
7. Keep the evidence repository restricted and use public GitHub only for non-identifying process documentation and approved synthetic artefacts.

## 9. Sources and review boundary

- Notion: *Phygital Phase 0 — Evidence Register*, all 24 active rows, data source `collection://9010523b-0a0f-473c-84f4-89c4597a2594`.
- Notion: *Evidence Register — Operating Protocol*.
- Repository: `docs/delivery/wp03-evidence-closure-request-register.md`.
- Repository: `docs/delivery/wp03-phase0-evidence-reconciliation.md`.
- Repository: `docs/delivery/phase0-evidence-return-and-validation-record-template.md`.
- Repository: `docs/delivery/phase0-evidence-register-reconciliation.md`.

This is a read-only traceability assessment. It does not amend the Notion register, authorize collection or external contact, accept evidence, close ECRs, authorize WP-05, or approve ADR-0001/ADR-0002.
