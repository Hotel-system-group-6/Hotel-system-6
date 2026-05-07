CREATE TABLE role_permission (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  role_id UUID NOT NULL,
  permission_id UUID NOT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_role_permission UNIQUE (role_id, permission_id),
  CONSTRAINT fk_role_permission_app_role FOREIGN KEY (role_id) REFERENCES app_role (id),
  CONSTRAINT fk_role_permission_permission FOREIGN KEY (permission_id) REFERENCES permission (id)
);



