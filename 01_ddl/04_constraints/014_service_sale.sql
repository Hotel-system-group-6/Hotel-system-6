-- SERVICE_DELIVERY: service_sale
ALTER TABLE service_sale
ADD CONSTRAINT fk_service_sale_stay FOREIGN KEY (stay_id) REFERENCES stay (id);

ALTER TABLE service_sale
ADD CONSTRAINT fk_service_sale_service FOREIGN KEY (service_id) REFERENCES service (id);
