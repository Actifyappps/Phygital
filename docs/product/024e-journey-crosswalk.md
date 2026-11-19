# 024-E screen journey to workflow crosswalk

**Source:** 024-E v0.1. Six product surfaces and six primary journeys.  
**Status:** design traceability only; no wireframes or screens implemented by this map.

| Journey | User outcome | 024-B workflow coverage | Primary domains |
|---|---|---|---|
| J-01 Producer supply declaration to public listing | Producer submits supply claim; eligible evidence is reviewed; a permitted listing is published | WF-02, WF-04, WF-05, WF-06 | organisations, authority, supply, hub-services, measurement, evidence, marketplace |
| J-02 Buyer discovery to quotation acceptance | Buyer discovers public-safe listing, supplies requirements, assesses fit and accepts a specific quote version | WF-07, WF-08 | marketplace, buyer-requirements, compliance-rules, quotations-orders, authority |
| J-03 Hub service event and evidence capture | Operator records only the service activity permitted by facility mandate | WF-04, WF-05 | hub-services, measurement, evidence, authority |
| J-04 Order to reservation and physical movement | Accepted quote creates an order; eligible quantity is reserved; any physical movement is a separate authorised event | WF-09, WF-10, WF-12 | quotations-orders, commercial, inventory, fulfilment, hub-services |
| J-05 Direct payment status and reconciliation | Parties record direct payment reference; provider evidence is verified and reconciled | WF-13 | payment-status, cases, audit |
| J-06 Evidence hold, complaint or recall | Evidence/product is held; a case is investigated; trace-back/trace-forward and appeal paths remain auditable | WF-05, WF-14, WF-15, WF-17 | evidence, product-integrity, marketplace-trust, cases, audit |

## Six 024-E surfaces
1. Public marketplace.
2. Buyer portal.
3. Producer/supplier portal.
4. Hub operations portal.
5. Platform administration and operations.
6. Reviewer and assurance workspace.

Seller and exporter are separately evidenced capacities, not combined identity types or implicit extra portals. Provider integration operations remain restricted system/operations capabilities.

## Shared interaction controls
Status/evidence labels; action hierarchy; form validation; private file handling; quantity/money presentation; irreversible-action confirmation; responsive layout; accessibility; localization; low-bandwidth and assisted/shared-device handling; notification and terminology controls.

Every user action must map to the correct domain command, authority tuple, precondition, event, audit record and acceptance test. A screen must not infer or imply physical custody, legal authority, certification, funds receipt or shipment completion.
