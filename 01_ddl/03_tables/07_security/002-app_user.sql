CREATE TABLE app_user (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  person_id UUID NOT NULL,
  username VARCHAR(80) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  last_access_at TIMESTAMP NULL,
  blocked BOOLEAN NOT NULL DEFAULT FALSE,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_app_user_person UNIQUE (person_id),
  CONSTRAINT uk_app_user_username UNIQUE (username)
);



