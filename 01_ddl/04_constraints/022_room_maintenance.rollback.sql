-- MAINTENANCE: room_maintenance
ALTER TABLE room_maintenance
ADD CONSTRAINT fk_room_maintenance FOREIGN KEY (room_id) REFERENCES room (id);

ALTER TABLE room_maintenance
ADD CONSTRAINT fk_maintenance_employee FOREIGN KEY (employee_id) REFERENCES employee (id);
