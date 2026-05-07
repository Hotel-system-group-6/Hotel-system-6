CREATE TABLE person (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  document_type VARCHAR(30) NOT NULL,
  document_number VARCHAR(40) NOT NULL,
  name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(40) NULL,
  email VARCHAR(160) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_person_document UNIQUE (document_type, document_number),
  CONSTRAINT uk_person_email UNIQUE (email)
);




