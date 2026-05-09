CREATE TABLE maintenance_usage (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  room_maintenance_id UUID NOT NULL,
  usage_reason VARCHAR(160) NOT NULL,
  activity_detail TEXT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_maintenance_usage UNIQUE (room_maintenance_id)
);



