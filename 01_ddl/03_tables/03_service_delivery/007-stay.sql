CREATE TABLE stay (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_reservation_id UUID NOT NULL,
  customer_id UUID NOT NULL,
  room_id UUID NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NULL,
  stay_status VARCHAR(40) NOT NULL DEFAULT 'ACTIVE',
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_stay_reservation UNIQUE (room_reservation_id)
);

CREATE INDEX ix_stay_customer ON stay (customer_id);
CREATE INDEX ix_stay_room ON stay (room_id);




