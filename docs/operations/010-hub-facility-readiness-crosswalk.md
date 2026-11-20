# Deliverable 010 — hub and facility readiness crosswalk

**Notion source:** [Hub & Facility Readiness Assessment 010](https://app.notion.com/p/88c6808bcd9e82f7a96401215970f467)  
**Source version/date:** v1.0, 9 November 2026  
**Source status:** Assessment framework; no hub or TTI appointed or approved  
**Repository review:** 20 November 2026

## 1. Disposition

The facility capability register already contains the 010 scorecard, site-model ladder and HOLD treatment. This crosswalk closes the remaining traceability gap by making the full assessment controls and action register discoverable. It does not create a new facility domain or assert that a site has been assessed.

Primary homes:
- `docs/operations/facility-capability-register.md` — capability dimensions, scorecard, facility models and state transitions.
- `docs/operations/partner-and-provider-readiness.md` — partner diligence and permission.
- `docs/operations/physical-digital-service-boundaries.md` — physical/digital responsibility boundary.
- `docs/security/` and `docs/compliance/` — privacy, safety and commodity-specific controls.
- `evidence/partner-validation/` — retained site-specific evidence when obtained.

## 2. Facility capability is scope-specific

The assessment distinguishes four materially different functions:
1. Digital coordination: onboarding, connectivity, records, training and platform access.
2. Producer service point: supervised intake coordination, weighing, batch identification, photography and document capture, only with permission and suitable equipment.
3. Physical custody/storage/processing: receipt, possession, access control, storage, grading, packing or processing; separately assessed and authorised.
4. Inspection/laboratory/certification: competent, equipped and authorised providers operating within their specific accreditation or regulatory scope.

A facility can qualify for one function without qualifying for another. A public hub listing, institutional mandate, classroom, workshop or computer lab is not proof of project permission or commodity-handling authority.

**Pilot baseline: digital-only coordination.** Model B (digital site plus supervised evidence desk) is conditional on satisfactory assessment, written permission, equipment verification, risk assessment and procedures. Models involving aggregation, custody, warehousing, packhouse, cold-chain, laboratory or certification require separate facility-specific approval.

## 3. Assessment scorecard and hard gates

The existing weighted scorecard is retained in `facility-capability-register.md`:
- Authority and written permission — 15
- Digital infrastructure and uptime — 15
- Premises, accessibility and safety — 15
- Staffing and governance — 15
- Commodity-specific suitability — 15
- Operating cost and sustainability — 10
- Data protection and cybersecurity — 10
- Community/producer accessibility — 5

Each category is scored 0–5 and weighted to 100. A score is a decision aid only. The source decision bands are 80–100 (conditional eligibility), 65–79 (conditional/remediation), below 65 (do not select); any applicable hard-gate failure is a no-go regardless of score.

The twelve hard gates must remain visible in any site assessment:
- H-01 site owner/operator identified;
- H-02 written permission for the exact proposed activity;
- H-03 activity scope explicitly bounded;
- H-04 safe premises and access;
- H-05 named site lead and supervision;
- H-06 digital security and privacy controls;
- H-07 equipment fit for intended use;
- H-08 commodity-handling approvals, where applicable;
- H-09 insurance and liability allocation;
- H-10 operating cost and maintenance funding;
- H-11 incident, complaints and emergency procedures;
- H-12 accurate public representation; no misleading partner or endorsement claims.

For digital-only use, commodity-handling gates may be marked not applicable only with a written scope rationale. They cannot be silently waived if physical scope changes.

## 4. Evidence and operating controls

Site evidence should include, as applicable:
- ownership/management and authorised signatory;
- written visit and project-use permission;
- physical inspection, equipment inventory and connectivity tests at different times;
- accessibility, safety, fire, sanitation and hazard records;
- staffing, supervision, escalation and separation of duties;
- equipment calibration/maintenance where measurements are taken;
- commodity-specific conditions and competent-provider scope;
- costed utilities, staffing, connectivity, equipment, insurance and maintenance;
- privacy, cybersecurity, record retention and incident arrangements;
- draft or executed agreement with permitted activities, liability, data, costs, branding and change-control clauses.

Evidence provenance must distinguish producer-declared, hub-recorded, device-measured and independently verified information. A hub operator's observation is not certification. A measurement must identify instrument, calibration/maintenance status, operator, date and method.

The digital platform may link evidence generated at a producer site, approved aggregation point, packhouse, laboratory or other competent location without implying that the digital hub performed that activity.

## 5. Phase 0 site action register

The source's ten actions remain open until documentary evidence and authorised decisions exist:

| ID | Action | Required closure evidence |
|---|---|---|
| HUB-01 | Identify 2–3 candidate hubs/TTIs | Candidate list and verified contacts |
| HUB-02 | Confirm operating status and institutional control | Direct confirmation |
| HUB-03 | Obtain assessment-visit permission | Written permission |
| HUB-04 | Conduct digital-only site assessments | Completed scorecards and authorised photos |
| HUB-05 | Confirm whether physical handling is needed | Approved activity-scope note |
| HUB-06 | Cost staff, connectivity, equipment and utilities | Site operating budget |
| HUB-07 | Draft hub operating agreement | Counsel-reviewed draft |
| HUB-08 | Prepare SOPs and site safety checklist | Approved SOP pack |
| HUB-09 | Confirm data/network responsibilities | Security and privacy assessment |
| HUB-10 | Select preferred and reserve site | Signed decision record |

The source's current decision is **HOLD — no site selected**. The repository must not populate candidate names from public maps or present any institution as a partner without direct confirmation and written permission.

## 6. Roles and change control

Project lead, institution authority, site manager, operations lead, ICT/security lead, safety focal person, commodity/export lead, privacy lead/counsel and finance/commercial lead are proposed role descriptions, not appointments.

Any expansion from digital coordination to supervised producer services, physical custody, storage, processing, inspection or certification is a material scope change. Require a new activity-specific assessment, permissions, risk allocation, cost, procedures and authorised decision before changing the platform or public claims.

## 7. Repository acceptance

- [x] Scorecard and facility-model ladder already represented in the facility capability register.
- [x] Digital-only baseline and no-implied-custody boundary represented.
- [x] Full hard-gate and HUB-01–HUB-10 traceability captured here.
- [ ] No candidate site is evidenced as selected, permitted, assessed or approved.
- [ ] No site-specific SOP, budget, agreement or regulatory approval is evidenced as complete.

This is source-to-repository coverage, not site-readiness acceptance.
