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
