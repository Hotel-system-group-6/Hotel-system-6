-- SERVICE_DELIVERY: stay
ALTER TABLE stay DROP CONSTRAINT fk_stay_reservation;
ALTER TABLE stay DROP CONSTRAINT fk_stay_customer;
ALTER TABLE stay DROP CONSTRAINT fk_stay_room;
