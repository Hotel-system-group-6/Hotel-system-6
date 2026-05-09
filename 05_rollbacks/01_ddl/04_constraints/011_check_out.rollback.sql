-- SERVICE_DELIVERY: check_out
ALTER TABLE check_out DROP CONSTRAINT fk_check_out_stay;
ALTER TABLE check_out DROP CONSTRAINT fk_check_out_employee;
