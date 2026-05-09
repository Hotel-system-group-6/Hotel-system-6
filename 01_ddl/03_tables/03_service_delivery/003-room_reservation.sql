CREATE TABLE room_reservation (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  customer_id UUID NOT NULL,
  room_id UUID NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  guest_count SMALLINT NOT NULL,
  reservation_status VARCHAR(40) NOT NULL DEFAULT 'PENDING',
  estimated_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT ck_reservation_dates CHECK (end_date > start_date)
);

CREATE INDEX ix_reservation_customer ON room_reservation (customer_id);
CREATE INDEX ix_room_reservation_date ON room_reservation (room_id, start_date, end_date);




