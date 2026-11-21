# Phase 0 Evidence Register and Evidence-Return Reconciliation

**Review date:** 21 November 2026  
**Scope:** Existing Notion *Phygital Phase 0 — Evidence Register*, its Operating Protocol, Deliverable 013 and the repository evidence-return template v0.1.  
**Disposition:** Reconciliation completed; preserve the existing Notion database and records. No Notion schema or row changes made.

## 1. Executive finding

The existing Notion database is the programme's controlled **requirement, validation-action and decision-gate register**. It is not intended to contain one row for every interview, document, measurement or test result.

The Operating Protocol explicitly defines one row as one evidence requirement, validation action or decision gate; the auto-generated Evidence ID is the stable row identifier, while CV Finding maps the row to CV-01–CV-20 or E-021–E-024. It also prohibits duplicate rows for repeated mentions of the same requirement.

The repository evidence-return template v0.1 captures the **individual evidence item / claim** that is returned to address one or more register requirements. Its own relationship section says the Evidence Register remains the controlled record and that the template must not create a parallel authoritative database.

These are complementary layers, not competing registers:

1. **Requirement/gate layer — Notion Evidence Register:** what must be evidenced, why, who is proposed to own/review it, the closure test, priority, workstream, status and final acceptance.
2. **Evidence-item layer — restricted evidence repository:** the individual claim, response, document, site measurement or test result, its source, method, scope, validity, limitations, verification and review history.
3. **Decision layer — controlled decision record:** whether the evidence is sufficient to pass, fail, defer or leave a gate unresolved, with authorized decision-maker, rationale, residual risks and conditions.

Do not create a second Notion database or add duplicate register rows merely to hold each return. Link evidence-item records to the relevant existing Evidence ID and CV Finding, and to ECR request IDs where applicable.

## 2. What was inspected

- Notion database: **Phygital Phase 0 — Evidence Register** (data source `collection://9010523b-0a0f-473c-84f4-89c4597a2594`).
- Notion Operating Protocol: **Evidence Register — Operating Protocol**.
- Notion Deliverable 013: **Buyer, Producer, Hub & Provider Validation Pack v1.0**.
- Repository template: `docs/delivery/phase0-evidence-return-and-validation-record-template.md` (v0.1).
- All active rows in the Notion data source, queried in faithful rows mode; aggregate completeness and status counts checked separately.

The data source returned 24 active rows and no further page cursor. This is a point-in-time review of the active data source, not a claim that archived or trashed records were audited.

## 3. Existing register inventory

### 3.1 Schema and purpose

The data source has 20 properties:

| Property | Current purpose in the operating model |
|---|---|
| Evidence Item (title) | Requirement, validation action or gate name |
| Evidence ID (auto-generated) | Stable row identity |
| CV Finding | Maps row to CV-01–CV-20 or E-021–E-024 |
| Evidence Required | What must be obtained or demonstrated |
| Closure Test | Test that must be satisfied before closure |
| Status | Lifecycle of the requirement/action/gate |
| Closure Accepted | Explicit acceptance control |
| Priority | P0/P1/P2 readiness priority |
| Decision Impact | Live pilot, production/data, Phase 0 learning or deferred capability |
| Workstream | One of eleven programme workstreams |
| Proposed Owner Role | Proposed role only; not an appointment |
| Reviewer Role | Required reviewer role; not an appointment |
| Dependency | Prerequisite or blocker |
| Evidence Class | How evidence was obtained (see Section 5) |
| Evidence Reference | Reference to supporting evidence |
| Evidence Date | Date of evidence |
| Last Reviewed | Date last reviewed |
| Notes / Finding | Findings, qualifications, limitations and follow-up |
| CV Finding (text) | The CV/E traceability key |
| CV Finding (as field) | Included above; no additional identity should be inferred |

The live schema also contains system metadata such as page URL and creation time; these are not user-maintained evidence fields.

### 3.2 Record inventory and status

- **24 active records**.
- **22 OPEN**, **1 IN PROGRESS**, **1 UNVERIFIED**.
- **0 CLOSED** and **0 with Closure Accepted checked**.
- CV Finding coverage comprises CV-01 through CV-20 and E-021 through E-024; the inspected rows have distinct mapping keys.
- E-021 / Evidence ID 21 is the detailed Level 1 simulated-transaction record. It correctly remains OPEN, with Closure Accepted NO and the browser/operator/independent-review limitations preserved.

The current status distribution is consistent with an evidence programme whose acceptance gates remain outstanding. No status should be changed merely because a template or request exists.

### 3.3 Evidence metadata completeness

A read-only aggregate query found:

| Field | Rows populated | Rows blank |
|---|---:|---:|
| Evidence Reference | 1 | 23 |
| Evidence Class | 1 | 23 |
| Reviewer Role | 1 | 23 |
| Notes / Finding | 1 | 23 |
| Closure Accepted | 0 checked | 24 not checked |

The single populated case is E-021. These counts are not, by themselves, evidence of defective records: most rows are requirements awaiting evidence. They do show that the register is not yet populated with returned evidence across the other 23 requirements.

## 4. Reconciled operating model

### 4.1 Keep the Notion row as the stable requirement/gate record

For each evidence return:

1. Identify the existing Evidence ID and CV Finding that the return addresses.
2. Create a distinct evidence-item record in the approved restricted repository using the return template's PEM-EV identifier.
3. Include all applicable ECR request IDs in that evidence-item record.
4. Preserve the source file or raw result unchanged in the restricted repository.
5. Put a controlled evidence reference in the existing Notion row's Evidence Reference field. Where multiple evidence items support one requirement, use a controlled evidence index/bundle as the primary reference rather than trying to place several unrelated artefacts in a single URL field.
6. Update Evidence Class and Evidence Date only when evidence has actually been received and classified.
7. Summarise what the evidence establishes, limitations, contradictions and follow-up in Notes / Finding; retain the full detail in the evidence-item record.
8. Leave Status OPEN, IN PROGRESS, BLOCKED or UNVERIFIED as appropriate until the closure test and review requirements are satisfied.
9. Only the authorized reviewer may accept closure. CLOSED and Closure Accepted must move together in accordance with the Operating Protocol.
10. Record material decisions in the decision log and link the decision record to the relevant register row.

### 4.2 Field mapping: evidence-item template to existing Notion register

| Evidence-return template field | Canonical destination | Handling |
|---|---|---|
| Evidence record ID (PEM-EV-YYYY-NNNN) | Restricted evidence repository | Unique evidence-item identity; do not replace Evidence ID |
| Related ECR request(s) | Evidence-item record + ECR register cross-reference | Retain all applicable ECR IDs |
| Phase 0 source/instrument | Evidence-item record | Record source document/version |
| Actor category | Evidence-item record | Use controlled category vocabulary |
| Organisation reference | Restricted evidence-item record | Controlled ID only; no personal data in public repo |
| Claim/question and value/finding | Evidence-item record; concise summary in Notes / Finding | One material claim per evidence item |
| Unit/period/scope | Evidence-item record | Preserve units, geography, period and product form |
| Evidence class E1–E4 | Evidence-item record | Evidentiary strength; do not map directly to Notion Evidence Class |
| Source/issuer and source authority | Evidence-item record | Include authority/competence for the claim |
| Source date, validity, retrieval/observation date | Evidence-item record; Evidence Date in Notion | Evidence Date is a summary date, not a substitute for validity metadata |
| Controlled evidence reference | Evidence Reference in Notion | Use controlled reference/index; avoid unrestricted sensitive links |
| Verification method | Evidence-item record | Issuer confirmation, cross-check, observation, instrument reading, document review, etc. |
| Verifier and role | Evidence-item record; Reviewer Role in Notion where relevant | A role label is not proof of appointment |
| Limitations/contradictions | Evidence-item record; summary in Notes / Finding | Preserve contradictory and negative findings |
| Confidentiality/lawful collection basis | Restricted evidence-item record | Reference approved basis/restrictions; do not assert legal sufficiency |
| Review outcome | Evidence-item record | Keep distinct from requirement/gate Status |
| Follow-up action and owner | Evidence-item record and existing Dependency/Proposed Owner Role fields | Do not invent an appointment or assign a named person |
| Review date | Last Reviewed in Notion | Update only after an actual review |
| Reviewer sign-off | Restricted review/decision record; link from Notion | No closure without authorized acceptance |

### 4.3 Two classifications must remain separate

The two taxonomies answer different questions:

- **E1–E4 in the evidence-return template** express evidence strength/provenance: E1 independently verified; E2 documentary; E3 declared; E4 assumption/unknown.
- **Evidence Class in Notion** expresses the way evidence was obtained: Declared; Hub-recorded; Device-measured; Independently verified; Documentary/official; Technical test result.

Do not equate E1 with a single Notion option or E2 with Documentary/official. For example, an official document may be documentary/official as an acquisition class, while its evidentiary strength still depends on authenticity, scope, validity and whether it actually supports the claim. Record both dimensions in the evidence-item record.

### 4.4 Evidence-item state is not register Status or gate decision

The template distinguishes evidence-item states (Requested, Received, Under review, Accepted, Rejected, Expired, Superseded, Contradictory, etc.) from decision-gate states (Pass, Fail, Unresolved, Not assessed, etc.).

The Notion Status field is governed by the Operating Protocol and tracks the requirement/action/gate lifecycle. It must not be repurposed to mean merely “evidence received.” Likewise, evidence receipt or an evidence-item review outcome does not automatically pass a decision gate.

Keep the detailed evidence-item state and review outcome in the evidence-item record. Use the Notion Status and Closure Accepted fields only under the existing protocol.

## 5. Deliverable 013 alignment

Deliverable 013 already requires:
- source, date, role, method, confidence and limitations;
- facts, estimates, opinions, aspirations and conditional statements to be distinguished;
- consent and confidentiality conditions to be recorded;
- documentary support for feasibility-critical claims where available;
- negative findings and non-participation to be retained;
- evidence to be stored in a controlled repository;
- each record to link to the appropriate CV/E register item; and
- the register status to change only when its closure test is met.

The repository template v0.1 operationalises these requirements and adds consistent fields for site connectivity, buyer/producer volume evidence, provider due diligence, privacy, review and return-package completeness. It is therefore a supporting return format, not a replacement for Deliverable 013 or the Notion register.

**Authority boundary:** Deliverable 013 remains draft for sponsor review and is not authorised for external circulation until approved. The template does not authorize outreach, collection, consent, site access, procurement, appointment, trading or deployment.

## 6. E-021 / Level 1 handling

E-021 is the only inspected row with substantial evidence notes and a populated evidence class/reference. Its record correctly distinguishes source reviews, mocked-DOM logic-harness results and failed browser-launch attempts. It explicitly preserves:
- browser rehearsal outstanding;
- 16-step operator execution outstanding;
- browser execution of the 12 negative tests outstanding;
- independent review outstanding;
- DEF-L1-001 and DEF-L1-002 OPEN; and
- EVI-21 OPEN / Closure Accepted NO.

Continue to keep each new run, source review or independent review as a distinct evidence item linked to E-021. Do not create another E-021 requirement row. Do not collapse mocked-DOM assertions into browser acceptance evidence.

## 7. Privacy and repository boundary

- The public GitHub repository may contain blank templates, schemas, non-identifying process documentation, approved aggregate findings and synthetic test artefacts.
- Raw interview notes, named buyer contacts, producer membership lists, identity documents, private quotations, bank details, signatures, confidential contracts, credentials and personal data belong only in the approved restricted evidence repository.
- Public repo references must be non-identifying controlled IDs or approved aggregate references; do not publish raw private URLs or attachments.
- A Notion link is not automatically an access-control boundary. Access must be checked and governed at the underlying restricted repository.
- The current Evidence Reference property is a URL field. For multiple supporting items, use a controlled evidence index/bundle as the single primary reference and list the constituent controlled IDs within that restricted index.

## 8. Gaps and recommendations

### No schema change recommended now

The existing schema already provides the core gate-control fields. Adding evidence-state, verification-method, E1–E4, source-authority, scope, consent or contradiction columns to the master register now would risk turning it into a second detailed evidence database and duplicating the return record.

### Operational gaps to address when approved evidence collection begins

1. **Evidence repository location and permissions:** confirm the restricted repository, access roles, retention and approved sharing rules before collecting participant or confidential data.
2. **Evidence-item indexing:** establish a controlled evidence-item index using PEM-EV IDs, linked to one or more existing Evidence IDs and ECR IDs. This can initially be a folder/index within the approved repository, not a new Notion database.
3. **Primary reference convention:** use one stable index/bundle URL or controlled reference per Notion requirement row; keep constituent evidence-item IDs in the restricted index.
4. **Reviewer appointment:** reviewer roles are blank on 23 records. Confirm actual appointments and independence before review/closure; do not fill names speculatively.
5. **Status hygiene:** update register status only when work starts, a real blocker exists, a claim remains unverified, or a gate is formally deferred/closed under the protocol.
6. **ECR crosswalk:** every evidence-item record should state its ECR-01–ECR-14 linkage where applicable, while preserving the existing CV/E row mapping.
7. **Template wording alignment:** retain the current evidence-item template, but make explicit in its usage note that the Notion row remains the requirement/gate record and the PEM-EV item is supporting evidence. This prevents readers interpreting “one record per claim” as “one new master-register row per claim.”

### Not authorized / not performed

- No Notion schema change.
- No Notion row creation, deletion, merging or status change.
- No external outreach, interview, site visit, data collection or provider contact.
- No evidence accepted and no gate closed.
- No new ECR status or technology decision.
- No change to WP-05 or live-pilot authorization.

## 9. Conclusion

The existing Notion Evidence Register is suitable to remain the single master register for Phase 0 evidence requirements, validation actions and decision gates. The new repository template is suitable as the standard supporting evidence-item return record, subject to the programme's existing sponsor approval and restricted-data controls.

The reconciliation is complete at the design and inventory level. Actual evidence acquisition, evidence-item indexing and reviewer assignment remain future controlled activities. The database remains unchanged, all 24 active records are preserved, and no acceptance or authorization is implied.

## 10. Sources inspected

- Notion: Phygital Phase 0 — Evidence Register (data source `collection://9010523b-0a0f-473c-84f4-89c4597a2594`).
- Notion: Evidence Register — Operating Protocol.
- Notion: Deliverable 013 — Buyer, Producer, Hub & Provider Validation Pack v1.0.
- Repository: `docs/delivery/phase0-evidence-return-and-validation-record-template.md`.
- Repository: `docs/delivery/wp03-phase0-evidence-reconciliation.md`.
- Repository: `docs/delivery/wp03-evidence-closure-request-register.md`.
