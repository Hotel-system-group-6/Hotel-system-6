CREATE TABLE module_screen (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  module_id UUID NOT NULL,
  screen_id UUID NOT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_module_screen UNIQUE (module_id, screen_id)
);



