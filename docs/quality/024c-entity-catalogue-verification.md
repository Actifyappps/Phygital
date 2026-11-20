# 024-C entity catalogue source verification

**Source:** 024-C — Information Architecture, Domain Data Dictionary & Entity Relationship Specification v0.1.  
**Source date:** 19 November 2026.  
**Source status:** Draft for sponsor, product, technical, operational, legal, data-protection and assurance review; conceptual/logical design only.  
**Repository comparison date:** 20 November 2026.  
**Result:** Entity ID and logical-name comparison passed; this is not full logical-model acceptance.

## 1. Verification performed

The current Notion 024-C page and repository crosswalk `docs/domain/024c-entity-to-context-crosswalk.md` were compared by extracting the entity identifiers and logical entity names from both catalogues.

| Check | Notion source | Repository crosswalk | Result |
|---|---:|---:|---|
| Unique entity identifiers | 65 | 65 | Exact count match |
| Entity identifiers present | ENT-001–ENT-065 | ENT-001–ENT-065 | No missing or extra IDs |
| Logical entity names | 65 | 65 | All 65 names match exactly |
| Information domains | IA-01–IA-10 | IA-01–IA-10 | All ten domains represented |

No identifier was missing from the repository crosswalk; no repository-only identifier was found. No logical entity-name mismatch was found.

## 2. Ten information domains

| Domain | Name | Repository ownership |
|---|---|---|
| IA-01 | Identity, organisations and authority | identity, organisations, authority, privacy, hub-services |
| IA-02 | Product, commodity and rules | catalogue, compliance-rules |
| IA-03 | Supply, batch and physical service evidence | supply, hub-services, measurement, inventory |
| IA-04 | Evidence and documents | evidence, documents |
| IA-05 | Marketplace discovery and demand | marketplace, buyer-requirements |
| IA-06 | Commercial offer and order | quotations-orders, commercial |
| IA-07 | Reservation, movement and fulfilment | inventory, fulfilment |
| IA-08 | External payment and reconciliation | payment-status |
| IA-09 | Trust, exceptions and operations | marketplace-trust, cases, product-integrity, offline-sync |
| IA-10 | Audit, reporting and governance | audit, measurement; programme gates remain in governance |

## 3. Important model distinctions preserved

The source catalogue and repository crosswalk retain the following distinctions:
- user identity, organisation membership, operational role, legal authority mandate and transaction-party capacity are separate concepts;
- seller and exporter authority require separate scoped records;
- hub service mandate is distinct from custody authority, which remains disabled in the baseline;
- evidence item class E1–E4 is distinct from acquisition type, claim linkage and review;
- declared supply, batch, measurement, eligibility, reservation, allocation, physical movement and shipment are separate records/states;
- quotation version, accepted terms snapshot, order, order item and variation preserve commercial lineage;
- provider payment references/events/reconciliation do not create a platform wallet or possession of funds;
- complaint/allegation, case finding, appeal, recall/withdrawal and support exception are distinct;
- offline device identity and sync receipts do not authenticate a human or grant authority;
- software-stage and pilot-maturity gate assessments remain separate.

## 4. Scope of this verification

This comparison verifies the 65 entity IDs and names and confirms the ten-domain mapping is represented. It does **not** independently verify:
- every minimum attribute, datatype, nullability or validation rule;
- all relationship cardinalities, optionality and referential constraints;
- full reconciliation against every 018-C source-to-target relationship;
- physical table design, indexes, row-level security, migrations or SQL;
- sponsor/legal/data-protection review or acceptance checklist sign-off;
- implementation, database execution or test results.

Those matters remain review items under 024-C sections 12–14 and the governing 018-C/Migration 001 and Migration 002 controls.

## 5. Next specification dependencies

024-C identifies 024-D (API/integration contracts), 024-E (screens/navigation), 024-F (security/privacy), 024-G (test strategy/acceptance) and 024-H (delivery/operations/observability) as downstream specifications. The 024-C source describes these as a recommended sequence after logical-design review; existing draft documents do not thereby become approved or complete.

024-C is not a physical schema, one-entity-one-table prescription or migration authorization. Migration 001 remains **HOLD**; Migration 002 remains **NOT AUTHORISED**; EVI-21 remains **OPEN**.
