-- SERVICE_DELIVERY: stay
ALTER TABLE stay
ADD CONSTRAINT fk_stay_reservation FOREIGN KEY (room_reservation_id) REFERENCES room_reservation (id);

ALTER TABLE stay
ADD CONSTRAINT fk_stay_customer FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE stay
ADD CONSTRAINT fk_stay_room FOREIGN KEY (room_id) REFERENCES room (id);
