CREATE TABLE app_user_role (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  app_user_id UUID NOT NULL,
  role_id UUID NOT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_app_user_role UNIQUE (app_user_id, role_id)
);



