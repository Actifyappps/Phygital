# 024-E screen and interaction source verification

**Source:** 024-E — Screen, Navigation & Interaction Specification v0.1, dated 19 November 2026.
**Status:** Draft for product, sponsor, operational, technical, accessibility, security, legal, data-protection and assurance review; not implementation or production authorization.
**Comparison date:** 20 November 2026.

## 1. Screen inventory comparison

Compared the Notion screen inventory headings with `docs/product/024e-screen-inventory.md` by screen ID and exact screen name.

| Surface | Screen IDs | Count |
|---|---|---:|
| Public marketplace | PUB-01–PUB-04 | 4 |
| Buyer portal | BUY-01–BUY-08 | 8 |
| Producer/supplier portal | SUP-01–SUP-07 | 7 |
| Hub operations portal | HUB-01–HUB-05 | 5 |
| Platform administration and operations | ADM-01–ADM-07 | 7 |
| Reviewer and assurance workspace | REV-01–REV-05 | 5 |
| **Total** | **PUB/BUY/SUP/HUB/ADM/REV** | **36** |

| Screen ID | Screen name |
|---|---|
| PUB-01 | Marketplace landing and search |
| PUB-02 | Listing detail |
| PUB-03 | Enquiry initiation |
| PUB-04 | Public process/trust information |
| BUY-01 | Buyer overview |
| BUY-02 | Buyer organization and representative profile |
| BUY-03 | Buyer requirements |
| BUY-04 | Enquiry workspace |
| BUY-05 | Quotation review |
| BUY-06 | Order detail |
| BUY-07 | Payment status |
| BUY-08 | Fulfilment and shipment timeline |
| SUP-01 | Supplier overview |
| SUP-02 | Organization and member access |
| SUP-03 | Supply declaration |
| SUP-04 | Batch and evidence detail |
| SUP-05 | Listing editor |
| SUP-06 | Buyer enquiry and quotation response |
| SUP-07 | Order and service record |
| HUB-01 | Hub task queue |
| HUB-02 | Record service event |
| HUB-03 | Intake/service record |
| HUB-04 | Measurement/evidence capture |
| HUB-05 | Exception reporting |
| ADM-01 | Operations dashboard |
| ADM-02 | Organization onboarding |
| ADM-03 | Authority and qualification review |
| ADM-04 | Listing/content moderation |
| ADM-05 | Support and incident console |
| ADM-06 | Rule and configuration governance |
| ADM-07 | Audit, reporting and readiness |
| REV-01 | Assigned review queue |
| REV-02 | Evidence review |
| REV-03 | Traceability view |
| REV-04 | Complaint, appeal and recall review |
| REV-05 | Readiness and test evidence |

**Comparison result:** 36 source screen IDs, 36 repository screen IDs, no missing or extra IDs, and no screen-name mismatches.

## 2. Journey comparison

| Journey | Source title | Repository mapping |
|---|---|---|
| J-01 | Producer supply declaration to public listing | Mapped in journey crosswalk |
| J-02 | Buyer discovery to quotation acceptance | Mapped in journey crosswalk |
| J-03 | Hub service event and evidence capture | Mapped in journey crosswalk |
| J-04 | Order to reservation and physical movement | Mapped in journey crosswalk |
| J-05 | Direct payment status and reconciliation | Mapped in journey crosswalk |
| J-06 | Evidence hold, complaint or recall | Mapped in journey crosswalk |

**Comparison result:** all six journey IDs J-01–J-06 are present in both source and repository crosswalk.

## 3. Screen-level acceptance

024-E §13 contains 18 minimum acceptance criteria. The repository crosswalk `docs/quality/024e-screen-acceptance-crosswalk.md` contains 18 corresponding numbered test requirements. These are acceptance requirements, not executed UI tests or accessibility certification.

## 4. Open UI design decisions

All 12 source decisions UI-OD-01–UI-OD-12 are preserved below with the source owner/reviewer and interim control.

| ID | Decision/evidence needed | Owner/reviewer | Interim control |
|---|---|---|---|
| UI-OD-01 | Final brand, visual identity, design tokens and content voice | Sponsor/product | Use neutral accessible placeholder design |
| UI-OD-02 | Final frontend framework and rendering strategy | Technical lead / TSBBF | Framework-neutral specification |
| UI-OD-03 | Final language set and translation review process | Sponsor/operations | Avoid hard-coded text; no unreviewed legal translations |
| UI-OD-04 | Target devices, minimum browser versions and field-device capability | Operations/technical | Responsive web baseline; no device dependency |
| UI-OD-05 | Formal accessibility conformance and user testing | Accessibility lead/reviewer | WCAG 2.2 AA design target |
| UI-OD-06 | Notification providers, channels, consent and service levels | Sponsor/legal/operations | In-app record; no channel assumption |
| UI-OD-07 | Offline command allow-list and device security | Operations/security | High-risk actions online-only |
| UI-OD-08 | Public disclosure and confidentiality policy | Sponsor/legal/data protection | Allow-list public projection |
| UI-OD-09 | Assisted capture, shared-device and participant-protection SOP | Operations/legal/data protection | Minimize data; no credential sharing |
| UI-OD-10 | Approved terminology for commodity/destination-specific legal claims | Export/legal specialists | No generic compliance claims |
| UI-OD-11 | Screen analytics, consent and retention | Product/data-protection | No unnecessary behavioural tracking |
| UI-OD-12 | Commercial fee, payer and producer-net-proceeds presentation | Sponsor/finance/legal | No fee collection or unapproved fee display |

## 5. Other experience requirements represented

- Six user-facing surfaces and their audiences/navigation.
- Status/evidence display, action hierarchy, form validation, secure evidence/file handling, quantity/money presentation and irreversible-action confirmation.
- Responsive behaviour, accessibility, localization/language, low-bandwidth/intermittent connectivity, assisted and shared-device use.
- Notification and communication semantics and terminology controls.
- Screen state catalogue and design-system/component inventory.
- Every material UI action maps to a 024-D command/query and a 024-B state transition; UI visibility is not authorization.

## 6. Review and implementation boundary

024-E requires task-based user discovery, low-fidelity wireframe validation, target-device/low-connectivity testing, accessibility/privacy/security/usability review and acceptance before implementation is treated as production-ready. The source does not claim participant interviews, user tests, visual prototypes, frontend implementation or deployment.

Screen requirements and acceptance tests do not establish that screens exist. No framework, rendering strategy, brand system, language set, notification provider, device baseline, analytics policy or public-disclosure policy is selected by this verification. UI-OD-01–12 remain OPEN.

Migration 001 remains HOLD; Migration 002 remains NOT AUTHORISED; EVI-21 remains OPEN. No live trade, custody, funds handling, escrow or shipment is authorized.