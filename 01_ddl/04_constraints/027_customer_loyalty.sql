-- NOTIFICATION: customer_loyalty
ALTER TABLE customer_loyalty
ADD CONSTRAINT fk_customer_loyalty FOREIGN KEY (customer_id) REFERENCES customer (id);
