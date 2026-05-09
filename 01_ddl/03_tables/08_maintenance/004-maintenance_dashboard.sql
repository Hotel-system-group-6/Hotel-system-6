CREATE TABLE maintenance_dashboard (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  branch_id UUID NOT NULL,
  total_rooms INTEGER NOT NULL DEFAULT 0,
  available_rooms INTEGER NOT NULL DEFAULT 0,
  occupied_rooms INTEGER NOT NULL DEFAULT 0,
  maintenance_rooms INTEGER NOT NULL DEFAULT 0,
  snapshot_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id)
);

CREATE INDEX ix_maintenance_dashboard_branch_date ON maintenance_dashboard (branch_id, snapshot_at);



