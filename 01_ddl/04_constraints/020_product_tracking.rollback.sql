-- INVENTORY: product_tracking
ALTER TABLE product_tracking
ADD CONSTRAINT fk_product_tracking FOREIGN KEY (product_id) REFERENCES product (id);
