-- BILLING: partial_payment
ALTER TABLE partial_payment
ADD CONSTRAINT fk_payment_reservation FOREIGN KEY (room_reservation_id) REFERENCES room_reservation (id);

ALTER TABLE partial_payment
ADD CONSTRAINT fk_payment_invoice FOREIGN KEY (invoice_id) REFERENCES invoice (id);

ALTER TABLE partial_payment
ADD CONSTRAINT fk_payment_method FOREIGN KEY (payment_method_id) REFERENCES payment_method (id);
