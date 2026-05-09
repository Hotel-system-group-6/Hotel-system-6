CREATE TABLE room_cancellation (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_reservation_id UUID NOT NULL,
  reason VARCHAR(255) NOT NULL,
  cancelled_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  applies_penalty BOOLEAN NOT NULL DEFAULT FALSE,
  penalty_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_cancellation_reservation UNIQUE (room_reservation_id),
  CONSTRAINT ck_cancellation_penalty CHECK (penalty_amount >= 0)
);



