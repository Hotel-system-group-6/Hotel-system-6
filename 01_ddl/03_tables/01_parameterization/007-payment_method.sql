CREATE TABLE payment_method (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  name VARCHAR(80) NOT NULL,
  description VARCHAR(255) NULL,
  requires_reference BOOLEAN NOT NULL DEFAULT FALSE,
  allows_partial_payment BOOLEAN NOT NULL DEFAULT TRUE,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_payment_method_name UNIQUE (name)
);



