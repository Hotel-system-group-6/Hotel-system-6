CREATE TABLE employee (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  person_id UUID NOT NULL,
  job_title VARCHAR(100) NOT NULL,
  hire_date DATE NOT NULL,
  work_phone VARCHAR(40) NULL,
  work_email VARCHAR(160) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_employee_person UNIQUE (person_id),
  CONSTRAINT uk_employee_work_email UNIQUE (work_email)
);



