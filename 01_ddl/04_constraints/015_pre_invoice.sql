-- BILLING: pre_invoice
ALTER TABLE pre_invoice
ADD CONSTRAINT fk_pre_invoice_stay FOREIGN KEY (stay_id) REFERENCES stay (id);

ALTER TABLE pre_invoice
ADD CONSTRAINT fk_pre_invoice_reservation FOREIGN KEY (room_reservation_id) REFERENCES room_reservation (id);

ALTER TABLE pre_invoice
ADD CONSTRAINT fk_pre_invoice_customer FOREIGN KEY (customer_id) REFERENCES customer (id);
