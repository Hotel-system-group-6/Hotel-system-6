-- INVENTORY: inventory_availability
ALTER TABLE inventory_availability
ADD CONSTRAINT fk_availability_inventory_product FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE inventory_availability
ADD CONSTRAINT fk_availability_inventory_service FOREIGN KEY (service_id) REFERENCES service (id);
