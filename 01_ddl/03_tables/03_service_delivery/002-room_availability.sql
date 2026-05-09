CREATE TABLE room_availability (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_id UUID NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  available BOOLEAN NOT NULL DEFAULT TRUE,
  unavailable_reason VARCHAR(255) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT ck_availability_dates CHECK (end_date > start_date)
);

CREATE INDEX ix_room_availability_date ON room_availability (room_id, start_date, end_date);




