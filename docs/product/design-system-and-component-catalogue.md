# Design system and component catalogue

**Source:** 024-E §12 and §6.  
**Status:** required future design-system specification; no UI framework or visual identity is selected here.

## Design foundations
- Accessible typography, spacing, layout, responsive breakpoints and focus states.
- Neutral, consistent status and evidence semantics; never use colour alone.
- Content voice explains what happened, who/what is the source, what is permitted next and what remains uncertain.
- Raw CSS is the current styling preference; any framework-specific styling choice requires a documented decision.
- No brand palette, logo or final typography is implied by this requirements catalogue.

## Component families
1. Navigation: application shell, breadcrumbs, active organisation/capacity selector, accessible menus.
2. Inputs: text, number, unit-aware quantity, currency, date/time, search/filter, file upload and assisted capture.
3. Evidence: class/type labels, provenance panel, issuer/scope/expiry, review decision, secure document preview.
4. Transaction: quote version comparison, accepted-terms snapshot, order-line lineage, reservation/movement distinction.
5. Status: state label, explanation, source/actor/time, next permitted action, hold reason and escalation.
6. Timeline: event history, audit trail, version comparison, trace-forward/trace-back.
7. Data display: tables, responsive cards, filters, pagination, empty/loading/error states.
8. Safety: confirmations, destructive action guard, alerts, reason capture, permission-denied state.
9. Offline: connection indicator, pending queue, sync outcome, conflict resolution, device/session context.
10. Communications: notification preference, delivery status, message centre, critical notice acknowledgement.
11. Public disclosure: public-safe passport/listing card, QR landing, data freshness and caveat panel.
12. Review: evidence queue, independent reviewer panel, decision and appeal separation.

## Component contract
- Components present information and collect intent; they never confer authority.
- All actions call server-authorised commands with organisation, capacity, scope and current-state checks.
- Components must support keyboard, screen reader, zoom, narrow viewport and translation expansion.
- Every component needs states, accessible name, validation behaviour, error recovery and test coverage.
- Avoid a component library decision until TSBBF and frontend ADRs are approved.
