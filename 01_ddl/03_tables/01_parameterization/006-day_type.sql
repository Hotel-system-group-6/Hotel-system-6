CREATE TABLE day_type (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  name VARCHAR(80) NOT NULL,
  description VARCHAR(255) NULL,
  date DATE NULL,
  applies_season BOOLEAN NOT NULL DEFAULT FALSE,
  applies_holiday BOOLEAN NOT NULL DEFAULT FALSE,
  applies_special_day BOOLEAN NOT NULL DEFAULT FALSE,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_day_type_name_date UNIQUE (name, date)
);



