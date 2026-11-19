# Phygital Export Marketplace — Database Acceptance Checklist

**Applies to:** `phygital_export_marketplace_migration_001.sql`  
**Status:** Test plan; checks must be executed in a disposable PostgreSQL database before adopting the migration.

## Environment

- PostgreSQL version and extensions recorded.
- Migration applied to a clean disposable database without errors.
- All tables, foreign keys, indexes and triggers verified from the database catalog.
- Migration rerun behavior documented. This initial migration is intended to run once on a clean database; it is not yet a full migration framework.
- Backups and rollback strategy reviewed before any non-disposable environment is used.

## Required schema checks

- [ ] `users` supports unique email and constrained account status.
- [ ] `organization_memberships` links users and organizations, with one membership per user/organization and a constrained role/status.
- [ ] `inventory_movements` exists and references a batch, with positive quantity, reason, actor, timestamp and optional idempotency key.
- [ ] `listings` and `quotations` exist and reference seller/buyer organizations and products as appropriate.
- [ ] `order_items` references a product and at least one listing or quotation source.
- [ ] `batch_allocations` references an order item and batch, has positive quantity and explicit lifecycle status.
- [ ] Payment events enforce unique provider event identifiers to support idempotency.
- [ ] Shipment events can distinguish reported from partner-verified events.
- [ ] Audit events support actor, organization, entity, action and timestamp.

## Required integrity tests

Use fixtures in a disposable database. Record the SQL, result and PostgreSQL version in the test log.

1. **Foreign keys:** insert an order item with a nonexistent order; expect failure.
2. **Membership uniqueness:** insert the same user/organization membership twice; expect failure.
3. **Positive quantities:** insert a zero or negative order quantity, batch quantity, movement quantity or allocation; expect failure.
4. **Source linkage:** insert an order item with neither listing nor quotation; expect failure.
5. **Batch allocation limit:** create a batch with accepted quantity 100 units and attempt active allocations totaling 101 units; the allocation that exceeds 100 must fail.
6. **Order-item allocation limit:** create an order item for 40 units and attempt active/dispatched allocations totaling 41 units across one or more batches; the allocation that exceeds 40 must fail.
7. **Released allocation:** release an allocation and confirm that the released quantity no longer counts toward active reservations. Validate that application logic records the corresponding inventory movement.
8. **Dispatched allocation:** confirm dispatched allocations continue to count against batch accepted quantity, preventing the same quantity from being allocated again.
9. **Concurrent allocation:** in two concurrent sessions, attempt allocations whose combined total exceeds a batch's accepted quantity. The result must not exceed accepted quantity. Repeat for order-item quantity. The team must document any deadlock/retry behavior.
10. **Payment event idempotency:** insert a duplicate provider event ID; expect failure and confirm the application treats it as a duplicate rather than processing it twice.
11. **Inventory movement idempotency:** duplicate a non-null idempotency key; expect failure.
12. **Audit trail:** verify critical service operations emit audit events, including allocation creation/release, quality decision, order amendment and payment reconciliation.

## Important limitations to resolve before production

- Allocation triggers protect quantity limits, but do not prove that a batch is legally exportable, quality-approved, unexpired, or available for a particular buyer. Application logic must enforce those business rules.
- The migration does not implement row-level security or organization/hub authorization. Add and test the selected access-control strategy before production.
- Database role permissions must prevent ordinary application users from altering or deleting audit history or disabling triggers.
- Inventory movements are append-oriented by design, but the database currently does not derive the entire inventory balance from movement rows. Define and test the authoritative inventory accounting model before production.
- Changes to `batches.accepted_quantity` must not reduce accepted quantity below active/dispatched allocations. Add a corresponding trigger or enforce a transactionally safe service rule and test concurrent changes before production.
- `order_items` source linkage is a minimum relationship. If an order is created from a quotation, enforce consistency between the order's accepted quotation, item quotation, listing, product, seller, buyer, currency and price in application logic or additional database constraints.
- `payment_events.signature_verified` is a record of verification outcome, not a substitute for verifying signatures in the webhook handler.
- Store files in private object storage; the `storage_key` must not be a public URL or contain secrets.
- Review indexes and data types against actual query patterns and expected volumes.

## Release gate

Do not label the database baseline production-ready until the integrity and concurrency tests pass, access controls are implemented, migration/recovery procedures are documented, and a qualified reviewer has approved the data model for the selected pilot commodity and workflow.
