CREATE TABLE partial_payment (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_reservation_id UUID NULL,
  invoice_id UUID NULL,
  payment_method_id UUID NOT NULL,
  amount DECIMAL(12,2) NOT NULL,
  paid_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_reference VARCHAR(120) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT ck_payment_amount CHECK (amount > 0),
  CONSTRAINT ck_payment_source CHECK (room_reservation_id IS NOT NULL OR invoice_id IS NOT NULL)
);

CREATE INDEX ix_payment_reservation ON partial_payment (room_reservation_id);
CREATE INDEX ix_payment_invoice ON partial_payment (invoice_id);
CREATE INDEX ix_payment_method ON partial_payment (payment_method_id);




