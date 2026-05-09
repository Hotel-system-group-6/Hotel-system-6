-- SERVICE_DELIVERY: service_sale
ALTER TABLE service_sale DROP CONSTRAINT fk_service_sale_stay;
ALTER TABLE service_sale DROP CONSTRAINT fk_service_sale_service;
