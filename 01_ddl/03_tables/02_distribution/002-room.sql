CREATE TABLE room (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  branch_id UUID NOT NULL,
  room_type_id UUID NOT NULL,
  room_status_id UUID NOT NULL,
  number VARCHAR(20) NOT NULL,
  floor SMALLINT NULL,
  capacity SMALLINT NOT NULL,
  description VARCHAR(255) NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_room_branch_number UNIQUE (branch_id, number),
  CONSTRAINT fk_room_branch FOREIGN KEY (branch_id) REFERENCES branch (id),
  CONSTRAINT fk_room_type FOREIGN KEY (room_type_id) REFERENCES room_type (id),
  CONSTRAINT fk_room_status FOREIGN KEY (room_status_id) REFERENCES room_status (id)
);

CREATE INDEX ix_room_type ON room (room_type_id);
CREATE INDEX ix_room_status ON room (room_status_id);




