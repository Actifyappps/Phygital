# Digital product passport and public projections

**Sources:** Concept Paper v1.1; Technical Development Manual v3.0; 024; 024-E; 024-F; 024-R.  
**Status:** staged capability and design requirement. No passport format, certification, blockchain or QR deployment is approved by this document.

## Purpose
A product/batch passport is a controlled presentation of selected, current information about a product and its provenance. It can help a buyer understand origin, specification, batch history, evidence summary and permitted status. It is not a certificate, regulatory clearance, proof of title, proof of custody or substitute for source records.

## Source-of-truth boundary
The passport is an assembled, read-only projection. Authoritative facts remain in their owning contexts:
- product identity and specification — catalogue;
- producer/source and supply declaration — supply/organisations;
- batch, quantity and physical events — inventory/hub-services/fulfilment;
- evidence, issuer, class, acquisition type and review — evidence;
- compliance rule version and decision — compliance-rules;
- documents and issuing authority — documents;
- hold/withdrawal/recall status — product-integrity;
- public disclosure permission and purpose — privacy/authority.

No user edits a passport to change a source fact. Corrections happen in the authoritative context and the projection is regenerated.

## Public and authenticated views
- Public QR resolves only to an allow-listed, revocable, minimal projection.
- Public view excludes personal data, member identities, confidential buyer specifications, private evidence files, internal notes, security data and restricted identifiers.
- Authenticated buyer view may reveal additional fields only after current organisation membership, purpose and access are revalidated.
- QR tokens must not be treated as authentication credentials or long-lived bearer access to private records.
- Every view identifies last-updated time, source/meaning, evidence limitations and whether the item is held, withdrawn or superseded.
- Expired/revoked evidence and stale rules are not shown as current.

## Content integrity and lifecycle
- Stable public identifier separated from internal database identifiers.
- Versioned projection with generation time, source references and schema version.
- Cache invalidation/revocation path for holds, recalls, permission changes and compromised links.
- Rate limiting, abuse monitoring and safe not-found responses to prevent enumeration.
- No QR view bypasses login, consent/purpose or object-level authorization.
- A QR scan is not proof that a buyer inspected, accepted or verified the product.

## Phase gates
1. **Design:** define disclosure policy, public fields, threat model and source lineage.
2. **Prototype:** synthetic-only, no personal or live trade data.
3. **Controlled pilot:** only after sponsor/legal/security/privacy approval and real participant testing.
4. **Advanced anchoring:** blockchain or other immutable anchoring only after a separate evidence-based decision; do not duplicate authoritative records on-chain.
