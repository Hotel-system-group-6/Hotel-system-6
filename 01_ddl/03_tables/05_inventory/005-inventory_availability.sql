CREATE TABLE inventory_availability (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  product_id UUID NULL,
  service_id UUID NULL,
  available_quantity INT NOT NULL DEFAULT 0,
  available BOOLEAN NOT NULL DEFAULT TRUE,
  note VARCHAR(255) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT ck_availability_inventory_item CHECK (product_id IS NOT NULL OR service_id IS NOT NULL),
  CONSTRAINT ck_availability_inventory_quantity CHECK (available_quantity >= 0)
);

CREATE INDEX ix_availability_inventory_product ON inventory_availability (product_id);
CREATE INDEX ix_availability_inventory_service ON inventory_availability (service_id);




