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
