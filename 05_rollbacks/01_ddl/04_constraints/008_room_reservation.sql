-- SERVICE_DELIVERY: room_reservation
ALTER TABLE room_reservation DROP CONSTRAINT fk_reservation_customer;
ALTER TABLE room_reservation DROP CONSTRAINT fk_room_reservation;
