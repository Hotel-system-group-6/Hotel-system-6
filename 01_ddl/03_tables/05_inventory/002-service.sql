CREATE TABLE service (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  name VARCHAR(160) NOT NULL,
  description VARCHAR(255) NULL,
  sale_price DECIMAL(12,2) NOT NULL DEFAULT 0,
  available BOOLEAN NOT NULL DEFAULT TRUE,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_service_name UNIQUE (name),
  CONSTRAINT ck_service_amount CHECK (sale_price >= 0)
);



