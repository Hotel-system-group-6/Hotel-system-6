-- MAINTENANCE: maintenance_remodeling
ALTER TABLE maintenance_remodeling
ADD CONSTRAINT fk_maintenance_remodeling_base FOREIGN KEY (room_maintenance_id) REFERENCES room_maintenance (id);
