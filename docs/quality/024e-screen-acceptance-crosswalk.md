# 024-E screen acceptance crosswalk

**Source:** 024-E v0.1, §13–15.  
**Status:** test requirements only; no screens or accessibility conformance are claimed implemented.

| # | Acceptance requirement | Test domain |
|---:|---|---|
| 1 | Multi-organisation user can identify active organisation before material action | identity / UI |
| 2 | Seller and exporter capacity are visibly distinct and separately enforced | authority / UI / security |
| 3 | Protected records are inaccessible through navigation, search, direct links, downloads, notices and exports | access control / privacy |
| 4 | Public listing discloses only approved fields and distinguishes evidence class/type | public projection / evidence |
| 5 | Declared supply is never labelled verified or available stock without checks | supply / evidence |
| 6 | Duplicate/incompatible batch backing is blocked and visible | marketplace / inventory |
| 7 | Hub service screens do not expose custody/release/dispatch under current baseline | hub-services / authority |
| 8 | Quote acceptance identifies exact version; expired/superseded quote cannot be accepted | quotations-orders |
| 9 | Order displays one accepted quotation and line-level source lineage | quotations-orders / commercial |
| 10 | Reservation and physical movement are separate records and timeline events | inventory / fulfilment |
| 11 | Payment screens identify source/provider status and never imply platform-held funds | payment-status |
| 12 | Evidence review preserves source, rationale, class, type and scope | evidence / audit |
| 13 | Recall/hold supports trace-back and trace-forward without broad disclosure | product-integrity / privacy |
| 14 | Offline changes remain pending until server acceptance; revoked identities/devices cannot sync privileged actions | offline-sync / identity |
| 15 | Validation, conflict, timeout and provider failures preserve input and prevent duplicate actions | UI / integrations |
| 16 | Core producer/hub journeys work on narrow screens with keyboard and screen-reader support | accessibility |
| 17 | Language changes do not alter canonical values, authority, currency or rule selection | localization |
| 18 | Material actions create durable references and auditable outcomes | audit / all domains |

## UI design decisions still open (UI-OD-01–12)
Brand/tokens; frontend framework/rendering; language set and translation review; target devices/browser versions; formal accessibility review; notification providers/channels; offline command allow-list; public disclosure policy; assisted/shared-device SOP; legal terminology; analytics consent/retention; commercial fee/payer/proceeds presentation.

## Execution evidence
For each case record requirement ID, screen/build version, device/browser, viewport, locale, network condition, user/authority fixture, steps, observed result, accessibility method, logs/screenshots, defect, retest and reviewer disposition. Automated scans alone do not establish accessibility acceptance.


## UI-OD-01–UI-OD-12 — explicit open decision register

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

All 12 decisions remain OPEN. The interim controls are constraints, not approvals or final design decisions.
