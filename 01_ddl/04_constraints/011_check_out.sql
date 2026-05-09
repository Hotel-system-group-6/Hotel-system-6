-- SERVICE_DELIVERY: check_out
ALTER TABLE check_out
ADD CONSTRAINT fk_check_out_stay FOREIGN KEY (stay_id) REFERENCES stay (id);

ALTER TABLE check_out
ADD CONSTRAINT fk_check_out_employee FOREIGN KEY (employee_id) REFERENCES employee (id);
