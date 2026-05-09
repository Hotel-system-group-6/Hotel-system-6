CREATE TABLE screen (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  module_id UUID NOT NULL,
  name VARCHAR(120) NOT NULL,
  description VARCHAR(255) NULL,
  path VARCHAR(180) NOT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_screen_module_path UNIQUE (module_id, path)
);



