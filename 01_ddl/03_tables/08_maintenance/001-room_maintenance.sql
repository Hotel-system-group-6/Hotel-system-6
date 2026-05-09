CREATE TABLE room_maintenance (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_id UUID NOT NULL,
  employee_id UUID NULL,
  maintenance_type VARCHAR(60) NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NULL,
  maintenance_status VARCHAR(40) NOT NULL DEFAULT 'PENDING',
  note TEXT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id)
);

CREATE INDEX ix_room_maintenance ON room_maintenance (room_id, start_date, end_date);
CREATE INDEX ix_maintenance_employee ON room_maintenance (employee_id);




