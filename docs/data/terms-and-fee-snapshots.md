# Immutable commercial terms and fee snapshots

**Sources:** 024-R F-05/F-09; 024-B/C/D/G; 018-A D-05/D-07; 009 and 003.  
**Status:** Logical design only; no schema or fee engine approval.

## Commercial acceptance snapshot
An accepted quotation/order must preserve the exact version accepted by the parties: buyer, seller and separately authorised exporter where applicable; product/specification; quantity and unit; price/currency; delivery basis; validity; documents/quality conditions; tax/fee disclosures; payment terms; cancellation/refund terms; and acceptance evidence/time/actor.

Later edits to a quotation, service catalogue, tax/fee rule or product rule must not rewrite a historical accepted transaction.

## Fee calculation snapshot
If and only if a sponsor-approved fee model is adopted, preserve service ID/version, payer, beneficiary, charging event, calculation basis, input quantities/amounts, formula version, currency, rounding, tax treatment, deductions, refunds/adjustments, revenue shares, gross and net display, source event and approvals.

## Integrity rules
- Version every accepted terms package and calculation.
- Bind the order to one accepted quotation under the pilot rule.
- Bind each order item to its accepted quotation line and commercial snapshot.
- Distinguish goods price from platform/service fees and provider charges.
- Do not present estimated producer net proceeds as guaranteed settlement.
- Do not create a platform wallet or funds ledger under current D-07.
