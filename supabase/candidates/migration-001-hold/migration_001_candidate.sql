-- Phygital Export Marketplace: initial migration candidate
-- PostgreSQL 15+ recommended. Review and test in a disposable database first.
-- This migration establishes a relational baseline; it does not implement auth,
-- row-level security, provider integrations, or full commodity-specific compliance.

BEGIN;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  phone_e164 TEXT,
  account_status TEXT NOT NULL DEFAULT 'pending' CHECK (account_status IN ('pending','active','suspended','closed')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE organizations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  organization_type TEXT NOT NULL CHECK (organization_type IN ('producer','cooperative','seller','buyer','exporter','service_provider','hub_operator','institution','platform_admin')),
  country_code CHAR(2) NOT NULL DEFAULT 'KE',
  county TEXT,
  verification_status TEXT NOT NULL DEFAULT 'pending' CHECK (verification_status IN ('pending','in_review','verified','rejected','suspended')),
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','inactive','suspended')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE organization_memberships (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  role TEXT NOT NULL CHECK (role IN ('owner','organization_admin','producer_operator','hub_operator','quality_reviewer','buyer','export_coordinator','finance_reviewer','read_only')),
  membership_status TEXT NOT NULL DEFAULT 'active' CHECK (membership_status IN ('invited','active','suspended','revoked')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, organization_id)
);

CREATE TABLE hubs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  code TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  county TEXT NOT NULL,
  site_type TEXT NOT NULL DEFAULT 'other' CHECK (site_type IN ('icta_hub','tti','cooperative_site','private_site','other')),
  operating_status TEXT NOT NULL DEFAULT 'proposed' CHECK (operating_status IN ('proposed','pending_agreement','active','paused','closed')),
  agreement_reference TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  default_unit TEXT NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE listings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  seller_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  title TEXT NOT NULL,
  description TEXT,
  indicative_quantity NUMERIC(14,3) NOT NULL CHECK (indicative_quantity >= 0),
  unit TEXT NOT NULL,
  currency CHAR(3),
  indicative_unit_price NUMERIC(14,2) CHECK (indicative_unit_price IS NULL OR indicative_unit_price >= 0),
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','pending_review','published','paused','closed','rejected')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE batches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_code TEXT NOT NULL UNIQUE,
  producer_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  hub_id UUID NOT NULL REFERENCES hubs(id) ON DELETE RESTRICT,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  received_quantity NUMERIC(14,3) NOT NULL CHECK (received_quantity > 0),
  accepted_quantity NUMERIC(14,3) NOT NULL DEFAULT 0 CHECK (accepted_quantity >= 0 AND accepted_quantity <= received_quantity),
  unit TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'recorded' CHECK (status IN ('recorded','under_review','accepted','rejected','reserved','partially_dispatched','dispatched','closed')),
  evidence_status TEXT NOT NULL DEFAULT 'declared' CHECK (evidence_status IN ('declared','hub_recorded','device_measured','independently_verified')),
  data_origin TEXT NOT NULL DEFAULT 'manual' CHECK (data_origin IN ('manual','device','imported','simulated')),
  recorded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE documents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  organization_id UUID REFERENCES organizations(id) ON DELETE RESTRICT,
  batch_id UUID REFERENCES batches(id) ON DELETE RESTRICT,
  listing_id UUID REFERENCES listings(id) ON DELETE RESTRICT,
  document_type TEXT NOT NULL,
  storage_key TEXT NOT NULL UNIQUE,
  original_filename TEXT,
  content_type TEXT,
  checksum_sha256 TEXT,
  visibility TEXT NOT NULL DEFAULT 'restricted' CHECK (visibility IN ('restricted','organization','buyer_shared','public_redacted')),
  review_status TEXT NOT NULL DEFAULT 'pending' CHECK (review_status IN ('pending','accepted','rejected','expired')),
  expires_at TIMESTAMPTZ,
  uploaded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CHECK (organization_id IS NOT NULL OR batch_id IS NOT NULL OR listing_id IS NOT NULL)
);

CREATE TABLE batch_measurements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_id UUID NOT NULL REFERENCES batches(id) ON DELETE RESTRICT,
  measurement_type TEXT NOT NULL,
  value NUMERIC(14,4) NOT NULL,
  unit TEXT NOT NULL,
  capture_method TEXT NOT NULL CHECK (capture_method IN ('declared','hub_recorded','device_measured','laboratory','other')),
  device_reference TEXT,
  recorded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  measured_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  evidence_document_id UUID REFERENCES documents(id) ON DELETE SET NULL
);

CREATE TABLE quality_inspections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_id UUID NOT NULL REFERENCES batches(id) ON DELETE RESTRICT,
  inspector_organization_id UUID REFERENCES organizations(id) ON DELETE RESTRICT,
  inspection_type TEXT NOT NULL,
  standard_reference TEXT,
  decision TEXT NOT NULL CHECK (decision IN ('pending','accepted','rejected','conditional')),
  findings TEXT,
  evidence_document_id UUID REFERENCES documents(id) ON DELETE SET NULL,
  reviewed_by UUID REFERENCES users(id) ON DELETE SET NULL,
  inspected_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE buyer_enquiries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  buyer_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  listing_id UUID NOT NULL REFERENCES listings(id) ON DELETE RESTRICT,
  requested_quantity NUMERIC(14,3) NOT NULL CHECK (requested_quantity > 0),
  unit TEXT NOT NULL,
  destination_country CHAR(2),
  target_delivery_date DATE,
  message TEXT,
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open','responded','quoted','converted','closed','withdrawn')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE quotations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  quote_code TEXT NOT NULL UNIQUE,
  enquiry_id UUID REFERENCES buyer_enquiries(id) ON DELETE RESTRICT,
  listing_id UUID NOT NULL REFERENCES listings(id) ON DELETE RESTRICT,
  buyer_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  seller_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  version_number INTEGER NOT NULL DEFAULT 1 CHECK (version_number > 0),
  quantity NUMERIC(14,3) NOT NULL CHECK (quantity > 0),
  unit TEXT NOT NULL,
  unit_price NUMERIC(14,2) NOT NULL CHECK (unit_price >= 0),
  currency CHAR(3) NOT NULL,
  payment_terms TEXT,
  delivery_terms TEXT,
  valid_until TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','sent','accepted','rejected','expired','superseded','withdrawn')),
  created_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (listing_id, buyer_organization_id, version_number)
);

CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_code TEXT NOT NULL UNIQUE,
  accepted_quotation_id UUID REFERENCES quotations(id) ON DELETE RESTRICT,
  buyer_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  seller_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  currency CHAR(3) NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','awaiting_confirmation','confirmed','partially_fulfilled','fulfilled','cancelled','disputed','closed')),
  payment_status TEXT NOT NULL DEFAULT 'not_due' CHECK (payment_status IN ('not_due','due','pending','partially_paid','paid','failed','refunded','under_review')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE RESTRICT,
  product_id UUID NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  listing_id UUID REFERENCES listings(id) ON DELETE RESTRICT,
  quotation_id UUID REFERENCES quotations(id) ON DELETE RESTRICT,
  quantity NUMERIC(14,3) NOT NULL CHECK (quantity > 0),
  unit TEXT NOT NULL,
  unit_price NUMERIC(14,2) NOT NULL CHECK (unit_price >= 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CHECK (listing_id IS NOT NULL OR quotation_id IS NOT NULL)
);

CREATE TABLE batch_allocations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_item_id UUID NOT NULL REFERENCES order_items(id) ON DELETE RESTRICT,
  batch_id UUID NOT NULL REFERENCES batches(id) ON DELETE RESTRICT,
  quantity NUMERIC(14,3) NOT NULL CHECK (quantity > 0),
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','released','dispatched','cancelled')),
  allocated_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  released_at TIMESTAMPTZ,
  CHECK ((status IN ('released','cancelled') AND released_at IS NOT NULL) OR status IN ('active','dispatched'))
);

CREATE TABLE inventory_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_id UUID NOT NULL REFERENCES batches(id) ON DELETE RESTRICT,
  movement_type TEXT NOT NULL CHECK (movement_type IN ('receipt','acceptance','rejection','adjustment_increase','adjustment_decrease','allocation','allocation_release','dispatch','return','transfer_out','transfer_in','write_off')),
  quantity NUMERIC(14,3) NOT NULL CHECK (quantity > 0),
  unit TEXT NOT NULL,
  source_location TEXT,
  destination_location TEXT,
  reference_type TEXT,
  reference_id UUID,
  reason TEXT NOT NULL,
  recorded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  idempotency_key TEXT UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE shipments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE RESTRICT,
  shipment_code TEXT NOT NULL UNIQUE,
  carrier_organization_id UUID REFERENCES organizations(id) ON DELETE RESTRICT,
  origin_country CHAR(2) NOT NULL DEFAULT 'KE',
  destination_country CHAR(2) NOT NULL,
  tracking_reference TEXT,
  status TEXT NOT NULL DEFAULT 'planned' CHECK (status IN ('planned','booked','documents_pending','in_transit','customs_review','delivered','exception','cancelled')),
  planned_dispatch_date DATE,
  dispatched_at TIMESTAMPTZ,
  delivered_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE shipment_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  shipment_id UUID NOT NULL REFERENCES shipments(id) ON DELETE RESTRICT,
  event_type TEXT NOT NULL,
  event_status TEXT NOT NULL DEFAULT 'reported' CHECK (event_status IN ('reported','partner_verified','disputed','superseded')),
  event_at TIMESTAMPTZ NOT NULL,
  source_name TEXT,
  external_reference TEXT,
  evidence_document_id UUID REFERENCES documents(id) ON DELETE SET NULL,
  notes TEXT,
  recorded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE payment_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE RESTRICT,
  payer_organization_id UUID REFERENCES organizations(id) ON DELETE RESTRICT,
  payee_organization_id UUID REFERENCES organizations(id) ON DELETE RESTRICT,
  provider_name TEXT NOT NULL,
  provider_transaction_reference TEXT,
  amount NUMERIC(14,2) NOT NULL CHECK (amount > 0),
  currency CHAR(3) NOT NULL,
  status TEXT NOT NULL DEFAULT 'initiated' CHECK (status IN ('initiated','pending','confirmed','partially_refunded','refunded','failed','reversed','under_review')),
  initiated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  settled_at TIMESTAMPTZ,
  reconciled_at TIMESTAMPTZ,
  UNIQUE (provider_name, provider_transaction_reference)
);

CREATE TABLE payment_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_record_id UUID NOT NULL REFERENCES payment_records(id) ON DELETE RESTRICT,
  provider_event_id TEXT NOT NULL,
  event_type TEXT NOT NULL,
  signature_verified BOOLEAN NOT NULL DEFAULT FALSE,
  payload_digest TEXT,
  processing_status TEXT NOT NULL DEFAULT 'received' CHECK (processing_status IN ('received','processed','ignored_duplicate','failed_review')),
  received_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  processed_at TIMESTAMPTZ,
  UNIQUE (provider_event_id)
);

CREATE TABLE disputes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID NOT NULL REFERENCES orders(id) ON DELETE RESTRICT,
  raised_by_organization_id UUID NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
  category TEXT NOT NULL,
  description TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open','under_review','awaiting_evidence','resolved','rejected','closed')),
  resolution TEXT,
  opened_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  resolved_at TIMESTAMPTZ
);

CREATE TABLE audit_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  actor_user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  organization_id UUID REFERENCES organizations(id) ON DELETE RESTRICT,
  action TEXT NOT NULL,
  entity_type TEXT NOT NULL,
  entity_id TEXT NOT NULL,
  reason TEXT,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_memberships_user_status ON organization_memberships(user_id, membership_status);
CREATE INDEX idx_memberships_org_role ON organization_memberships(organization_id, role, membership_status);
CREATE INDEX idx_hubs_county_status ON hubs(county, operating_status);
CREATE INDEX idx_listings_seller_status ON listings(seller_organization_id, status);
CREATE INDEX idx_batches_hub_status ON batches(hub_id, status);
CREATE INDEX idx_batches_product_created ON batches(product_id, created_at DESC);
CREATE INDEX idx_measurements_batch_time ON batch_measurements(batch_id, measured_at DESC);
CREATE INDEX idx_enquiries_buyer_created ON buyer_enquiries(buyer_organization_id, created_at DESC);
CREATE INDEX idx_quotes_buyer_status ON quotations(buyer_organization_id, status, created_at DESC);
CREATE INDEX idx_orders_buyer_created ON orders(buyer_organization_id, created_at DESC);
CREATE INDEX idx_orders_seller_created ON orders(seller_organization_id, created_at DESC);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_allocations_batch_status ON batch_allocations(batch_id, status);
CREATE INDEX idx_allocations_item_status ON batch_allocations(order_item_id, status);
CREATE INDEX idx_inventory_movements_batch_time ON inventory_movements(batch_id, created_at DESC);
CREATE INDEX idx_shipments_order_status ON shipments(order_id, status);
CREATE INDEX idx_payments_order_status ON payment_records(order_id, status);
CREATE INDEX idx_audit_entity_time ON audit_events(entity_type, entity_id, created_at DESC);

-- Allocation guard. Serializes allocations for the same batch by locking its row,
-- then ensures active + dispatched reservations do not exceed accepted quantity.
CREATE OR REPLACE FUNCTION enforce_batch_allocation_limit()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
  v_accepted NUMERIC(14,3);
  v_reserved NUMERIC(14,3);
  v_new_active NUMERIC(14,3);
BEGIN
  IF TG_OP = 'UPDATE' AND NEW.batch_id <> OLD.batch_id THEN
    RAISE EXCEPTION 'Changing batch_id on an allocation is not supported; release and recreate the allocation';
  END IF;

  SELECT accepted_quantity INTO v_accepted
  FROM batches WHERE id = NEW.batch_id FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Batch % does not exist', NEW.batch_id; END IF;

  SELECT COALESCE(SUM(quantity), 0) INTO v_reserved
  FROM batch_allocations
  WHERE batch_id = NEW.batch_id
    AND status IN ('active','dispatched')
    AND (TG_OP = 'INSERT' OR id <> NEW.id);

  v_new_active := CASE WHEN NEW.status IN ('active','dispatched') THEN NEW.quantity ELSE 0 END;
  IF v_reserved + v_new_active > v_accepted THEN
    RAISE EXCEPTION 'Allocation exceeds accepted batch quantity: reserved %, requested %, accepted %', v_reserved, v_new_active, v_accepted
      USING ERRCODE = '23514';
  END IF;
  RETURN NEW;
END;
$$;
CREATE TRIGGER trg_batch_allocation_limit
BEFORE INSERT OR UPDATE OF batch_id, quantity, status ON batch_allocations
FOR EACH ROW EXECUTE FUNCTION enforce_batch_allocation_limit();

-- Keep order-item allocations within the item quantity as a second guard.
CREATE OR REPLACE FUNCTION enforce_order_item_allocation_limit()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
  v_order_qty NUMERIC(14,3);
  v_reserved NUMERIC(14,3);
  v_new_active NUMERIC(14,3);
BEGIN
  SELECT quantity INTO v_order_qty FROM order_items WHERE id = NEW.order_item_id FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Order item % does not exist', NEW.order_item_id; END IF;
  SELECT COALESCE(SUM(quantity), 0) INTO v_reserved
  FROM batch_allocations
  WHERE order_item_id = NEW.order_item_id
    AND status IN ('active','dispatched')
    AND (TG_OP = 'INSERT' OR id <> NEW.id);
  v_new_active := CASE WHEN NEW.status IN ('active','dispatched') THEN NEW.quantity ELSE 0 END;
  IF v_reserved + v_new_active > v_order_qty THEN
    RAISE EXCEPTION 'Allocation exceeds order-item quantity: reserved %, requested %, order item quantity %', v_reserved, v_new_active, v_order_qty
      USING ERRCODE = '23514';
  END IF;
  RETURN NEW;
END;
$$;
CREATE TRIGGER trg_order_item_allocation_limit
BEFORE INSERT OR UPDATE OF order_item_id, quantity, status ON batch_allocations
FOR EACH ROW EXECUTE FUNCTION enforce_order_item_allocation_limit();

-- Prevent accepted inventory from being reduced below active/dispatched allocations.
CREATE OR REPLACE FUNCTION prevent_accepted_quantity_below_allocations()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
DECLARE
  v_allocated NUMERIC(14,3);
BEGIN
  IF NEW.accepted_quantity < OLD.accepted_quantity THEN
    SELECT COALESCE(SUM(quantity), 0) INTO v_allocated
    FROM batch_allocations
    WHERE batch_id = OLD.id AND status IN ('active','dispatched');
    IF NEW.accepted_quantity < v_allocated THEN
      RAISE EXCEPTION 'Accepted quantity cannot be reduced below active/dispatched allocations: allocated %, requested accepted quantity %', v_allocated, NEW.accepted_quantity
        USING ERRCODE = '23514';
    END IF;
  END IF;
  RETURN NEW;
END;
$$;
CREATE TRIGGER trg_prevent_accepted_quantity_below_allocations
BEFORE UPDATE OF accepted_quantity ON batches
FOR EACH ROW EXECUTE FUNCTION prevent_accepted_quantity_below_allocations();

COMMIT;