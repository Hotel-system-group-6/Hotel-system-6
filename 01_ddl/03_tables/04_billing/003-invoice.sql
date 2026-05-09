CREATE TABLE invoice (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL,
  stay_id UUID NOT NULL,
  invoice_number VARCHAR(60) NOT NULL,
  issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
  tax_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  total DECIMAL(12,2) NOT NULL DEFAULT 0,
  invoice_status VARCHAR(40) NOT NULL DEFAULT 'ISSUED',
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_invoice_number UNIQUE (invoice_number),
  CONSTRAINT uk_invoice_stay UNIQUE (stay_id),
  CONSTRAINT ck_invoice_values CHECK (subtotal >= 0 AND tax_amount >= 0 AND discount_amount >= 0 AND total >= 0)
);

CREATE INDEX ix_invoice_customer ON invoice (customer_id);




