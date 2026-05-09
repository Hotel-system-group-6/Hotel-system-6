-- MAINTENANCE: room_maintenance
ALTER TABLE room_maintenance DROP CONSTRAINT fk_room_maintenance;
ALTER TABLE room_maintenance DROP CONSTRAINT fk_maintenance_employee;
