-- ========================================================
-- CONSTRAINTS Rollback - Remove all foreign keys
-- ========================================================

ALTER TABLE price DROP CONSTRAINT fk_price_room_type;
ALTER TABLE price DROP CONSTRAINT fk_price_day_type;
ALTER TABLE legal_information DROP CONSTRAINT fk_legal_information_company;
ALTER TABLE employee DROP CONSTRAINT fk_employee_person;

-- ========================================================
-- DISTRIBUTION Domain
-- ========================================================

ALTER TABLE branch DROP CONSTRAINT fk_branch_company;
ALTER TABLE room DROP CONSTRAINT fk_room_branch;
ALTER TABLE room DROP CONSTRAINT fk_room_type;
ALTER TABLE room DROP CONSTRAINT fk_room_status;

-- ========================================================
-- SERVICE_DELIVERY Domain
-- ========================================================

ALTER TABLE room_catalog DROP CONSTRAINT fk_room_catalog;
ALTER TABLE room_availability DROP CONSTRAINT fk_room_availability;
ALTER TABLE room_reservation DROP CONSTRAINT fk_reservation_customer;
ALTER TABLE room_reservation DROP CONSTRAINT fk_room_reservation;
ALTER TABLE room_cancellation DROP CONSTRAINT fk_cancellation_reservation;
ALTER TABLE check_in DROP CONSTRAINT fk_check_in_reservation;
ALTER TABLE check_in DROP CONSTRAINT fk_check_in_employee;
ALTER TABLE check_out DROP CONSTRAINT fk_check_out_stay;
ALTER TABLE check_out DROP CONSTRAINT fk_check_out_employee;
ALTER TABLE stay DROP CONSTRAINT fk_stay_reservation;
ALTER TABLE stay DROP CONSTRAINT fk_stay_customer;
ALTER TABLE stay DROP CONSTRAINT fk_stay_room;
ALTER TABLE product_sale DROP CONSTRAINT fk_product_sale_stay;
ALTER TABLE product_sale DROP CONSTRAINT fk_product_sale_product;
ALTER TABLE service_sale DROP CONSTRAINT fk_service_sale_stay;
ALTER TABLE service_sale DROP CONSTRAINT fk_service_sale_service;

-- ========================================================
-- BILLING Domain
-- ========================================================

ALTER TABLE pre_invoice DROP CONSTRAINT fk_pre_invoice_stay;
ALTER TABLE pre_invoice DROP CONSTRAINT fk_pre_invoice_reservation;
ALTER TABLE pre_invoice DROP CONSTRAINT fk_pre_invoice_customer;
ALTER TABLE partial_payment DROP CONSTRAINT fk_payment_reservation;
ALTER TABLE partial_payment DROP CONSTRAINT fk_payment_invoice;
ALTER TABLE partial_payment DROP CONSTRAINT fk_payment_method;
ALTER TABLE invoice DROP CONSTRAINT fk_invoice_customer;
ALTER TABLE invoice DROP CONSTRAINT fk_invoice_stay;
ALTER TABLE purchase_detail DROP CONSTRAINT fk_detail_invoice;
ALTER TABLE purchase_detail DROP CONSTRAINT fk_detail_product;
ALTER TABLE purchase_detail DROP CONSTRAINT fk_detail_service;

-- ========================================================
-- INVENTORY Domain
-- ========================================================

ALTER TABLE product DROP CONSTRAINT fk_product_supplier;
ALTER TABLE product_tracking DROP CONSTRAINT fk_product_tracking;
ALTER TABLE inventory_availability DROP CONSTRAINT fk_availability_inventory_product;
ALTER TABLE inventory_availability DROP CONSTRAINT fk_availability_inventory_service;

-- ========================================================
-- MAINTENANCE Domain
-- ========================================================

ALTER TABLE room_maintenance DROP CONSTRAINT fk_room_maintenance;
ALTER TABLE room_maintenance DROP CONSTRAINT fk_maintenance_employee;
ALTER TABLE maintenance_usage DROP CONSTRAINT fk_maintenance_usage_base;
ALTER TABLE maintenance_remodeling DROP CONSTRAINT fk_maintenance_remodeling_base;
ALTER TABLE maintenance_dashboard DROP CONSTRAINT fk_maintenance_dashboard_branch;

-- ========================================================
-- NOTIFICATION Domain
-- ========================================================

ALTER TABLE alert DROP CONSTRAINT fk_alert_customer;
ALTER TABLE alert DROP CONSTRAINT fk_alert_reservation;
ALTER TABLE customer_loyalty DROP CONSTRAINT fk_customer_loyalty;

-- ========================================================
-- SECURITY Domain
-- ========================================================

ALTER TABLE app_user DROP CONSTRAINT fk_app_user_person;
ALTER TABLE screen DROP CONSTRAINT fk_screen_module;
ALTER TABLE app_user_role DROP CONSTRAINT fk_app_user_role_app_user;
ALTER TABLE app_user_role DROP CONSTRAINT fk_app_user_role_app_role;
ALTER TABLE role_permission DROP CONSTRAINT fk_role_permission_app_role;
ALTER TABLE role_permission DROP CONSTRAINT fk_role_permission_permission;
ALTER TABLE module_screen DROP CONSTRAINT fk_module_screen_module;
ALTER TABLE module_screen DROP CONSTRAINT fk_module_screen_screen;
