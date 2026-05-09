-- SERVICE_DELIVERY: check_in
ALTER TABLE check_in
ADD CONSTRAINT fk_check_in_reservation FOREIGN KEY (room_reservation_id) REFERENCES room_reservation (id);

ALTER TABLE check_in
ADD CONSTRAINT fk_check_in_employee FOREIGN KEY (employee_id) REFERENCES employee (id);
