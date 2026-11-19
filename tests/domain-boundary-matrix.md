# Domain boundary and invariant test matrix

This matrix is a test design index, not evidence that tests have run.

| Invariant | Required test |
|---|---|
| Identity is not authority | Authenticated user without mandate is denied |
| Seller and exporter are distinct | Seller-only actor cannot perform exporter-only action |
| Membership is scoped | Cross-organisation access is denied |
| Supply is not stock | Declaration cannot increase verified inventory |
| Evidence class ≠ provenance | E-class remains independent from acquisition method |
| Allocation is not movement | Reservation does not create dispatch or custody event |
| No over-allocation | Concurrent reservations cannot exceed available balance |
| Quote snapshot is immutable | Later fee/catalogue changes do not mutate accepted order |
| One accepted quote per order | Duplicate/competing acceptance rejected |
| Direct payment boundary | Platform cannot receive or hold buyer sale funds |
| Facility scope | Digital-only facility cannot record custody/inspection as authorised |
| Compliance unknown is safe | Missing/expired/conflicting rule blocks or routes to human review |
| Public projection is minimised | Private docs, PII and buyer-confidential data never leak |
| Recall is traceable | Affected batch/order/customer graph can be reconstructed |
| Offline replay is safe | Duplicate/out-of-order sync does not double apply actions |
| Trust appeals are attributable | Moderation and appeal decisions retain actor/reason/history |
