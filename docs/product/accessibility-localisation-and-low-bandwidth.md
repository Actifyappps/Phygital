# Accessibility, localization and low-bandwidth requirements

**Source:** 019; 021–023; 024-E §8.  
**Status:** design/test requirements; WCAG 2.2 AA is a target for review, not a certification claim.

## Responsive and device strategy
- Mobile-first for producer and hub tasks; scale to tablet and desktop.
- Dense reviewer/admin tables must adapt without losing row identity or critical context.
- Camera, file capture, QR/barcode scanning and connected devices remain optional enhancements, not prerequisites for basic entry.
- Long organisation names, large quantities, translated labels and currency formats must not break layouts.

## Accessibility
- Semantic structure, labelled controls, visible keyboard focus and full keyboard operation.
- Screen-reader announcements for status changes, validation and asynchronous results.
- Adequate contrast; no colour-only meaning; accessible tables, dialogs and menus.
- Touch targets suitable for mobile, reduced-motion support, meaningful media alternatives.
- Clear session-expiry warning and safe recovery.
- Automated scans are insufficient; manual keyboard, screen-reader and mobile testing required.

## Localization
- Translation catalogue with stable canonical values; no hard-coded UI strings.
- Locale formatting for dates, times, numbers and currencies without mutating stored values.
- No text embedded in images; allow longer labels and future right-to-left expansion.
- Legal/commercial documents retain authoritative source language/version and approved translation status.
- Language choice never changes jurisdiction, currency, authority or compliance-rule applicability.

## Low-bandwidth and intermittent connectivity
- Small payloads, progressive loading, resilient upload and explicit retry.
- Preserve safe user input across connectivity interruption.
- Distinguish local draft, queued, sent, server-received, accepted, rejected and conflict states.
- Do not imply offline availability of authoritative current stock, mandates, quote acceptance or payment/dispatch authority.
- Sensitive cached data must be minimised, encrypted where stored, expire and be revocable on shared/lost devices.
- Measure actual field performance on representative devices/networks before setting thresholds.

## Shared-device and assisted use
- No credential sharing or implicit identity transfer between users.
- Clear sign-in/out and active organisation/capacity context.
- Short session handling, local data clearing and privacy-preserving previews.
- Record assistant/operator and represented participant distinctly; capture authority/purpose where required.
