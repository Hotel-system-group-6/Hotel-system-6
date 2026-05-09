-- BILLING: partial_payment
ALTER TABLE partial_payment DROP CONSTRAINT fk_payment_reservation;
ALTER TABLE partial_payment DROP CONSTRAINT fk_payment_invoice;
ALTER TABLE partial_payment DROP CONSTRAINT fk_payment_method;
