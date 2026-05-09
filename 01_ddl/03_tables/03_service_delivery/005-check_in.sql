CREATE TABLE check_in (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_reservation_id UUID NOT NULL,
  employee_id UUID NOT NULL,
  checked_in_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  note TEXT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_check_in_reservation UNIQUE (room_reservation_id)
);

CREATE INDEX ix_check_in_employee ON check_in (employee_id);




