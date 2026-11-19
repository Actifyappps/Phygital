# Service catalogue, fee model and producer proceeds — design control

**Status:** Design gap identified by 024-R F-05; not an approved commercial model, price list, fee schedule, tax opinion or implementation authorization.

## 1. Why this has its own home
The platform's commercial service is distinct from the goods sale, seller/exporter obligations and payment rail. It needs explicit service definitions and a transparent explanation of who pays for what, when, and why. Do not bury this in generic architecture or infer it from a commission field.

## 2. Required service catalogue fields
For each proposed service record:
- Service ID, name, description, scope and exclusions.
- Beneficiary and value delivered.
- Delivering legal entity and accountable owner.
- Eligible customer/organisation and geography.
- Preconditions, service evidence and completion event.
- Pricing unit/basis and calculation version.
- Payer, payment recipient and payment route.
- Tax/levy treatment to be determined by qualified review.
- Refund, cancellation, dispute and failed-service treatment.
- Hub/provider subcontract or revenue share, if any.
- Disclosure point and required customer acknowledgement.
- Effective dates, approval status and superseded version.

## 3. Commercial decisions still required
- Which services are free, sponsored, subscription-based or transaction-charged?
- Who is the payer for each service: producer organisation, seller/exporter, buyer, institution or sponsor?
- What is the charging event: onboarding, verified service completion, listing, accepted order, completed transaction or another evidenced event?
- What is the fee basis: fixed, per unit, per batch, percentage, subscription or negotiated agreement?
- How are taxes, refunds, cancellations, chargebacks, discounts, hub/provider shares and deductions handled?
- What is the producer's gross amount, each deduction, and expected net proceeds? Who is legally responsible for paying the producer?
- What are working-capital needs and cash-flow timing?
- What are the fully loaded costs per batch, enquiry, order and completed service?
- What is the policy for vulnerable/small producers and any subsidised service?

Do not adopt every revenue hypothesis or charge both sides by default. Test one primary revenue hypothesis at a time with real cost and willingness-to-pay evidence.

## 4. Separation from payment and seller commercial terms
- A service fee owed to the platform/service operator is not the price of the goods.
- The goods-sale amount and producer settlement are governed by the seller/exporter contract and the approved funds flow.
- Payment status remains a record of provider-backed or otherwise accepted evidence; the platform does not receive or hold transaction funds under D-07.
- A producer net-proceeds display is an estimate until all charges, tax, quality deductions and settlement terms are contractually established.

## 5. Minimum data and audit model
Candidate records include service catalogue version, service order/engagement, payer/beneficiary, fee quote, fee calculation snapshot, invoice/reference, adjustment/refund, revenue-share allocation and producer-proceeds statement. These are logical concepts only; physical schema awaits approved commercial design and data architecture.

Each calculation must preserve input values, units/currency, formula/version, rounding, effective date, source event, approvals and immutable snapshot. Never silently recalculate a historical order after a fee schedule changes.

## 6. Gates
No production fee engine, invoicing, deduction, producer payout or platform balance until:
1. sponsor-approved commercial structure and payer/recipient are documented;
2. qualified Kenyan and relevant destination-market legal/tax review is complete;
3. contracts and service descriptions are approved;
4. actual operating cost and cash-flow evidence exists;
5. 024-C/D/E/F/G impacts and acceptance tests are reviewed;
6. D-07 payment boundary remains satisfied or a separately authorised change is approved.

## 7. Measures
Track cost to onboard, cost per verified batch/service, service delivery cost, fee incidence, refund/complaint rate, producer gross-to-net reconciliation, payment timing, platform contribution and support burden. Numeric thresholds must come from baseline evidence, not invented targets.
