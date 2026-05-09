CREATE TABLE maintenance_remodeling (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_maintenance_id UUID NOT NULL,
  remodeling_description TEXT NOT NULL,
  estimated_budget DECIMAL(12,2) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_maintenance_remodeling UNIQUE (room_maintenance_id),
  CONSTRAINT ck_maintenance_budget CHECK (estimated_budget IS NULL OR estimated_budget >= 0)
);




