-- SERVICE_DELIVERY: room_catalog
ALTER TABLE room_catalog
ADD CONSTRAINT fk_room_catalog FOREIGN KEY (room_id) REFERENCES room (id);
