CREATE TABLE room_type (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  name VARCHAR(80) NOT NULL,
  description VARCHAR(255) NULL,
  base_capacity SMALLINT NOT NULL,
  max_capacity SMALLINT NOT NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_room_type_name UNIQUE (name),
  CONSTRAINT ck_room_type_capacity CHECK (max_capacity >= base_capacity)
);



