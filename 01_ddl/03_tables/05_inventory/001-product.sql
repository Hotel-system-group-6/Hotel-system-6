CREATE TABLE product (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  supplier_id UUID NULL,
  name VARCHAR(160) NOT NULL,
  description VARCHAR(255) NULL,
  sale_price DECIMAL(12,2) NOT NULL DEFAULT 0,
  current_stock INT NOT NULL DEFAULT 0,
  minimum_stock INT NOT NULL DEFAULT 0,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_product_name UNIQUE (name),
  CONSTRAINT ck_product_values CHECK (sale_price >= 0 AND current_stock >= 0 AND minimum_stock >= 0)
);

CREATE INDEX ix_product_supplier ON product (supplier_id);




