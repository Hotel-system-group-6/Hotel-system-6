-- INVENTORY: product
ALTER TABLE product
ADD CONSTRAINT fk_product_supplier FOREIGN KEY (supplier_id) REFERENCES supplier (id);
