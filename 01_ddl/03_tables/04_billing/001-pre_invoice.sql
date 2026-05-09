CREATE TABLE pre_invoice (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  stay_id UUID NOT NULL,
  room_reservation_id UUID NOT NULL,
  customer_id UUID NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
  tax_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  total DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_pre_invoice_stay UNIQUE (stay_id),
  CONSTRAINT ck_pre_invoice_values CHECK (subtotal >= 0 AND tax_amount >= 0 AND discount_amount >= 0 AND total >= 0)
);

CREATE INDEX ix_pre_invoice_reservation ON pre_invoice (room_reservation_id);
CREATE INDEX ix_pre_invoice_customer ON pre_invoice (customer_id);




