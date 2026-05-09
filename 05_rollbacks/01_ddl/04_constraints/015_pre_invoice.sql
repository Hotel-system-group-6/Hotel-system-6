-- BILLING: pre_invoice
ALTER TABLE pre_invoice DROP CONSTRAINT fk_pre_invoice_stay;
ALTER TABLE pre_invoice DROP CONSTRAINT fk_pre_invoice_reservation;
ALTER TABLE pre_invoice DROP CONSTRAINT fk_pre_invoice_customer;
