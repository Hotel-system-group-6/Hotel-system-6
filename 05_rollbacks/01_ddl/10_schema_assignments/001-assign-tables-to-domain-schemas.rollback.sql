ALTER TABLE IF EXISTS maintenance.maintenance_dashboard SET SCHEMA public;
ALTER TABLE IF EXISTS maintenance.maintenance_remodeling SET SCHEMA public;
ALTER TABLE IF EXISTS maintenance.maintenance_usage SET SCHEMA public;
ALTER TABLE IF EXISTS maintenance.room_maintenance SET SCHEMA public;

ALTER TABLE IF EXISTS communication_loyalty.customer_loyalty SET SCHEMA public;
ALTER TABLE IF EXISTS communication_loyalty.terms_condition SET SCHEMA public;
ALTER TABLE IF EXISTS communication_loyalty.alert SET SCHEMA public;
ALTER TABLE IF EXISTS communication_loyalty.promotion SET SCHEMA public;

ALTER TABLE IF EXISTS billing_payments.purchase_detail SET SCHEMA public;
ALTER TABLE IF EXISTS billing_payments.partial_payment SET SCHEMA public;
ALTER TABLE IF EXISTS billing_payments.invoice SET SCHEMA public;
ALTER TABLE IF EXISTS billing_payments.pre_invoice SET SCHEMA public;
ALTER TABLE IF EXISTS billing_payments.service_sale SET SCHEMA public;
ALTER TABLE IF EXISTS billing_payments.product_sale SET SCHEMA public;
ALTER TABLE IF EXISTS billing_payments.payment_method SET SCHEMA public;

ALTER TABLE IF EXISTS inventory_services.inventory_availability SET SCHEMA public;
ALTER TABLE IF EXISTS inventory_services.product_tracking SET SCHEMA public;
ALTER TABLE IF EXISTS inventory_services.service SET SCHEMA public;
ALTER TABLE IF EXISTS inventory_services.product SET SCHEMA public;
ALTER TABLE IF EXISTS inventory_services.supplier SET SCHEMA public;

ALTER TABLE IF EXISTS rooms_reservations.check_out SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.check_in SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.stay SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room_catalog SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room_availability SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room_cancellation SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room_reservation SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.price SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room_status SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.room_type SET SCHEMA public;
ALTER TABLE IF EXISTS rooms_reservations.day_type SET SCHEMA public;

ALTER TABLE IF EXISTS company_operations.branch SET SCHEMA public;
ALTER TABLE IF EXISTS company_operations.employee SET SCHEMA public;
ALTER TABLE IF EXISTS company_operations.legal_information SET SCHEMA public;
ALTER TABLE IF EXISTS company_operations.company SET SCHEMA public;

ALTER TABLE IF EXISTS identity_security.module_screen SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.role_permission SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.app_user_role SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.app_user SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.screen SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.module SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.permission SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.app_role SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.person SET SCHEMA public;
ALTER TABLE IF EXISTS identity_security.customer SET SCHEMA public;

