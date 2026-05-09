CREATE TABLE alert (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  customer_id UUID NULL,
  room_reservation_id UUID NULL,
  title VARCHAR(160) NOT NULL,
  mensaje TEXT NOT NULL,
  channel VARCHAR(60) NOT NULL,
  sent_at TIMESTAMP NULL,
  created_by UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_by UUID NULL,
  updated_at TIMESTAMPTZ NULL,
  deleted_by UUID NULL,
  deleted_at TIMESTAMPTZ NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id)
);

CREATE INDEX ix_alert_customer ON alert (customer_id);
CREATE INDEX ix_alert_reservation ON alert (room_reservation_id);




