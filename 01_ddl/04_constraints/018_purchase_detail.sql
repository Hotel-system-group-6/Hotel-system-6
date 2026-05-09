-- BILLING: purchase_detail
ALTER TABLE purchase_detail
ADD CONSTRAINT fk_detail_invoice FOREIGN KEY (invoice_id) REFERENCES invoice (id);

ALTER TABLE purchase_detail
ADD CONSTRAINT fk_detail_product FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE purchase_detail
ADD CONSTRAINT fk_detail_service FOREIGN KEY (service_id) REFERENCES service (id);
