CREATE TABLE company (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  name VARCHAR(160) NOT NULL,
  tax_id VARCHAR(40) NOT NULL,
  legal_name VARCHAR(180) NOT NULL,
  phone VARCHAR(40) NULL,
  email VARCHAR(160) NULL,
  address VARCHAR(255) NULL,
  website VARCHAR(180) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_company_tax_id UNIQUE (tax_id)
);



