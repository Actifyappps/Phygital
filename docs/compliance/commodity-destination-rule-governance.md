# Commodity and destination rule catalogue — governance design

**Status:** Technology-neutral design; no commodity or destination selected and no regulatory pathway approved.

## 1. Governing principle
There is no generic “Kenyan export compliance” checklist that is valid for every commodity, product form, destination, buyer and shipment. A rule must be attached to a specific scope and supported by an authoritative source.

## 2. Rule record
Each rule should identify:
- Rule ID, title, subject and requirement statement.
- Commodity, product form/grade, origin and destination scope.
- Trigger event and affected workflow stage.
- Issuing authority/source, official URL/reference and jurisdiction.
- Source publication/effective date, last checked date and next review.
- Applicability conditions, exceptions and interpretation notes.
- Required document, inspection, test, licence or action.
- Competent issuer/performer and evidence required.
- Consequence: block, hold, warn, require human review or informational.
- Rule owner/reviewer, approval state, version and supersession links.

## 3. Lifecycle
Proposed → source-checked → professionally reviewed → approved for defined scope → effective → under review → superseded/withdrawn. Only an authorised, reviewed rule version may drive a production checklist. Expired or conflicting sources must trigger review, not silent pass.

## 4. Product behaviour
- Display jurisdiction, commodity/product form, date and source for every requirement.
- Distinguish an official legal requirement from buyer specification, voluntary standard, programme control and internal checklist.
- Record applicability and unresolved interpretation; do not claim that an uploaded document establishes compliance.
- Escalate ambiguity to a qualified adviser or competent authority.
- Do not auto-approve a shipment or replace official inspection/certification/customs decisions.
- Do not hard-code candidate tea, honey, avocado or destination assumptions as universal rules.

## 5. Relationship to other domains
Compliance rules inform product specification, batch eligibility, evidence, document requirements, buyer terms and shipment readiness. The rule catalogue owns source/version/applicability; workflow modules own the resulting state transitions; evidence owns the supporting records.

## 6. Tests
Cover wrong commodity/destination scope, expired source, future-effective rule, conflicting sources, missing document, unqualified issuer, rule change after quotation/order, human override attempt, and rule supersession with historical transaction preservation.
