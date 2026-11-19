# Integration boundary catalogue

**Status:** logical integration seams only. No provider is selected, contracted or authorised.

| Integration class | Data/control boundary | Required safeguards |
|---|---|---|
| Identity / authentication | Authentication assertion and subject identifier | OIDC/OAuth decision, MFA policy, session controls, no credential storage in domain records |
| Email/SMS/notifications | Minimal recipient and template variables | Consent/purpose, delivery logs, retry limits, opt-out, no secrets or sensitive documents |
| Object/file storage | Private evidence objects and signed access references | Encryption, short-lived access, malware scanning, content type/size controls, retention and access audit |
| Measurement devices | Device identity, readings, calibration and operator association | Pairing/trust, signed or authenticated readings where feasible, replay protection, offline queue and calibration validity |
| Payment provider | Buyer-to-seller payment instruction/status and provider reference | Provider authorisation, webhook signature, idempotency, replay protection, reconciliation; platform does not hold funds |
| Logistics/carrier | Booking/reference and milestone status | Provider identity, event provenance, correction/replay handling, no inferred dispatch |
| Regulatory/standards/laboratory | Source references, document/verification status, authorised responses | Competent authority, source date/version, human review; no scraping or automation presented as legal clearance |
| FX/rates | Indicative or provider-sourced rate snapshot | Source/time/currency pair, disclosure, no guaranteed rate or financial advice |
| Analytics/reporting | Minimised and purpose-limited data | Aggregation, access controls, metric lineage and no unsupported impact claims |

Every adapter needs a contract, owner role, data classification, secrets plan, failure/retry model, idempotency, timeout, rate limits, observability, reconciliation and exit strategy. External systems are untrusted input sources; validate signatures, schema, identity and authority.
