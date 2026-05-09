CREATE TABLE price (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_type_id UUID NOT NULL,
  day_type_id UUID NOT NULL,
  amount DECIMAL(12,2) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NULL,
  condition VARCHAR(255) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_price_day_type_inicio UNIQUE (room_type_id, day_type_id, start_date),
  CONSTRAINT ck_price_amount CHECK (amount >= 0)
);

CREATE INDEX ix_price_room_type ON price (room_type_id);
CREATE INDEX ix_price_day_type ON price (day_type_id);



