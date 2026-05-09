CREATE TABLE promotion (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  title VARCHAR(160) NOT NULL,
  description TEXT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NULL,
  channel VARCHAR(60) NOT NULL,
  activa BOOLEAN NOT NULL DEFAULT TRUE,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id)
);

CREATE INDEX ix_promotion_date ON promotion (start_date, end_date);



