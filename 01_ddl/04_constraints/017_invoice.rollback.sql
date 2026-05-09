-- BILLING: invoice
ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_customer FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_stay FOREIGN KEY (stay_id) REFERENCES stay (id);
