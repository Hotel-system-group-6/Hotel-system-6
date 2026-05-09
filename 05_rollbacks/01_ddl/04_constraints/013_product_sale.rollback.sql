-- SERVICE_DELIVERY: product_sale
ALTER TABLE product_sale DROP CONSTRAINT fk_product_sale_stay;
ALTER TABLE product_sale DROP CONSTRAINT fk_product_sale_product;
