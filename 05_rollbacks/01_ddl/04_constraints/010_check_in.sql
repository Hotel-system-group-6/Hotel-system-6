-- SERVICE_DELIVERY: check_in
ALTER TABLE check_in DROP CONSTRAINT fk_check_in_reservation;
ALTER TABLE check_in DROP CONSTRAINT fk_check_in_employee;
