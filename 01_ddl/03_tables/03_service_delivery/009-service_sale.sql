CREATE TABLE service_sale (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  stay_id UUID NOT NULL,
  service_id UUID NOT NULL,
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
  CONSTRAINT ck_service_sale_values CHECK (quantity > 0 AND unit_amount >= 0 AND total_amount >= 0)
);

CREATE INDEX ix_service_sale_stay ON service_sale (stay_id);
CREATE INDEX ix_service_sale_service ON service_sale (service_id);




