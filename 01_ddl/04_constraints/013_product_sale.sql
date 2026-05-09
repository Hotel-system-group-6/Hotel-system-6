-- SERVICE_DELIVERY: product_sale
ALTER TABLE product_sale
ADD CONSTRAINT fk_product_sale_stay FOREIGN KEY (stay_id) REFERENCES stay (id);

ALTER TABLE product_sale
ADD CONSTRAINT fk_product_sale_product FOREIGN KEY (product_id) REFERENCES product (id);
