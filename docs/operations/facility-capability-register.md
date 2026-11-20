# Facility capability register

A facility record must distinguish site identity from approved service scope. Assessment does not equal appointment.

## Capability dimensions
- Digital connectivity and power reliability.
- Accessible workspace, privacy and user assistance.
- Weighing/measurement equipment, calibration and maintenance.
- Photography/document capture and secure connectivity.
- Staff competence, availability and supervision.
- Intake/service process, queue and incident handling.
- Security, safety, fire, hygiene, accessibility and insurance.
- Storage, custody, processing, grading, packing or laboratory capability (separately assessed; off by default).
- Permissions, site-owner agreement, regulatory scope and expiry.
- Cost, service capacity, service hours and escalation contact.

## Decision states
Candidate → assessed → remediation required / unsuitable / conditionally serviceable → approved for named service scope → active for bounded period → suspended / expired / withdrawn. No transition is implied by a database record alone; retain assessment evidence and authorising role.

## Baseline pilot assumption
Digital coordination only. Add producer-service functions only after written permission, equipment verification, risk assessment and approved SOP. Custody/storage/processing and laboratory/certification are separate high-control decisions.


## Deliverable 010 facility scorecard

| Category | Weight |
|---|---:|
| Authority and written permission | 15 |
| Digital infrastructure and uptime | 15 |
| Premises, accessibility and safety | 15 |
| Staffing and governance | 15 |
| Commodity-specific suitability | 15 |
| Operating cost and sustainability | 10 |
| Data protection and cybersecurity | 10 |
| Community/producer accessibility | 5 |
| **Total** | **100** |

Score each 0–5. Weighted score = (score ÷ 5) × category weight. Bands: 80–100 eligible for conditional pilot approval only if every hard gate passes; 65–79 conditional/remediation; below 65 do not select. Any hard-gate failure is no-go regardless of score.

## Facility hard gates H-01–H-12

1. Site owner/operator identified.
2. Written permission for the exact project activity.
3. Scope of activity clearly limited.
4. Safe premises and access.
5. Named site lead and supervision.
6. Digital security and privacy controls.
7. Equipment fit for intended use.
8. Commodity-handling approvals, if applicable.
9. Insurance and liability allocation.
10. Operating cost and maintenance funding.
11. Incident, complaints and emergency procedures.
12. No misleading representation of site status.

For a digital-only coordination site, commodity-handling gates may be marked not applicable only with a written scope justification. They must not be silently waived if physical handling is later introduced.

## Deliverable 010 — candidate-site status and facility-model controls

The Phase 0 assessment currently records three placeholders, not selected facilities:

| Candidate | Intended starting model | Permission / readiness | Current decision |
|---|---|---|---|
| SITE-001 | Kericho digital-only baseline | Open; site and authorised operator not yet evidenced | HOLD |
| SITE-002 | Kericho digital-only / TTI collaboration | Open; institutional permission and exact scope not evidenced | HOLD |
| SITE-003 | Reserve digital-only candidate; geography to be confirmed | Open | HOLD |

Do not populate these with names inferred from public hub maps. Confirm site existence, operational status, owner/operator, authorised signatory, access, activity permission and actual capability directly.

Facility model is a scope ladder, not an automatic maturity progression:

1. **Digital-only coordination site:** onboarding, calls, records, training and platform access.
2. **Digital site plus supervised evidence desk:** photography, batch labels, document capture and supervised weighing using fit, verified equipment.
3. **Producer service / aggregation point:** intake, weighing, temporary segregation and batch creation only after separate authority, safety and operating controls.
4. **Warehouse / packhouse / cold-chain:** separately assessed and authorised for the exact commodity and activity.
5. **Accredited laboratory / inspection:** only within the provider's current accreditation/authorisation scope.

A site may support one function without qualifying for another. Digital coordination is the pilot baseline; physical custody, storage, grading, packing, processing, laboratory testing and certification remain excluded unless separately evidenced and approved. Evidence recorded at an approved off-site facility may be linked to the batch without implying that the digital hub performed the activity.
