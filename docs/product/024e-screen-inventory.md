# 024-E screen inventory and repository ownership

**Source:** 024-E v0.1, section 5.  
**Status:** screen requirements only. No screens are claimed implemented.

| Screen ID | Screen name | Surface | Primary repository feature/domain owners |
|---|---|---|---|
| PUB-01 | Marketplace landing and search | PUB | public-marketplace / marketplace / public-projections |
| PUB-02 | Listing detail | PUB | public-marketplace / marketplace / public-projections |
| PUB-03 | Enquiry initiation | PUB | public-marketplace / marketplace / public-projections |
| PUB-04 | Public process/trust information | PUB | public-marketplace / marketplace / public-projections |
| BUY-01 | Buyer overview | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-02 | Buyer organization and representative profile | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-03 | Buyer requirements | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-04 | Enquiry workspace | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-05 | Quotation review | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-06 | Order detail | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-07 | Payment status | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| BUY-08 | Fulfilment and shipment timeline | BUY | buyer / buyer-requirements / quotations-orders / payment-status / fulfilment |
| SUP-01 | Supplier overview | SUP | producer / supply / evidence / marketplace / quotations-orders |
| SUP-02 | Organization and member access | SUP | producer / supply / evidence / marketplace / quotations-orders |
| SUP-03 | Supply declaration | SUP | producer / supply / evidence / marketplace / quotations-orders |
| SUP-04 | Batch and evidence detail | SUP | producer / supply / evidence / marketplace / quotations-orders |
| SUP-05 | Listing editor | SUP | producer / supply / evidence / marketplace / quotations-orders |
| SUP-06 | Buyer enquiry and quotation response | SUP | producer / supply / evidence / marketplace / quotations-orders |
| SUP-07 | Order and service record | SUP | producer / supply / evidence / marketplace / quotations-orders |
| HUB-01 | Hub task queue | HUB | hub-operations / hub-services / measurement / evidence |
| HUB-02 | Record service event | HUB | hub-operations / hub-services / measurement / evidence |
| HUB-03 | Intake/service record | HUB | hub-operations / hub-services / measurement / evidence |
| HUB-04 | Measurement/evidence capture | HUB | hub-operations / hub-services / measurement / evidence |
| HUB-05 | Exception reporting | HUB | hub-operations / hub-services / measurement / evidence |
| ADM-01 | Operations dashboard | ADM | administration / identity / authority / cases / compliance-rules / audit |
| ADM-02 | Organization onboarding | ADM | administration / identity / authority / cases / compliance-rules / audit |
| ADM-03 | Authority and qualification review | ADM | administration / identity / authority / cases / compliance-rules / audit |
| ADM-04 | Listing/content moderation | ADM | administration / identity / authority / cases / compliance-rules / audit |
| ADM-05 | Support and incident console | ADM | administration / identity / authority / cases / compliance-rules / audit |
| ADM-06 | Rule and configuration governance | ADM | administration / identity / authority / cases / compliance-rules / audit |
| ADM-07 | Audit, reporting and readiness | ADM | administration / identity / authority / cases / compliance-rules / audit |
| REV-01 | Assigned review queue | REV | reviewer / evidence / product-integrity / marketplace-trust / cases / audit / measurement |
| REV-02 | Evidence review | REV | reviewer / evidence / product-integrity / marketplace-trust / cases / audit / measurement |
| REV-03 | Traceability view | REV | reviewer / evidence / product-integrity / marketplace-trust / cases / audit / measurement |
| REV-04 | Complaint, appeal and recall review | REV | reviewer / evidence / product-integrity / marketplace-trust / cases / audit / measurement |
| REV-05 | Readiness and test evidence | REV | reviewer / evidence / product-integrity / marketplace-trust / cases / audit / measurement |

**Coverage:** 36 named screens across six surfaces. 024-E also defines six journeys (J-01–J-06), reusable interaction patterns, 14+ screen states, accessibility/localization/low-bandwidth requirements, notification semantics, component inventory and 18 screen-level acceptance criteria. See `024e-journey-crosswalk.md`, `screen-state-catalogue.md`, `design-system-and-component-catalogue.md` and `../quality/024e-screen-acceptance-crosswalk.md`.

## Surface and permission discipline
- Surface grouping is navigation context, not authorization. Every operation revalidates identity, active organisation, role, capacity, mandate, resource scope, evidence, separation of duties and phase.
- Seller and exporter capacities are separate even where their tasks appear in the same portal.
- Reviewer access is read-only by default and must preserve independence.
- Public pages use allow-listed projections only.
