ALTER TABLE IF EXISTS parameterization.customer SET SCHEMA public;
ALTER TABLE IF EXISTS parameterization.price SET SCHEMA public;
ALTER TABLE IF EXISTS parameterization.company SET SCHEMA public;
ALTER TABLE IF EXISTS parameterization.legal_information SET SCHEMA public;
ALTER TABLE IF EXISTS parameterization.employee SET SCHEMA public;
ALTER TABLE IF EXISTS parameterization.day_type SET SCHEMA public;
ALTER TABLE IF EXISTS parameterization.payment_method SET SCHEMA public;

ALTER TABLE IF EXISTS distribution.branch SET SCHEMA public;
ALTER TABLE IF EXISTS distribution.room SET SCHEMA public;
ALTER TABLE IF EXISTS distribution.room_type SET SCHEMA public;
ALTER TABLE IF EXISTS distribution.room_status SET SCHEMA public;

ALTER TABLE IF EXISTS service_delivery.room_reservation SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.room_cancellation SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.room_availability SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.room_catalog SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.check_in SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.check_out SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.stay SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.product_sale SET SCHEMA public;
ALTER TABLE IF EXISTS service_delivery.service_sale SET SCHEMA public;

ALTER TABLE IF EXISTS billing.pre_invoice SET SCHEMA public;
ALTER TABLE IF EXISTS billing.partial_payment SET SCHEMA public;
ALTER TABLE IF EXISTS billing.invoice SET SCHEMA public;
ALTER TABLE IF EXISTS billing.purchase_detail SET SCHEMA public;

ALTER TABLE IF EXISTS inventory.product SET SCHEMA public;
ALTER TABLE IF EXISTS inventory.service SET SCHEMA public;
ALTER TABLE IF EXISTS inventory.supplier SET SCHEMA public;
ALTER TABLE IF EXISTS inventory.product_tracking SET SCHEMA public;
ALTER TABLE IF EXISTS inventory.inventory_availability SET SCHEMA public;

ALTER TABLE IF EXISTS notification.promotion SET SCHEMA public;
ALTER TABLE IF EXISTS notification.alert SET SCHEMA public;
ALTER TABLE IF EXISTS notification.terms_condition SET SCHEMA public;
ALTER TABLE IF EXISTS notification.customer_loyalty SET SCHEMA public;

ALTER TABLE IF EXISTS security.person SET SCHEMA public;
ALTER TABLE IF EXISTS security.app_user SET SCHEMA public;
ALTER TABLE IF EXISTS security.app_role SET SCHEMA public;
ALTER TABLE IF EXISTS security.permission SET SCHEMA public;
ALTER TABLE IF EXISTS security.module SET SCHEMA public;
ALTER TABLE IF EXISTS security.screen SET SCHEMA public;
ALTER TABLE IF EXISTS security.app_user_role SET SCHEMA public;
ALTER TABLE IF EXISTS security.role_permission SET SCHEMA public;
ALTER TABLE IF EXISTS security.module_screen SET SCHEMA public;

ALTER TABLE IF EXISTS maintenance.room_maintenance SET SCHEMA public;
ALTER TABLE IF EXISTS maintenance.maintenance_usage SET SCHEMA public;
ALTER TABLE IF EXISTS maintenance.maintenance_remodeling SET SCHEMA public;
ALTER TABLE IF EXISTS maintenance.maintenance_dashboard SET SCHEMA public;
