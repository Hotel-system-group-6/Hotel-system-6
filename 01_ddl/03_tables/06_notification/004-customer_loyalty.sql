CREATE TABLE customer_loyalty (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL,
  level VARCHAR(60) NOT NULL DEFAULT 'BASIC',
  points INTEGER NOT NULL DEFAULT 0,
  last_interaction_at TIMESTAMP NULL,
  note TEXT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_customer_loyalty UNIQUE (customer_id)
);



