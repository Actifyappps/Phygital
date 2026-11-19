# Product surface and navigation map

This map translates 024-E into a coherent surface model. It is a requirement index, not a wireframe, implemented screen or authorization decision.

| Surface | Intended users | Principal capabilities | Access boundary |
|---|---|---|---|
| Public discovery | Anonymous visitors, prospective buyers | Public product/listing projections, organisation-facing information, contact/enquiry entry | Only explicitly public, reviewed fields; no private evidence or personal data |
| Buyer workspace | Buyer staff and authorised buyer representatives | Buyer profile, requirements, enquiries, quote comparison, accepted quote/order visibility, documents and status | Organisation membership + scoped buyer capacity |
| Producer/supplier workspace | Producer, cooperative and authorised agents | Supply declaration, source/batch evidence submission, availability, listing request, order progress | Producer authority; declared supply is not verified inventory |
| Hub service workspace | Approved hub operators and assigned staff | Service appointment, intake capture, weighing/photo/document capture, exception reporting | Site-specific permission and service scope; no assumed custody |
| Seller/exporter workspace | Separately authorised seller and exporter representatives | Quote preparation, order acceptance, commercial documents, export dossier and shipment coordination | Separate seller and exporter mandates; no fallback |
| Operations workspace | Programme operations and support roles | Queue, exception triage, partner readiness, service reconciliation, issue/case routing | Least privilege; no blanket ability to alter domain facts |
| Assurance/oversight workspace | Reviewers and authorised oversight | Evidence review, audit trail, gate status, compliance-source review and metric lineage | Read-only by default; explicit review actions |
| Provider integration console | Restricted technical/operations roles | Connection health, webhook events, reconciliation and provider references | No secret display; no fund custody or legal authority inferred |

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
