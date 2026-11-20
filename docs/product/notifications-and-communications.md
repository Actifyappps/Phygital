# Notifications and communications

**Source:** 024 §6.12; 024-D; 024-E §9; 024-F.  
**Status:** logical requirements only; channels/providers and service levels are not selected.

## Notification semantics
A notification reports an event or requests an action. It is not itself the business event, acceptance, approval, legal service or proof of reading.

Each notification should carry:
- event and affected-record reference;
- intended recipient and organisation scope;
- action required and deadline only where defined;
- message template/version and locale;
- channel and provider reference;
- queued/sent/delivered/failed/expired status and timestamps;
- retry/idempotency and suppression key;
- privacy classification and preview-safe text;
- audit/correlation reference.

## Controls
- In-app, email, SMS or other channels remain options until provider, consent/purpose, contract and service levels are approved.
- No sensitive identity, buyer-confidential, commercial or evidence content in lock-screen previews.
- Links open authenticated records and re-check access; no bearer links to restricted records.
- Delivery, reading, acknowledgement, acceptance and completion are distinct.
- Duplicate/replayed events must not generate uncontrolled duplicate notices.
- Critical case/contract notices remain in the system record when external delivery fails.
- User preferences apply only where lawful and must not suppress legally or operationally required notices without an approved alternative.
- Record provider failure, bounce, suppression, retry and manual escalation.

## Domain and integration boundary
The notifications context owns templates, delivery attempts, preferences and delivery evidence. Domain contexts own the event being communicated. Provider adapters remain in `integrations/`; provider SDKs do not enter domain packages.
