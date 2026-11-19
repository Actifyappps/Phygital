# Evidence class, provenance and lineage model

**Audit link:** 024-R F-01. This file records the required distinction; it does not amend 024-C or authorise a production data schema.

## Two independent axes
- **Evidence class / strength:** E1–E4, according to the programme's controlled evidence semantics.
- **Acquisition/provenance type:** producer declaration, operator observation, device measurement, third-party document, competent independent verification, provider event, system-generated record, or other explicitly defined source.

Never encode both axes in one enum. A high-quality source can still be a declaration; a device reading is not automatically independent verification. An E-class must not be inferred solely from acquisition method.

## Minimum lineage metadata
Evidence ID; subject/entity and version; evidence class; provenance type; issuer/observer; organisation and capacity; method; event/observation time; recorded time; source reference; original/derived indicator; file/media hash where applicable; instrument/device/calibration reference where relevant; verification status and reviewer; limitations; access classification; retention rule; supersession/withdrawal links.

## Integrity and lifecycle
Preserve original artefact and metadata subject to lawful retention; derived evidence links to source evidence and transformation version. Record corrections as new versions with reason and actor. Revocation, expiry, dispute, withdrawal and supersession remain visible. Public projections expose only explicitly approved summaries.

## Required tests
Cross-axis independence; missing provenance; unauthorised issuer; expired evidence; altered file; duplicate evidence; stale measurement; contradictory evidence; reviewer conflict; access leakage; correction without history loss; evidence deletion/retention control.


## Canonical E1–E4 evidence classes (Framework 008 §4.1)

Use these exact meanings for every material claim:

- **E1 — Independently verified:** confirmed by a competent authority, accredited body, authenticated system record, site inspection or independently corroborated evidence appropriate to the claim.
- **E2 — Documentary evidence:** supported by a current document from the relevant party, but not independently authenticated or validated.
- **E3 — Declared:** stated by a producer, buyer, intermediary or project participant without sufficient supporting evidence.
- **E4 — Assumption / unknown:** inferred, proposed or not yet investigated.

Record source, date, owner, validity/expiry date where applicable and limitations. An expired certificate is not current evidence. A buyer's historic purchase record does not prove a current purchase commitment.

**Separate axis:** acquisition/provenance type describes how the evidence was obtained (e.g. declared, hub-recorded, device-measured, independently verified, documentary/official, technical test result). It is not the E1–E4 class. Store/report both. Never map “device-measured” automatically to E1.

**Scoring caution from Framework 008:** E3/E4 claims should normally score no higher than 2/5 unless the assessment lead records a reason. Weighted scores never override a failed or unresolved hard-stop gate.
