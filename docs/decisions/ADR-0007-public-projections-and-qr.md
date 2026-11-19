# ADR-0007 Public projections and QR-linked records

**Status:** OPEN — no public QR exposure model approved.  
**Context:** The concept and Level 1 prototype include QR-linked batch summaries. 024-F requires privacy, abuse and public projection controls.

## Decision required
Define the minimum public batch/listing fields, audience, purpose, access duration, revocation, cache behaviour and evidence of consent/authority.

## Mandatory criteria
- Public projection is a separate, minimised view—not direct access to the private batch/evidence record.
- No personal data, confidential buyer information, internal notes, private documents, credentials or sensitive location data by default.
- Tokens must be unguessable, scoped, revocable and rate-limited; avoid enumeration and permanent bearer links.
- Record generation, access and revocation; handle stale cached copies and QR replacement.
- Test scraping, replay, token leakage, cross-tenant access, expired links and unauthorised data expansion.

No public QR feature is approved for production by this ADR.
