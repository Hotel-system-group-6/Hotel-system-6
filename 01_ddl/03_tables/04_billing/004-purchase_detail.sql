CREATE TABLE purchase_detail (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  invoice_id UUID NOT NULL,
  product_id UUID NULL,
  service_id UUID NULL,
  description VARCHAR(255) NOT NULL,
  quantity INTEGER NOT NULL,
  unit_amount DECIMAL(12,2) NOT NULL,
  total_amount DECIMAL(12,2) NOT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT ck_detail_values CHECK (quantity > 0 AND unit_amount >= 0 AND total_amount >= 0),
  CONSTRAINT ck_detail_item CHECK (product_id IS NOT NULL OR service_id IS NOT NULL)
);

CREATE INDEX ix_detail_invoice ON purchase_detail (invoice_id);
CREATE INDEX ix_detail_product ON purchase_detail (product_id);
CREATE INDEX ix_detail_service ON purchase_detail (service_id);




