CREATE TABLE legal_information (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  company_id UUID NOT NULL,
  legal_document_type VARCHAR(80) NOT NULL,
  legal_document_number VARCHAR(80) NOT NULL,
  description TEXT NULL,
  issue_date DATE NULL,
  expiration_date DATE NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id)
);

CREATE INDEX ix_legal_information_company ON legal_information (company_id);



