-- Phygital Export Marketplace migration smoke/constraint tests.
-- Run only after migration_001 in a disposable database:
-- psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f phygital_export_marketplace_migration_001_tests.sql
-- All fixtures are rolled back at the end.

BEGIN;
DO $$
DECLARE
  v_user UUID;
  v_org_seller UUID;
  v_org_buyer UUID;
  v_org_hub UUID;
  v_hub UUID;
  v_product UUID;
  v_listing UUID;
  v_batch_a UUID;
  v_batch_b UUID;
  v_order UUID;
  v_item_large UUID;
  v_item_small UUID;
  v_allocation UUID;
  v_failed BOOLEAN;
BEGIN
  INSERT INTO users(email, full_name) VALUES ('migration-test@example.invalid', 'Migration Test') RETURNING id INTO v_user;
  INSERT INTO organizations(name, organization_type) VALUES ('Test Seller', 'seller') RETURNING id INTO v_org_seller;
  INSERT INTO organizations(name, organization_type) VALUES ('Test Buyer', 'buyer') RETURNING id INTO v_org_buyer;
  INSERT INTO organizations(name, organization_type) VALUES ('Test Hub Operator', 'hub_operator') RETURNING id INTO v_org_hub;
  INSERT INTO organization_memberships(user_id, organization_id, role) VALUES (v_user, v_org_seller, 'owner');

  v_failed := FALSE;
  BEGIN
    INSERT INTO organization_memberships(user_id, organization_id, role) VALUES (v_user, v_org_seller, 'owner');
  EXCEPTION WHEN unique_violation THEN v_failed := TRUE;
  END;
  IF NOT v_failed THEN RAISE EXCEPTION 'FAIL: duplicate organization membership was accepted'; END IF;

  INSERT INTO hubs(organization_id, code, name, county, operating_status)
    VALUES (v_org_hub, 'TEST-HUB-001', 'Test Hub', 'Kericho', 'active') RETURNING id INTO v_hub;
  INSERT INTO products(name, category, default_unit) VALUES ('Test Product', 'test', 'kg') RETURNING id INTO v_product;
  INSERT INTO listings(seller_organization_id, product_id, title, indicative_quantity, unit, status)
    VALUES (v_org_seller, v_product, 'Test listing', 300, 'kg', 'published') RETURNING id INTO v_listing;
  INSERT INTO batches(batch_code, producer_organization_id, hub_id, product_id, received_quantity, accepted_quantity, unit, status)
    VALUES ('TEST-BATCH-A', v_org_seller, v_hub, v_product, 100, 100, 'kg', 'accepted') RETURNING id INTO v_batch_a;
  INSERT INTO batches(batch_code, producer_organization_id, hub_id, product_id, received_quantity, accepted_quantity, unit, status)
    VALUES ('TEST-BATCH-B', v_org_seller, v_hub, v_product, 100, 100, 'kg', 'accepted') RETURNING id INTO v_batch_b;
  INSERT INTO orders(order_code, buyer_organization_id, seller_organization_id, currency, status)
    VALUES ('TEST-ORDER-001', v_org_buyer, v_org_seller, 'KES', 'confirmed') RETURNING id INTO v_order;
  INSERT INTO order_items(order_id, product_id, listing_id, quantity, unit, unit_price)
    VALUES (v_order, v_product, v_listing, 200, 'kg', 10) RETURNING id INTO v_item_large;
  INSERT INTO order_items(order_id, product_id, listing_id, quantity, unit, unit_price)
    VALUES (v_order, v_product, v_listing, 40, 'kg', 10) RETURNING id INTO v_item_small;

  -- Batch capacity: 70 + 31 must fail against accepted quantity 100.
  INSERT INTO batch_allocations(order_item_id, batch_id, quantity, status)
    VALUES (v_item_large, v_batch_a, 70, 'active');
  v_failed := FALSE;
  BEGIN
    INSERT INTO batch_allocations(order_item_id, batch_id, quantity, status)
      VALUES (v_item_large, v_batch_a, 31, 'active');
  EXCEPTION WHEN check_violation THEN v_failed := TRUE;
  END;
  IF NOT v_failed THEN RAISE EXCEPTION 'FAIL: batch over-allocation was accepted'; END IF;

  -- Order item capacity: 30 + 11 must fail against item quantity 40.
  INSERT INTO batch_allocations(order_item_id, batch_id, quantity, status)
    VALUES (v_item_small, v_batch_b, 30, 'active') RETURNING id INTO v_allocation;
  v_failed := FALSE;
  BEGIN
    INSERT INTO batch_allocations(order_item_id, batch_id, quantity, status)
      VALUES (v_item_small, v_batch_b, 11, 'active');
  EXCEPTION WHEN check_violation THEN v_failed := TRUE;
  END;
  IF NOT v_failed THEN RAISE EXCEPTION 'FAIL: order-item over-allocation was accepted'; END IF;

  -- Accepted quantity cannot be reduced below active allocations.
  v_failed := FALSE;
  BEGIN
    UPDATE batches SET accepted_quantity = 69 WHERE id = v_batch_a;
  EXCEPTION WHEN check_violation THEN v_failed := TRUE;
  END;
  IF NOT v_failed THEN RAISE EXCEPTION 'FAIL: accepted quantity reduction below allocations was accepted'; END IF;

  -- Released allocation must stop reserving stock and include released_at.
  UPDATE batch_allocations SET status = 'released', released_at = now() WHERE id = v_allocation;
  INSERT INTO batch_allocations(order_item_id, batch_id, quantity, status)
    VALUES (v_item_small, v_batch_b, 10, 'active');

  -- A duplicate provider event ID must be rejected.
  INSERT INTO payment_records(order_id, provider_name, provider_transaction_reference, amount, currency)
    VALUES (v_order, 'test-provider', 'TEST-PAYMENT-001', 10, 'KES') RETURNING id INTO v_allocation;
  INSERT INTO payment_events(payment_record_id, provider_event_id, event_type)
    VALUES (v_allocation, 'TEST-EVENT-001', 'payment.pending');
  v_failed := FALSE;
  BEGIN
    INSERT INTO payment_events(payment_record_id, provider_event_id, event_type)
      VALUES (v_allocation, 'TEST-EVENT-001', 'payment.pending');
  EXCEPTION WHEN unique_violation THEN v_failed := TRUE;
  END;
  IF NOT v_failed THEN RAISE EXCEPTION 'FAIL: duplicate provider event was accepted'; END IF;

  RAISE NOTICE 'PASS: migration smoke/constraint tests completed';
END $$;
ROLLBACK;