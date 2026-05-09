-- MAINTENANCE: maintenance_usage
ALTER TABLE maintenance_usage
ADD CONSTRAINT fk_maintenance_usage_base FOREIGN KEY (room_maintenance_id) REFERENCES room_maintenance (id);
