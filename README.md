# Phygital Export Marketplace
**A County-Led Virtual Infrastructure for Cross-Border B2B Trade**

Status: repository foundation; not an approved production architecture or live trading system. Product authority resides in approved Saintsway Equity specifications. Engineering lifecycle is governed by Actify AADDG and TSBBF.

## Core loop
Verified supply → Buyer enquiry → Quotation → Order → Documents → Shipment/payment tracking.

## Operating boundaries
- Platform coordinates; it is not the default seller, exporter, custodian, payee, payment processor or carrier.
- Seller and exporter capacities require independent evidence and authorisation.
- Hub is service-only; no implied custody, title, stock holding, release or dispatch.
- Allocation is reservation, not physical movement.
- One accepted quotation per order; order items retain accepted quote-line linkage and commercial snapshot.
- Pilot baseline is one batch. Multi-batch allocation requires traceability and over-allocation/double-count prevention.
- Direct buyer-to-seller payment; platform records instructions/status/provider references/evidenced events, not funds.
- No live trade, custody, platform-held funds, escrow, dispatch or shipment is authorised by this scaffold.
- Connected measurement, blockchain anchoring, provider-led escrow and AI forecasting are phase-gated, not MVP assumptions.

## Repository status
This is an organised engineering workspace. A folder, placeholder, plan or test specification is not evidence of implementation, execution, acceptance or deployment. Technology selection remains OPEN pending TSBBF evidence and ADR-0001.

## Authority
| Concern | Authority |
|---|---|
| Product/operating decisions | Approved Saintsway Equity specifications |
| Digital requirements and acceptance | 024 series |
| Source, migrations, tests, reviewed config | GitHub repository |
| Runtime data/access enforcement | Approved managed database |
| Build/deployment | Approved CI/CD and hosting |
| Runtime behaviour | Browser/runtime evidence |

## Start here
Read `docs/governance/project-status.md`, `docs/architecture/architecture-boundaries.md`, `docs/decisions/README.md`, `docs/delivery/development-workflow.md`, and `docs/quality/evidence-and-acceptance.md`.

**Diagnose → Isolate → Fix → Test → Regression-check → Verify source → Deploy only when authorised → Verify runtime.**
