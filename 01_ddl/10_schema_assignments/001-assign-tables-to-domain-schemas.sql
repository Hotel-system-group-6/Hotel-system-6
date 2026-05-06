ALTER TABLE IF EXISTS customer SET SCHEMA identity_security;
ALTER TABLE IF EXISTS person SET SCHEMA identity_security;
ALTER TABLE IF EXISTS app_role SET SCHEMA identity_security;
ALTER TABLE IF EXISTS permission SET SCHEMA identity_security;
ALTER TABLE IF EXISTS module SET SCHEMA identity_security;
ALTER TABLE IF EXISTS screen SET SCHEMA identity_security;
ALTER TABLE IF EXISTS app_user SET SCHEMA identity_security;
ALTER TABLE IF EXISTS app_user_role SET SCHEMA identity_security;
ALTER TABLE IF EXISTS role_permission SET SCHEMA identity_security;
ALTER TABLE IF EXISTS module_screen SET SCHEMA identity_security;

ALTER TABLE IF EXISTS company SET SCHEMA company_operations;
ALTER TABLE IF EXISTS legal_information SET SCHEMA company_operations;
ALTER TABLE IF EXISTS employee SET SCHEMA company_operations;
ALTER TABLE IF EXISTS branch SET SCHEMA company_operations;

ALTER TABLE IF EXISTS day_type SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room_type SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room_status SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS price SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room_reservation SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room_cancellation SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room_availability SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS room_catalog SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS stay SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS check_in SET SCHEMA rooms_reservations;
ALTER TABLE IF EXISTS check_out SET SCHEMA rooms_reservations;

ALTER TABLE IF EXISTS supplier SET SCHEMA inventory_services;
ALTER TABLE IF EXISTS product SET SCHEMA inventory_services;
ALTER TABLE IF EXISTS service SET SCHEMA inventory_services;
ALTER TABLE IF EXISTS product_tracking SET SCHEMA inventory_services;
ALTER TABLE IF EXISTS inventory_availability SET SCHEMA inventory_services;

ALTER TABLE IF EXISTS payment_method SET SCHEMA billing_payments;
ALTER TABLE IF EXISTS product_sale SET SCHEMA billing_payments;
ALTER TABLE IF EXISTS service_sale SET SCHEMA billing_payments;
ALTER TABLE IF EXISTS pre_invoice SET SCHEMA billing_payments;
ALTER TABLE IF EXISTS invoice SET SCHEMA billing_payments;
ALTER TABLE IF EXISTS partial_payment SET SCHEMA billing_payments;
ALTER TABLE IF EXISTS purchase_detail SET SCHEMA billing_payments;

ALTER TABLE IF EXISTS promotion SET SCHEMA communication_loyalty;
ALTER TABLE IF EXISTS alert SET SCHEMA communication_loyalty;
ALTER TABLE IF EXISTS terms_condition SET SCHEMA communication_loyalty;
ALTER TABLE IF EXISTS customer_loyalty SET SCHEMA communication_loyalty;

ALTER TABLE IF EXISTS room_maintenance SET SCHEMA maintenance;
ALTER TABLE IF EXISTS maintenance_usage SET SCHEMA maintenance;
ALTER TABLE IF EXISTS maintenance_remodeling SET SCHEMA maintenance;
ALTER TABLE IF EXISTS maintenance_dashboard SET SCHEMA maintenance;

