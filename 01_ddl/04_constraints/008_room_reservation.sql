-- SERVICE_DELIVERY: room_reservation
ALTER TABLE room_reservation
ADD CONSTRAINT fk_reservation_customer FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE room_reservation
ADD CONSTRAINT fk_room_reservation FOREIGN KEY (room_id) REFERENCES room (id);
