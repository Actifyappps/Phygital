# Product surface and navigation map

This map translates 024-E into a coherent surface model. It is a requirement index, not a wireframe, implemented screen or authorization decision.

| Surface | Intended users | Principal capabilities | Access boundary |
|---|---|---|---|
| Public marketplace | Anonymous visitors, prospective buyers | Public-safe listing discovery, product and organisation projections, enquiry entry | Explicit allow-list only; no private evidence, personal data or confidential buyer requirements |
| Buyer portal | Buyer staff and authorised buyer representatives | Buyer profile, requirements, enquiries, compatibility results, quote review/acceptance, order and document/status visibility | Verified organisation membership and scoped buyer capacity |
| Producer / supplier portal | Producers, cooperatives and authorised agents | Assisted onboarding, supply declarations, source/batch evidence submission, availability, listing requests and order progress | Producer/source authority; declared supply is not verified inventory |
| Hub operations portal | Approved hub operators and assigned staff | Service appointments, intake capture, weighing/photo/document capture, service evidence and exception reporting | Facility-specific mandate and exact service scope; no assumed custody |
| Platform administration and operations | Platform operations, support and authorised commercial/partner roles | Partner/facility readiness, queue and exception triage, approved listing/role workflows, service and case coordination | Least privilege; no blanket ability to alter domain facts; no party authority inherited from support role |
| Reviewer and assurance workspace | Independent reviewers, assurance roles and authorised oversight | Evidence/authority review, audit trail, compliance-source review, gate status, appeals and metric lineage | Read-only by default; independent review and explicit review permissions |

**Capacity rule:** Seller and exporter actions are separately authorised capacities, not a seventh implicit portal or a single combined role. Their permitted actions appear only in an appropriate authorised surface and are checked server-side.

**Provider integration operations:** Provider callbacks, reconciliation and integration health are system/operations capabilities behind restricted controls, not a presumed public-facing portal.

## Interaction requirements
- Progressive disclosure and minimum-documentation assisted journeys without weakening mandatory evidence.
- Clear distinction between declared, submitted, received, measured, independently verified, accepted, reserved, moved and dispatched.
- Explicit actor, timestamp, reason and evidence for high-impact state changes.
- Accessible keyboard, screen-reader, contrast, focus, error and language behaviour.
- Low-bandwidth resilience and safe retry; offline actions must be visibly pending until server-authoritative reconciliation.
- No UI control may imply an unavailable legal, financial, certification or custody authority.
- Public listing projections must exclude internal notes, personal data, confidential buyer specifications and sensitive evidence.

## Surface-to-domain ownership
Screens display domain-owned state; they do not create their own competing status model. Every action maps to a command, permission tuple, validation rule, event, audit record and acceptance test.
