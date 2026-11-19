# Domain boundaries and dependency rules

## Bounded contexts
- Identity & access: accounts, sessions, service identities and authentication events.
- Organisation & authority: organisations, memberships, legal mandates, qualifications and transaction capacities.
- Evidence & verification: claims, evidence items, provenance, E1–E4 strength, reviews, expiry and supersession.
- Product catalogue: commodity/product definitions, grades, units and specifications.
- Supply & sourcing: producer/source profiles, supply declarations, production windows and commitments.
- Hub services: facility/service capability, appointments, intake and service records; no implied custody.
- Inventory & batch lineage: batch identity, quantity states, allocations/reservations and physical movements.
- Buyer requirements: buyer identity/authority, demand specifications and enquiries.
- Commercial: quotations, accepted quote lines, orders, commercial snapshots and amendments.
- Documents & compliance: document requirements, issuers, versions, validity and transaction associations.
- Fulfilment: independently evidenced packing, handover, carrier and shipment milestones.
- Payment-status & reconciliation: instructions, provider references, reported/verified status and exceptions; no platform funds.
- Audit & oversight: immutable material event history, case management and reporting.

## Dependency rules
Domain modules may depend on shared primitives and declared contracts, not on UI or vendor SDKs. Integration adapters translate external provider semantics into internal contracts. The UI calls application use cases, never direct privileged database operations. Audit and evidence capture are cross-cutting requirements but should not become an excuse for unrestricted global access.

A context boundary does not imply a separate deployable service. Start with explicit modules in a modular monolith if the approved architecture supports it.
