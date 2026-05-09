-- BILLING: purchase_detail
ALTER TABLE purchase_detail DROP CONSTRAINT fk_detail_invoice;
ALTER TABLE purchase_detail DROP CONSTRAINT fk_detail_product;
ALTER TABLE purchase_detail DROP CONSTRAINT fk_detail_service;
