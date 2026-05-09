-- SERVICE_DELIVERY: room_cancellation
ALTER TABLE room_cancellation
ADD CONSTRAINT fk_cancellation_reservation FOREIGN KEY (room_reservation_id) REFERENCES room_reservation (id);
