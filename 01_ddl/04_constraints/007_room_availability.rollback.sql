-- SERVICE_DELIVERY: room_availability
ALTER TABLE room_availability
ADD CONSTRAINT fk_room_availability FOREIGN KEY (room_id) REFERENCES room (id);
