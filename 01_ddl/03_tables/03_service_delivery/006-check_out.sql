CREATE TABLE check_out (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  stay_id UUID NOT NULL,
  employee_id UUID NOT NULL,
  checked_out_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  note TEXT NULL,
  total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_check_out_stay UNIQUE (stay_id),
  CONSTRAINT ck_check_out_amount CHECK (total_amount >= 0)
);

CREATE INDEX ix_check_out_employee ON check_out (employee_id);



