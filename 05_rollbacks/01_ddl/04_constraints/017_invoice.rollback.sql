-- BILLING: invoice
ALTER TABLE invoice DROP CONSTRAINT fk_invoice_customer;
ALTER TABLE invoice DROP CONSTRAINT fk_invoice_stay;
